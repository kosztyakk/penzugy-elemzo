# 📱 Hogyan nyisd meg a telefonon?

## 🎯 Legegyszerűbb módszer: Egyszerű web szerver (Ajánlott)

### 1. Python használata (ha telepítve van)

1. Nyisd meg a **PowerShell**-t vagy **Command Prompt**-ot
2. Navigálj a projekt mappába:
   ```powershell
   cd "C:\Users\koszt\OneDrive\Asztali gép\AI projects\IOS App\web-version"
   ```
3. Futtasd a szervert:
   ```powershell
   python -m http.server 8000
   ```
   (Ha Python 2 van: `python -m SimpleHTTPServer 8000`)

4. A számítógéped IP címét megtudod így:
   ```powershell
   ipconfig
   ```
   Keress rá: **IPv4 Address** (pl. `192.168.1.100`)

5. Az iPhone-on nyisd meg a Safari-t és írd be:
   ```
   http://192.168.1.100:8000
   ```
   (Cseréld ki a saját IP címedre!)

6. **Fontos**: Mindkét eszköznek ugyanazon a WiFi hálózaton kell lennie!

---

### 2. Node.js használata (ha telepítve van)

1. Telepítsd a `http-server`-t (ha még nincs):
   ```powershell
   npm install -g http-server
   ```

2. Navigálj a mappába:
   ```powershell
   cd "C:\Users\koszt\OneDrive\Asztali gép\AI projects\IOS App\web-version"
   ```

3. Futtasd:
   ```powershell
   http-server -p 8000
   ```

4. Ugyanaz, mint fent: nyisd meg az iPhone-on a `http://[IP-cím]:8000` címet

---

### 3. VS Code Live Server (ha használod a VS Code-ot)

1. Telepítsd a **Live Server** extension-t a VS Code-ban
2. Jobb klikk az `index.html` fájlon
3. Válaszd: **"Open with Live Server"**
4. Automatikusan megnyílik a böngészőben
5. Az iPhone-on nyisd meg ugyanazt a címet (lásd a VS Code terminálban)

---

## 🌐 Online feltöltés (Ha nincs Python/Node.js)

### GitHub Pages (Ingyenes)

1. Hozz létre egy GitHub repository-t
2. Töltsd fel a `web-version` mappát
3. Settings → Pages → Válaszd ki a `web-version` mappát
4. 1-2 perc után elérhető lesz: `https://[felhasználó].github.io/[repo]/`

### Netlify Drop (Legkönnyebb!)

1. Menj a https://app.netlify.com/drop oldalra
2. Húzd be a `web-version` mappát
3. Azonnal kapod a linket! (pl. `https://random-name-123.netlify.app`)

### Vercel (Ingyenes)

1. Menj a https://vercel.com oldalra
2. Regisztrálj (ingyenes)
3. Töltsd fel a `web-version` mappát
4. Kapod a linket!

---

## 📂 Közvetlen fájl megosztás

### OneDrive megosztás

1. Töltsd fel a `web-version` mappát OneDrive-ba
2. Jobb klikk → **Megosztás** → **Link létrehozása**
3. Az iPhone-on nyisd meg a linket Safari-ban

**⚠️ Figyelem**: OneDrive-ban a HTML fájlok néha nem jelennek meg helyesen. Jobb egy valódi web szervert használni.

---

## 🚀 Gyors megoldás: Egyszerű batch fájl

Létrehoztam egy `start-server.bat` fájlt, amit dupla kattintással futtathatsz!

---

## ✅ Telepítés iPhone-ra (PWA)

Miután megnyitottad Safari-ban:

1. Kattints a **Share** gombra (⬆️) az iPhone-on
2. Görgess le és válaszd: **"Add to Home Screen"** (Hozzáadás kezdőképernyőhöz)
3. Adj neki egy nevet (pl. "Pénzügy")
4. Kattints **"Add"** (Hozzáadás)
5. Mostantól úgy néz ki, mint egy natív alkalmazás! 🎉

---

## 🔧 Hibaelhárítás

### "Nem tudok csatlakozni"
- Ellenőrizd, hogy mindkét eszköz ugyanazon a WiFi-n van
- Nézd meg a tűzfal beállításokat (engedélyezd a 8000-es portot)
- Próbáld másik portot: `python -m http.server 8080`

### "A fájl nem töltődik be"
- Ellenőrizd, hogy a `index.html` fájl a `web-version` mappában van
- Nézd meg a böngésző konzolt (F12) hibákért

### "Nem működik offline"
- A PWA csak akkor működik offline, ha telepítve van (Add to Home Screen)
- Első alkalommal internet kell a betöltéshez

---

## 💡 Ajánlás

**Legegyszerűbb**: Python szerver vagy Netlify Drop

**Hosszú távú**: GitHub Pages vagy Vercel (ingyenes hosting)

