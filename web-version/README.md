# Pénzügy Elemző - Webes verzió (PWA)

Ez a webes verzió azonnal használható Windows 11 Home-on, és telepíthető iPhone-ra is PWA-ként!

## 🚀 Gyors használat

### Böngészőből (Windows-on)

1. Nyisd meg az `index.html` fájlt böngészőben
2. Kész! Azonnal használhatod

### 📱 Telefonon való megnyitás

**Lásd a részletes útmutatót: [`TELEFON_MEGNYITAS.md`](TELEFON_MEGNYITAS.md)**

**Gyors módszer:**
1. Dupla kattintás a `start-server.bat` fájlra (vagy `start-server.ps1` PowerShell-ben)
2. Jegyezd meg a megjelenő IP címet (pl. `192.168.1.100`)
3. Az iPhone-on nyisd meg Safari-ban: `http://[IP-cím]:8000`
4. **Fontos**: Mindkét eszköznek ugyanazon a WiFi-n kell lennie!

**Vagy online feltöltés:**
- Netlify Drop: https://app.netlify.com/drop (húzd be a mappát)
- GitHub Pages (ingyenes hosting)

### iPhone-ra telepítés (PWA)

1. Nyisd meg az alkalmazást **Safari**-ban az iPhone-on
2. Kattints a **Share** gombra (⬆️)
3. Válaszd: **"Add to Home Screen"** (Hozzáadás kezdőképernyőhöz)
4. Kész! Mostantól úgy néz ki, mint egy natív alkalmazás

## 📁 Fájlok

- `index.html` - Fő HTML fájl
- `styles.css` - Stílusok
- `app.js` - Alkalmazás logika
- `manifest.json` - PWA konfiguráció

## 💾 Adattárolás

Az adatok a böngésző **LocalStorage**-jában vannak mentve. Az alkalmazás bezárása után is megmaradnak.

## 🎨 Funkciók

- ✅ Jelenlegi tőke egyenleg megadása
- ✅ Diákhitel egyenleg megadása
- ✅ Fix kiadások/bevételek rögzítése
- ✅ Kategóriák létrehozása
- ✅ Diákhitel tartozás jövőbeli alakulása (grafikon)

## 🔧 Testreszabás

A `styles.css` fájlban módosíthatod a színeket és stílusokat.
A `app.js` fájlban módosíthatod a logikát.

## 📱 Optimalizálva

- iPhone 15 Pro és más iOS eszközök
- Responsive design
- PWA támogatás
- Offline működés (böngésző cache)

## 🌐 Online használat

Ha szeretnéd online elérhetővé tenni, töltsd fel egy web hosting szolgáltatásra (pl. GitHub Pages, Netlify, Vercel).

