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

### 2021. április 8.-15.:
A debuggolási problémákat, amikről beszéltem legutóbb sikerült kijavítanom. Megírtam, még olyan kódrészleteket is, amik elkerülik, hogy például az addCouch kódjába 2x hívjon bele az alkalmazás. Ezzel együtt sikerült a UI frissítés módjára is rájönnöm. 
A SwiftUI-os MapView-t elég butának találtam a céljaimhoz, ezért kipróbáltam, hogy lehetne felhasználni a UIKit-es nézeteket SwiftUI-ban. Erre azt találtam, hogy az új nézeteknek egy UIViewRepresentable-ből kell származnia, majd ebben és egy segédosztályában meg lehet valósítani a hozzá tartozó Delegate metódusait.
Ez alapján elkészítettem az új térképet, valamint a térképhez elkezdtem implementálni egy hasonlóan működő SearchBar-t. Ebből amúgy találtam egy szép SwiftUI-os megvalósítást, viszont én azt szeretném, ha a billentyűzet Return gombjára indulna el a keresés, viszont ennek a viselkedésnek a felülírását nem lehet SwiftUI-ban megcsinálni. Emiatt kellett UIViewRepresentable-ös SearchBart, bár ezt még nem sikerült megjeleníteni az alkalmazásban (valamiért ha példányosítom akkor sem jelenik, meg plusz szerintem a térkép is teljesen befagy).

### 2021. április 15.-22.:
SearchBar-t átírtam úgy, hogy ne egy sima UITextField-et wrappeljen SwiftUI View-ba, hanem egy UISearchBar-t. Ez tartalmazta a számomra szükséges összes funkcionalitást, és szerintem az eddigi próbálkozásaim közül ezzel is lehet a legkönnyebben dolgozni. A keresés most már működik, ha beírunk egy városnevet a térképen, akkor odanavigál arra a városra a térkép és betölti az ottani couch-okat (bár Budapesten kívül nincsen még couch máshol). Annyi változtatásra még szükség volt, hogy városnevek esetén a geocoder könyvtár, amit használtam nem működött, ezért ott visszatértem az Apple-ös CLGeocoderre, ez szimplán egy városnévből képes meghatározni annak koordinátáit. Készítettem még egy nézetet a listaelemek számára és egy értékeléseket megjelenítő nézetet is.
