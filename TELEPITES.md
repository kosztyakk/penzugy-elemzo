# iOS Alkalmazás Telepítési Útmutató

## ⚠️ Fontos információk

**iOS alkalmazásokat csak Mac számítógépen lehet fejleszteni és telepíteni**, mert az Xcode csak macOS-en fut. Ha Windows-on vagy, szükséged lesz egy Mac-re vagy Mac hozzáféréssel.

## 📋 Előfeltételek

1. **Mac számítógép** (MacBook, iMac, Mac mini, stb.)
2. **Xcode** (App Store-ból ingyenesen letölthető)
3. **Apple ID** (ingyenes, teszteléshez elég)
4. **iPhone** (iOS 16.0 vagy újabb)

## 🚀 Telepítési lépések

### 1. Xcode telepítése

1. Nyisd meg az **App Store**-t a Mac-en
2. Keress rá: **"Xcode"**
3. Kattints a **"Letöltés"** vagy **"Szerezze be"** gombra
4. Várj, amíg letöltődik (nagy fájl, több GB)

### 2. Projekt létrehozása Xcode-ban

#### Opció A: Új projekt létrehozása (ajánlott)

1. Nyisd meg az **Xcode**-ot
2. Válaszd: **File → New → Project**
3. Válaszd az **iOS** tabot
4. Válaszd: **App**
5. Kattints a **Next** gombra
6. Töltsd ki:
   - **Product Name**: `PersonalFinanceApp`
   - **Interface**: `SwiftUI`
   - **Language**: `Swift`
   - **Storage**: `None` (vagy `SwiftData` ha szeretnéd)
7. Válaszd ki a mentési helyet
8. Kattints a **Create** gombra

#### Opció B: Meglévő fájlok használata

1. Nyisd meg az **Xcode**-ot
2. Válaszd: **File → New → Project**
3. Hozz létre egy új iOS App projektet (lásd Opció A)
4. Töröld a generált `ContentView.swift` fájlt
5. Húzd be a `PersonalFinanceApp.swift` fájlt a projektbe (vagy másold be a tartalmát)

### 3. Kód hozzáadása

1. Ha új projektet hoztál létre, nyisd meg a `PersonalFinanceAppApp.swift` (vagy hasonló nevű) fájlt
2. Cseréld ki a tartalmát a `PersonalFinanceApp.swift` fájl tartalmára
3. Vagy másold be a kódot a megfelelő helyre

### 4. Apple Developer beállítások

1. Az Xcode-ban válaszd: **PersonalFinanceApp** (projekt neve) a bal oldali fájllistában
2. Válaszd a **"Signing & Capabilities"** tabot
3. Kattints a **"Automatically manage signing"** checkboxra
4. Válaszd ki az **Apple ID**-d a **Team** legördülő menüből
   - Ha nincs, kattints a **"Add Account..."** gombra és jelentkezz be

### 5. iPhone csatlakoztatása

1. Csatlakoztasd az **iPhone**-odat a Mac-hez USB kábellel
2. Az iPhone-on engedélyezd a **"Trust This Computer"** opciót, ha kéri
3. Az Xcode-ban a felső sávban válaszd ki az **iPhone**-odat a device listából

### 6. Alkalmazás futtatása/telepítése

1. Az Xcode-ban kattints a **▶️ Play** gombra (vagy nyomd meg `Cmd + R`)
2. Először lehet, hogy az iPhone-on be kell állítanod:
   - **Beállítások → Általános → VPN és eszközkezelés**
   - Válaszd ki a fejlesztői profilodat
   - Kattints a **"Megbízás"** gombra
3. Az alkalmazás telepítődik és elindul az iPhone-on!

## 🔧 Hibaelhárítás

### "No signing certificate" hiba
- Ellenőrizd, hogy be vagy-e jelentkezve az Apple ID-dal az Xcode-ban
- **Xcode → Settings → Accounts** - add hozzá az Apple ID-dat

### "Untrusted Developer" hiba az iPhone-on
- **Beállítások → Általános → VPN és eszközkezelés**
- Válaszd ki a fejlesztői profilodat és kattints **"Megbízás"**

### "Charts" framework hiányzik
- Az alkalmazás iOS 16.0+ verziót igényel
- Az Xcode projekt beállításokban állítsd be a **Deployment Target**-ot **iOS 16.0**-ra

### Build hiba
- Ellenőrizd, hogy minden fájl hozzá van-e adva a projekthez
- Próbáld meg: **Product → Clean Build Folder** (`Shift + Cmd + K`)

## 📱 Alternatív módszerek (ha nincs Mac-ed - Windows 11 Home)

### Opció 1: Cloud Mac szolgáltatások (Fizetős, de működik)

Ezek a szolgáltatások Mac gépet biztosítanak a felhőben, amit böngészőből vagy RDP-vel használhatsz:

- **MacinCloud** (https://www.macincloud.com/)
  - Ár: ~$20-30/hó
  - Dedicated vagy shared Mac
  - Xcode előre telepítve
  
- **MacStadium** (https://www.macstadium.com/)
  - Profi szolgáltatás
  - Magasabb ár, de megbízható

- **AWS EC2 Mac instances** (https://aws.amazon.com/ec2/instance-types/mac/)
  - Per órás fizetés
  - Rugalmas, csak akkor fizetsz, amikor használod

### Opció 2: Valaki más Mac-jének használata

- Kérj segítséget barátodtól/családtagtól, akinek van Mac-je
- Vagy használd egyetemi/irodai Mac-et, ha hozzáférsz

### Opció 3: React Native verzió (Windows-on fejleszthető!)

React Native-tel ugyanazt az alkalmazást Windows-on is fejlesztheted, és iOS-re is buildelheted (de a buildhez továbbra is Mac kell). A fejlesztés Windows-on megy.

### Opció 4: Webes alkalmazás (Azonnal használható!)

Létrehozhatunk egy webes verziót (HTML/CSS/JavaScript), amit:
- Böngészőből használhatsz azonnal
- Telepítheted PWA-ként (Progressive Web App) az iPhone-ra
- Nincs szükség Mac-re vagy Xcode-ra

**Lásd: `web-version` mappa a projektben!**

## ✅ Sikeres telepítés után

Az alkalmazás az iPhone-odon futni fog! Az adatok jelenleg csak a memóriában tárolódnak (alkalmazás bezárásakor törlődnek). Ha szeretnéd, hogy megmaradjanak, később hozzáadhatunk adatpersisztenciát (pl. UserDefaults vagy Core Data).

---

**Kérdések esetén**: Nézd meg az [Apple Developer dokumentációt](https://developer.apple.com/documentation/) vagy az Xcode Help menüt.

