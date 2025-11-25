# 📤 GitHub-ra feltöltés útmutató

## 🚀 Gyors útmutató

### 1. GitHub fiók létrehozása (ha még nincs)

1. Menj a https://github.com oldalra
2. Kattints a **"Sign up"** gombra
3. Regisztrálj (ingyenes)

---

### 2. Új repository létrehozása

1. Bejelentkezés után kattints a jobb felső sarokban a **"+"** gombra
2. Válaszd: **"New repository"**
3. Töltsd ki:
   - **Repository name**: `penzugy-elemzo` (vagy bármi más név)
   - **Description**: "Személyes pénzügy elemző iOS/web alkalmazás"
   - **Public** vagy **Private** (válaszd, amit szeretnél)
   - **NE** pipáld be az "Initialize with README" opciót (már van README)
4. Kattints a **"Create repository"** gombra

---

### 3. Git telepítése (ha még nincs)

**Windows-on:**

1. Töltsd le a Git-et: https://git-scm.com/download/win
2. Telepítsd (alapbeállításokkal jó)
3. Nyisd meg a **Git Bash**-t vagy **PowerShell**-t

**Ellenőrzés:**
```powershell
git --version
```
Ha verziószámot ír ki, akkor működik! ✅

---

### 4. Projekt feltöltése GitHub-ra

#### A. Git inicializálása a projektben

1. Nyisd meg a **PowerShell**-t vagy **Git Bash**-t
2. Navigálj a projekt mappába:
   ```powershell
   cd "C:\Users\koszt\OneDrive\Asztali gép\AI projects\IOS App"
   ```

3. Git inicializálása:
   ```powershell
   git init
   ```

4. Összes fájl hozzáadása:
   ```powershell
   git add .
   ```

5. Első commit:
   ```powershell
   git commit -m "Első verzió: Pénzügy elemző alkalmazás"
   ```

#### B. GitHub repository-hoz csatlakozás

1. A GitHub-on másold ki a repository URL-jét:
   - Kattints a zöld **"Code"** gombra
   - Másold ki a HTTPS URL-t (pl. `https://github.com/felhasznalonev/penzugy-elemzo.git`)

2. Add hozzá a remote repository-t:
   ```powershell
   git remote add origin https://github.com/FELHASZNALONEV/REPOSITORY-NEV.git
   ```
   (Cseréld ki a saját adataidra!)

3. Feltöltés:
   ```powershell
   git branch -M main
   git push -u origin main
   ```

4. Be kell jelentkezned a GitHub-ba (ha kéri)

---

## 🌐 GitHub Pages beállítása (Online elérhetővé tétel)

Miután feltöltötted a projektet:

### 1. GitHub Pages aktiválása

1. Menj a repository oldalára a GitHub-on
2. Kattints a **"Settings"** tabra
3. Görgess le a **"Pages"** szekcióhoz
4. **Source** alatt válaszd: **"Deploy from a branch"**
5. **Branch** alatt válaszd: **"main"** és **"/ (root)"**
6. Kattints a **"Save"** gombra

### 2. Webes verzió elérhetővé tétele

A GitHub Pages alapértelmezetten a repository gyökerét szolgálja ki. A webes verzió eléréséhez két lehetőség van:

#### Opció A: Webes verzió a főoldalon

1. Másold át a `web-version` mappában lévő fájlokat a repository gyökerébe
2. Vagy hozz létre egy `index.html`-t a gyökérben, ami átirányít a `web-version` mappába

#### Opció B: Webes verzió külön útvonalon (Ajánlott)

1. A GitHub Pages automatikusan szolgálja ki a `web-version` mappát is
2. Az alkalmazás elérhető lesz: `https://felhasznalonev.github.io/penzugy-elemzo/web-version/`

**Várj 1-2 percet**, majd próbáld meg megnyitni!

---

## 📱 Használat iPhone-on

1. Nyisd meg Safari-ban: `https://felhasznalonev.github.io/penzugy-elemzo/web-version/`
2. Kattints a **Share** gombra (⬆️)
3. Válaszd: **"Add to Home Screen"**
4. Kész! 🎉

---

## 🔄 Későbbi frissítések feltöltése

Ha módosítod a fájlokat:

```powershell
cd "C:\Users\koszt\OneDrive\Asztali gép\AI projects\IOS App"
git add .
git commit -m "Frissítés leírása"
git push
```

---

## 🛠️ Alternatív: GitHub Desktop (Grafikus felület)

Ha nem szeretsz parancssorban dolgozni:

1. Töltsd le: https://desktop.github.com/
2. Telepítsd
3. Bejelentkezel a GitHub fiókodba
4. **File → Add Local Repository**
5. Válaszd ki a projekt mappát
6. **Publish repository** gomb
7. Kész! 🎉

---

## ❓ Hibaelhárítás

### "fatal: not a git repository"
- Futtasd le: `git init` a projekt mappában

### "remote origin already exists"
- Töröld: `git remote remove origin`
- Add hozzá újra: `git remote add origin [URL]`

### "authentication failed"
- Használj GitHub Personal Access Token-t jelszó helyett
- Vagy használd a GitHub Desktop-ot

### GitHub Pages nem működik
- Várj 2-3 percet (először lassabb)
- Ellenőrizd, hogy a repository **Public**-e (vagy GitHub Pro-d van)
- Nézd meg a Settings → Pages oldalt, hogy van-e hibaüzenet

---

## ✅ Ellenőrző lista

- [ ] GitHub fiók létrehozva
- [ ] Repository létrehozva
- [ ] Git telepítve
- [ ] Projekt inicializálva (`git init`)
- [ ] Fájlok hozzáadva (`git add .`)
- [ ] Commit készítve (`git commit`)
- [ ] Feltöltve GitHub-ra (`git push`)
- [ ] GitHub Pages aktiválva
- [ ] Webes verzió elérhető

---

## 🎯 Gyors parancsok összefoglalása

```powershell
# Első alkalommal
cd "C:\Users\koszt\OneDrive\Asztali gép\AI projects\IOS App"
git init
git add .
git commit -m "Első verzió"
git remote add origin https://github.com/FELHASZNALONEV/REPOSITORY-NEV.git
git branch -M main
git push -u origin main

# Későbbi frissítések
git add .
git commit -m "Frissítés"
git push
```

---

**Kérdések esetén**: Nézd meg a [GitHub dokumentációt](https://docs.github.com/) vagy a [Git dokumentációt](https://git-scm.com/doc)!

