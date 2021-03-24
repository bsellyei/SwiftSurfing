# SwiftSurfing

master nevű branchen van idáig minden, nem tudtam bemergelni ide :'(

test users:

1. email: user1@test.com
2. password: testuser

## Haladási napló:
### 2021. március 10.-18.:
A bejelentkezést és a regisztrációt befejeztem. Firebase-en is inicializálva vannak a funkciók, van már egy testuser is. Ez a 2 nézet össze is van kötve, viszont bejelentkezéssel nem ugrik még át a következő nézetre a Loginról. A RootView-ban szeretném majd vizsgálni, hogy van-e bejelentkezett felhasználó az induláskor, viszont ez jelenleg mindig igazzal jelez vissza, majd még körül kell járni a problémát. 
Csináltam egy térképes nézetet is, megnéztem hogyan kell ezen annotációkat megjeleníteni. 
Firebase-en megcsináltam az adatbázist, a szálláshely felvételhez megcsináltam a nézeteket, és már szálláshelyet is lehet hozzáadni, ami megjelenik az adatbázisban. 
Lekérdezéseket még nem csináltam az appban, következő lépésként szeretném majd, hogy a Couches tabon megjelenjenek a user szálláshelyei, valamint a térképen is.
Az adatmodell diagramját is bővítettem, viszont szerintem még ez sem teljes, ezt útközben szeretném még bővíteni. 1-2 nézetet amit hiányoltál, szintén nem sikerült még befejeznem, ez is a következő hétre marad majd.

### 2021. március 18.-25.:
Ezen a héten nem haladtam túl sokat. Elolvastam a DI-os cikket, amit küldtél és az alapján csináltam egy DI Container implementációt, valamint az eddigi adatbázisba rekordot beszúró funkciót kiszerveztem egy service osztályba. Megpróbáltam még megoldani Geocoding problémát, hogy a megadott címből kitalálja a hozzá tartozó koordinátákat, de nem sikerült még a végére járnom. Találtam egy Podot, ami egy másik szolgáltatást használ Geocodinghoz, azt fogom majd kipróbálni még, hátha azzal működik. Elkezdtem még annak is a megoldását, hogy hogyan használhassak majd fel UIKit-es controlokat SwiftUI-ban. Ehhez is elolvastam a cikket, amit küldtél és a benne lévő könyvtárat Swift Package Managerrel hozzáadtam a projekthez. Viszont megfelelő ImagePickert még nem találtam, ezek közül is majd ki kéne próbálnom párat egy példaprojektben, hogy olyanok-e amit én keresek.
