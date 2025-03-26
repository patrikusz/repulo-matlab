# GeoFlight Szimuláció

## Projekt Leírása
Ez a MATLAB szkript egy szimulált repülési útvonalat jelenít meg két, a felhasználó által kiválasztott pont között a térképen. Kiszámítja a távolságot, a becsült repülési időt, és dinamikus animációval jeleníti meg a repülés folyamatát, valós idejű statisztikai frissítésekkel.

## Funkciók
- **Interaktív térkép:** A felhasználó kattintással választhatja ki a kiindulási és célpontokat a térképen.
- **Földrajzi megjelenítés:** Műholdas térképet használ a kiválasztott pontok és a repülési útvonal megjelenítésére.
- **Dinamikus repülési animáció:** Szimulálja a repülési útvonalat egy mozgó repülő ikon segítségével.
- **Utazási statisztikák:** Valós idejű megjelenítés az alábbiakról:
  - Átlagos repülési sebesség
  - Teljes távolság
  - Hátralévő távolság
  - Eltelt idő

## Követelmények
- MATLAB (ajánlott verzió: R2021a vagy újabb)
- Mapping Toolbox

## Használat
1. **Szkript futtatása:** Nyisd meg a szkriptet MATLAB-ban, és futtasd.
2. **Pontok kiválasztása:** Használd a kurzort a térképen két pont kiválasztásához (kiindulási és célpont).
3. **Szimuláció megtekintése:** A repülési animáció automatikusan elindul, és valós időben frissíti az utazási statisztikákat.

## Kód Áttekintése
- **Térkép Inicializálása:**
  - Egy földrajzi tengely objektumot inicializál (`geoaxes`) műholdas térképalappal.
- **Pontok Kiválasztása:**
  - Két földrajzi pontot vesz át a felhasználói bemenetből (`ginput`).
- **Repülési Útvonal Generálása:**
  - Pontokat interpolál az összekötő egyenes mentén a két kiválasztott hely között.
- **Távolság és Idő Kiszámítása:**
  - Kiszámítja a pontok közötti távolságot a Föld görbületét figyelembe véve a `distance` függvénnyel.
  - Becsüli az utazási időt egy előre definiált átlagsebesség (800 km/h) alapján.
- **Animáció:**
  - Animálja a repülő mozgását az útvonal mentén.
  - Valós időben frissíti a megjelenített statisztikákat.

## Testreszabás
- **Repülési Sebesség:**
  - Módosítsd a `sebessegKmOra` változót az átlagos repülési sebesség beállításához.
- **Szünet Időtartama:**
  - Változtasd meg a `pause(0.05)` értékét az animáció sebességének módosításához.

## Példa Kimenet
- Egy műholdas térkép, amelyen megjelennek:
  - A kiválasztott pontok
  - A repülési útvonal
  - Egy animált repülő ikon, amely követi az útvonalat
  
- Megjelenített statisztikák:
  - Átlagos repülési sebesség: `800 km/h`
  - Teljes távolság: például `1500 km`
  - Hátralévő távolság: dinamikusan frissül
  - Eltelt idő: dinamikusan frissül

## Licenc
Ez a projekt nyílt forráskódú, és oktatási célokra szabadon módosítható vagy felhasználható. Ha jelentős fejlesztéseket hajtasz végre, bátran járulj hozzá!

---

### Szerző
Készítette: patrikusz
