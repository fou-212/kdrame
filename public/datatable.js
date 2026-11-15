const form = document.getElementById('form');
const tab = document.getElementById('tab');


async function getTab() {
    const help = document.getElementById('q').value.trim();
    const help2 = document.getElementById('atr').value;
    if (help === '') q = '';
    else q = '?q=' + help + '&atr=' + help2;
    document.getElementById('csv').href = '/api/drame.csv' + q;
    document.getElementById('json').href = '/api/drame.json' + q;

    const help3 = await fetch('/api/drame' + q);
    const data = await help3.json();

    tab.innerHTML = '';
    for (const d of data) {
      const row = tab.insertRow();
      const atr = [
        d.Naziv,
        d.Godina,
        d.Broj_epizoda,
        d.Ocjena,
        d.Tv_kuca,
        d.Redatelj.Ime + ' ' + d.Redatelj.Prezime,
        d.Zanr.join(', '),
        d.Glumci.map((g) => g.Ime + ' ' + g.Prezime).join(', '),
      ];
      for (const a of atr) {
        row.insertCell().textContent = a;
      }
    }

}

form.addEventListener('submit', (e) => {
  e.preventDefault();
  getTab();
});

getTab();