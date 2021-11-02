# SwiftSurfing

master nevű branchen van idáig minden, nem tudtam bemergelni ide :'(

test users:

1. email: user1@test.com
2. password: testuser

1. email: user2@test.com
2. password: testuser2

## Tervek a 2021/2022 őszi félévre:

Igazából szeretném az alkalmazást teljesen működőképessé tenni ebben a félévben. Szerintem elengedhetetlen funkciók: foglalás küldése, elfogadása, üzenetek küldése felhasználók között, szálláshelyek pontozása, értesítések küldése közelgő utazások és üzenetek esetén. Ez nem tudom pontosan mennyi időt fog majd igénybe venni, szerintem marad majd idő a félév során másra is. Továbbiakban szerintem egy saját backend készítésével kellene folytatni. Még elég kevés üzleti logika tartozik az alkalmazáshoz, ezeket szeretném majd kiszervezni egy saját backendbe.

## Haladási napló:

### 2021. október 27. - november 2.:
Múlthéten elkezdett értékelésekkel foglalkoztam. Csináltam egy kis nézetet, ahol az összértékelést meg lehet nézni, plusz van benne egy kis diagram hogy az értékelések hogyan oszlanak el 1-től 5-ig. Alatta van egy kis rész, ahol újat lehet hozzáadni, azalatt pedig hogy szöveges értékelések érkeztek még. Frissítettem a csillagokat mutató nézetet is, most már lehet bele kattintani, így nem csak read-only (az összes helyen ugyanúgy néz ez ki, de csak 1 helyen nem read-only). Lehet lekérdezni és hozzáadni értékeléseket. Frissítettem az adatmodellt, a gyorsabb megjelenítés miatt az értékelések számát és átlagukat mindig eltárolom a szálláshelyeknél, ez azért fontos, mert ha listanézeten van több szállás, akkor megnyitás nélkül is láthassa a user hogy hányas az értékelése. 
A backend részre ezen a héten még nem jutott időm, de a következő héttől azzal szeretnék már foglalkozni.

### 2021. október 13. - október 20.:
A user kezelést alakítottam át az alkalmazásban. Rendesen működik most már a login és logout, megnyomásukra átnavigálunk a megfelelő view-kra. Ezekhez készítettem egy AuthenticationManager service-t, innen lehet majd intézni minden authentikációhoz kapcsolódó funkciót. 
Mással nem haladtam most a héten, elég sok beadandó meg zh volt még szerdáig. Továbbiakban a local notifikációkkal szeretnék haladni, hogy foglalásnál ütemezzen be az alkalmazás egy értesítést. Mondtam, hogy push notifikációkat is szeretnék az üzenetküldéshez, szerintem ezt egyelőre kihagyom, max a félév legvégén újra előveszem, ha lesz még rá idő.

### 2021. október 6. - október 13.:
Unit tesztelés témában olvasgattam sokat, próbáltam találni megoldást arra, hogy hogyan kéne tesztelnem, hogy a Firebase adatbázisába bekerültek-e a megfelelő adatok. Nem tudom ez a jó irány-e majd beszélünk róla. Ezen kívül elkészítettem a beszélgetések és az üzenetek számára a view-kat. Kiegészítettem pár service-t, annak megfelelően, hogy már ne minden adatot kérjünk le az adatbázisból, csak olyat ami jelenleg bejelentkezett user számára fontos lehet (pl más szálláshelyeit ne sorolja fel ott, ahol a sajátoknak kéne lennie). Észrevettem, hogy a user kezelés még fel kéne frissítenem, login és logout-ra nem navigál át az alkalmazás, olyan mintha azokra a gombnyomásokra nem történne semmi. Az üzenetek véglegesítésével és az értesítések kezelésével folytatom majd tovább.

### 2021. szeptember 29. - október 6.:
Véglegesítettem a foglalás részleteit tartalmazó nézetet, valamint a folyamathoz szükséges összes Service implementációt elkészítettem. Ezek a Reservation, Conversation és Message service-ek voltak. Interactorban elkészítettem, hogy mit miután kell beszúrni az adatbázisba. Még nem volt időm ezt kipróbálni, ezt szeretném majd a jövőhéten. Ha minden működik és megfelelően létrejönnek az adatbázisban az objektumok, akkor a chat view-val haladok tovább és az üzenetküldéssel. Maga az üzenetküldés rész már kész, csak be kell majd kötni a view-ba. Ezen kívül még szeretnék belekezdeni a notifikációk témakörébe és azzal egy kicsit jobban megismerkedni.
Frissítettem még az adatmodellt is, nem történt nagy változás, 1-1 boolt vettem fel a Reservation és Message táblákba.

### 2021. szeptember 22.-29.:
Csináltam egy új nézetet, ahol a foglalás részleteit lehet megtekinteni, illetve 1-2 adatot még módosítani rajta. Összegyűjtöttem milyen service-ek kellenek majd ehhez (User, Couch, Reservation). Couch-nál volt egy metódus ami még nem lett megírva, ezt is pótoltam. Az új nézet navigálásánál volt egy kis probléma: nálam ez úgy néz ki, hogy van egy gomb egy BottomToolBar-on az előző nézeten, amit ha megnyom a felhasználó elnavigál az új nézetre. A BottomToolBar esetén nem működik navigációra a NavigationLink, ennek olvastam utána kicsit, hogyan lehet mégis onnan megoldani a navigációt. SwiftUI View-knak van olyan modifierje, hogy background, ennek hogy ha megadunk egy tetszőleges view-t, akkor az a háttérben láthatatlanul megjelenik. Én ennek adtam meg a NavigationLinket, és a ToolBar-ra egy sima gomb került, aminek megnyomására egy Bool állítódik, ami ha igaz, akkor aktiválja a háttérben lévő NavigationLinket és átnavigál az új nézetre. Következő lépés lenne a foglalás beszúrása az adatbázisba, valamint az üzenetek megjelenítéséhez egy nézet, mert ott tudja majd a fogadó személy elfogadni a foglalást. Az üzenetes nézethez már előre kerestem egy cikket, hogy hogyan lehet szép chat view-t készíteni.

### 2021. szeptember 15.-22.:
Foglalás workflow elkezdéseként kerestem egy olyan SwiftUI-os calendart/datepickert, ahol lehetett intervallumot kijelölni. Találtam is egy ilyet githubon, sajnos nem volt hozzá se Swift Package, se Pod, de végül rájöttem hogy nem is baj, mert így a source-ba bele tudtam hackelni, hogy általam adott dátumokat leszürkítsen és ne lehessen kiválasztani őket. Ez azért kellett, mert így fogom letiltani a már foglalt időpontokat a naptárban. A workflow megvalósításához kicsit átgondoltam a meglévő adatmodellt és a nézeteket, 1-2 helyre még beszúrnék az adatszerkezetbe attribútumokat, plusz szerintem még pár egyszerűbb nézetre is szükség lesz majd az alkalmazásban.

--------------------------------------------------------------------
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
