# Specifikáció
--------------

#### Regisztráció

Az alkalmazást csak bejelentkezett felhasználók használhatják. Regisztrációnál egyszerű formban meg kell adni vezeték és keresztnevet, email címet, és a jelszót kétszer.

#### Bejelentkezés + elfelejtett jelszó

Bejelentkezni email cím + jelszó kombinációval lehet. Sikeres bejelentkezés esetén a következő térképes nézetre navigál át az alkalmazás. Sikertelen bejelentkezésnél piros szöveggel kell jelezni, hogy melyik adatot adta meg hibásan a felhasználó. 
Rossz jelszónál: "Password is incorrect."
Rossz emailnél: "There is no user registered with this email address."

Jelszóemlékeztetőt egy külön gombra kattintva lehet. Átvisz egy külön nézetre (vagy modál dialóg), ahol meg lehet adni az emailt, majd erre az emailre elküldi a jelszót.
Rossz email megadásnál a fenti szöveggel kell jelezni, hogy rossz az email.

### Utazásaim (Trips)

Itt lehet elérhető szállásokat keresni. Térképes nézet a Google Maps-hez hasonlóan működne. Városra vagy országra lehetne rákeresni egy keresőmezőben, keresésre az adott helyre zoomol a térképen, majd a keresett területen markerekkel jelennének meg az elérhető szállások. Térkép alján lenne egy a térképre félig felhúzható nézet, amiben egy lista lenne. Ebben a listában jelennének meg az elérhető szállások, ugyanazok mint amik markerekkel vannak jelölve a térképen. Marker kijelölhető, ekkor az alsó listanézeten csak a kijelölt szállás jelenik meg. Innen lehet továbbnavigálni a szálláshely részletes oldalára. 

#### Szálláshely (Couch) részletes oldala

Nézet felső részén képek jelennek meg a szálláshelyről. Alatta hogy melyik országban, városban található. Kis ikonnal mellette lenne jelezve, hogy hány fő tud megszállni az adott helyen. Alatta lenne a hirdető neve, kis képpel, nevére kattintva a hirdető (User) részletes oldalára lehet navigálni. Hirdető alatt lenne a szálláshely leírása. ?(valahol még egy térképet is el kéne helyezni ismét)?

Legalján egy naptár jelenik meg, ebben meg lehet nézni, mikor foglalt vagy nem foglalt a szálláshely. Ha kijelölünk a naptárban két dátumot, akkor utána le is tudjuk foglalni a dátumok közötti időtartamra. ?(Valahol azt is meg kéne adnia a felhasználónak, hogy hány fővel érkezik majd a szállásra)? Ha lefoglaltunk valamit, akkor értesítés és üzenet megy ki a hirdetőnek, addig nem lesz végleges a foglalás, amíg a szállás hirdetője el nem fogadja a foglalást.

### Kanapék (Couches)

A felhasználó itt adhat hozzá saját, elérhető ágyakat, valamint szerkeszteni is lehet őket innen. A kiválasztott ágy alatt jelennek meg a szállást kereső felhasználóknak listája. Ezt a listát lehet szűrni nem, tartózkodási idő, vendégül látandó személyek száma, származási hely szerint. 

Ha a felhasználó több ágyat is feltöltött, akkor innen lehet váltani közöttük. A szerkesztés ikon mindig az aktuálisan kiválasztott ágyat fogja szerkeszteni, a listák is egyediek lesznek ágyanként.

### Profil (Profile)

A felhasználó itt tudja szerkeszteni/módosítani saját profilját. Innen egységesen elérhetőek a szállásfoglalásai, hozzá érkező vendégek listája, üzenetei és szállásainak értékelései. Egyéb alkalmazásbeállításokat is innen lehet elérni. Kijelentkezni is innen lehet majd.

#### Üzenetek

Szállásfoglalás esetén üzenetben jelzi a hirdetőnek, hogy foglalás érkezett. Itt is lehet majd elfogadni a foglalásokat. Minden üzenet érkezéséről notifikációt küld az alkalmazás a usernek.

#### Értékelések (Ratings)

Értékelést csak olyan szálláshoz lehet írni, ahol már megszállt a felhasználó. A foglalás lejártával jelenik majd meg a lehetőség, hogy értékelhesse a felhasználó a szállást. Csillagot kötelező megadni, kommentet opcionálisan lehet írni az értékeléshez. Max 5 csillagot, minimum 0.5 csillagot lehet adni, így felenként lehet emelni a csillagok számát.
