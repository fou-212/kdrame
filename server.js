require('dotenv').config();
const express = require('express');
const path = require('path');
const { Pool } = require('pg');

const app = express();
const pool = new Pool();

async function getData() {
  const drame = (await pool.query(`
    SELECT d.id, d.naziv, d.godina, d.broj_epizoda, d.ocjena,
           k.naziv AS tv_kuca, r.ime AS redatelj_ime, r.prezime AS redatelj_prezime
    FROM drama d
    LEFT JOIN tv_kuca k ON k.id = d.tv_kuca_id
    LEFT JOIN redatelj r ON r.id = d.redatelj_id
    ORDER BY d.id`)).rows;

  const zanrovi = (await pool.query(`
    SELECT dz.drama_id, z.naziv
    FROM drama_zanr dz JOIN zanr z ON z.id = dz.zanr_id
    ORDER BY z.naziv`)).rows;

  const glumci = (await pool.query(`
    SELECT dg.drama_id, g.ime, g.prezime
    FROM drama_glumac dg JOIN glumac g ON g.id = dg.glumac_id
    ORDER BY g.id`)).rows;

  return drame.map((d) => ({
    Naziv: d.naziv,
    Godina: d.godina,
    Broj_epizoda: d.broj_epizoda,
    Ocjena: d.ocjena === null ? null : Number(d.ocjena),
    Tv_kuca: d.tv_kuca,
    Redatelj: { Ime: d.redatelj_ime, Prezime: d.redatelj_prezime },
    Zanr: zanrovi.filter((z) => z.drama_id === d.id).map((z) => z.naziv),
    Glumci: glumci
      .filter((g) => g.drama_id === d.id)
      .map((g) => ({ Ime: g.ime, Prezime: g.prezime })),
  }));
}


function myFilter(drame, q, atr) {
  q = (q || '').trim().toLowerCase();

  return drame.filter((d) => {
    const help = {
      naziv: d.Naziv,
      godina: d.Godina,
      broj_epizoda: d.Broj_epizoda,
      ocjena: d.Ocjena,
      tv_kuca: d.Tv_kuca,
      redatelj: d.Redatelj.Ime + ' ' + d.Redatelj.Prezime,
      zanr: d.Zanr.join(' '),
      glumci: d.Glumci.map((g) => g.Ime + ' ' + g.Prezime).join(' '),
    };

    let help2;
    if (atr === 'sve') help2 = Object.values(help);
    else help2 = [help[atr]];

    for (const v of help2) {
      if (String(v).toLowerCase().includes(q)) return true;
    }
    return false;

  });
}


function makeCSV(drame) {
  function help(h) {
    if (h === null || h === undefined) h = '';
    return '"' + String(h).replace(/"/g, '""') + '"';
  }
  const rows = ['naziv,godina,broj_epizoda,ocjena,tv_kuca,redatelj_ime,redatelj_prezime,zanr,glumac_ime,glumac_prezime'];

  for (const d of drame) {
    let glumci;
    if (d.Glumci.length > 0) glumci = d.Glumci;
    else glumci = [{ Ime: '', Prezime: '' }];

    for (const g of glumci) {
      const row = [
        d.Naziv, d.Godina, d.Broj_epizoda, d.Ocjena, d.Tv_kuca,
        d.Redatelj.Ime, d.Redatelj.Prezime, d.Zanr.join(';'), g.Ime, g.Prezime,
      ];
      rows.push(row.map(help).join(','));
    }
  }
  return rows.join('\n') + '\n';
  
}


app.get('/api/drame', async (req, res) => {
    res.json(myFilter(await getData(), req.query.q, req.query.atr));
});

app.get('/api/drame.json', async (req, res) => {
    const data = myFilter(await getData(), req.query.q, req.query.atr);
    res.set('Content-Type', 'application/json; charset=utf-8');
    res.set('Content-Disposition', 'attachment; filename="kdrame.json"');
    res.send(JSON.stringify(data, null, 2));
});

app.get('/api/drame.csv', async (req, res) => {
    const data = myFilter(await getData(), req.query.q, req.query.atr);
    res.set('Content-Type', 'text/csv; charset=utf-8');
    res.set('Content-Disposition', 'attachment; filename="kdrame.csv"');
    res.send(makeCSV(data));
});

for (const f of ['korejske_drame.csv', 'korejske_drame.json', 'schema.json']) {
  app.get('/' + f, (req, res) => res.sendFile(path.join(__dirname, f)));
}



app.use(express.static(path.join(__dirname, 'public')));
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log('http://localhost:' + PORT));