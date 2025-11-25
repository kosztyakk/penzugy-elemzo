# Pénzügy Elemző iOS Alkalmazás

Személyes pénzügy elemző alkalmazás iOS-re (iPhone 15 Pro-hoz is)!

## Funkciók

- ✅ Jelenlegi tőke egyenleg megadása
- ✅ Havi fix kiadások és bevételek rögzítése kategóriákkal
- ✅ Fix kiadások és fix bevételek kategóriák létrehozása
- ✅ Szabad felhasználású diákhitel egyenleg megadása
- ✅ A diákhitel tartozás jövőbeni alakulásának számítása és grafikos ábrázolása

## Technológia

- **SwiftUI** - Modern iOS UI framework
- **Charts** - Grafikus ábrázolás
- **MVVM** - Model-View-ViewModel architektúra

## Telepítés

### iOS alkalmazás (Mac szükséges)
Lásd a [TELEPITES.md](TELEPITES.md) fájlt részletes telepítési útmutatóért.

### Webes verzió (Windows-on is működik!)
A `web-version` mappában található webes alkalmazás, amit azonnal használhatsz böngészőből vagy telepíthetsz iPhone-ra PWA-ként.

**Lásd:** [web-version/README.md](web-version/README.md)

### GitHub-ra feltöltés
Lásd a [GITHUB_FELTOLTES.md](GITHUB_FELTOLTES.md) fájlt részletes útmutatóért.

## Követelmények

- iOS 16.0 vagy újabb
- iPhone (tesztelve iPhone 15 Pro-n)
- Xcode 14.0 vagy újabb (fejlesztéshez)

## Projekt struktúra

```
IOS App/
├── PersonalFinanceApp/
│   └── PersonalFinanceApp.swift    # iOS alkalmazás kód (SwiftUI)
├── web-version/                     # Webes verzió (PWA)
│   ├── index.html
│   ├── styles.css
│   ├── app.js
│   └── manifest.json
├── TELEPITES.md                     # iOS telepítési útmutató
├── GITHUB_FELTOLTES.md              # GitHub feltöltési útmutató
└── README.md                        # Ez a fájl
```

## Használat

1. Add meg a jelenlegi tőke egyenleget
2. Add meg a diákhitel egyenleget
3. Hozz létre kategóriákat (pl. Lakhatás, Étkezés)
4. Add hozzá a fix kiadásokat és bevételeket
5. Nézd meg a diákhitel tartozás jövőbeli alakulását a grafikonon

## Jövőbeli fejlesztések

- [ ] Adatpersisztencia (UserDefaults vagy Core Data)
- [ ] Több grafikon és statisztika
- [ ] Exportálás CSV-be
- [ ] Sötét mód támogatás
- [ ] Widget támogatás

## Licenc

Ez egy személyes projekt.

