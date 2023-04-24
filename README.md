# Dieren API (aanpasbaar)

Hoe makkelijk is het om al je data in een API te verwerken voor bijvoorbeeld mobiele apps, nou dat is mogelijk! Lees hieronder hoe je dit doet

## 📁 Inhoud

- Gebruik van MYSQL Database
- 4 verschillende afbeeldingen
- XAMP Setup tutorial

## ❓ Waar moet ik beginnen?

We hebben een paar bestanden nodig, zoals dit bestand, de `README.md`. Ook hebben we een folder genaamd `/public`, in deze folder staat een bestand genaamd `index.php`. In de index.php staat de code van onze API.

Voordat deze API werkt moeten we wel nog een paar dingen doen, zoals het verbinden met een mysql database.
Voor dit project heb je een programma nodig genaamd XAMPP, als je dat al op je computer hebt staan is dat top, start dan de Apache en MySQL servers op.

Heb je dit nog niet? Installeer dit dan met hulp van de onderstaande links:
- [XAMPP SETUP TUTORIAL](https://www.youtube.com/watch?v=VCHXCusltqI)
- [XAMPP DOWNLOAD](https://www.apachefriends.org/)

## 🔧 Hoe stel ik mijn database in?

Als je XAMPP compleet gedownload is kunnen we beginnen aan het instellen van je database door te klikken op de start knop naast Apache en MySQL.
Hiermee starten we onze servers, je kan dan bij de rij van MySQL klikken op `Admin` of je gaat naar een browser en vult dit in: *http://localhost/phpmyadmin/index.php* 

Je ziet nu het scherm van phpMyAdmin. Aan de linker kant staan al je databases, als het goed is zijn er al een paar. 
Klik op 'Nieuw', dan maak je een nieuwe database aan. Dan kom je op een ander scherm, vul bij het vak "Databasenaam" de naam van jouw database.
Dan kom je op een nieuw scherm, je ziet in dit project ook een folder genaamt 'sqlData', in die map staan 2 bestanden, dat is de data van jouw databases, maar die moeten we eerst nog importeren.

Als je in je database bent (door aan de linker kant jouw database te selecteren) zie je boven aan je scherm een menu, hier staat onderandere 'Structuur', 'SQL', 'Zoeken', etc.
In die navbar staat ook een tabje genaamd 'Importeren', daar klik je op. 

Je ziet dan verschillende cards, we hebben alleen de bovenste nodig, 'Te importeren bestand:', daar klik je op "Bestand Kiezen" en dan selecteer je het bestand in de map 'sqlData'.
Als je dat gedaan hebt scroll je naar beneden, daar klik je op 'importeren'.

*=-=-=-==-=-=-==-=-=-==-=-=-==-=-=-==-=-=-==-=-=-==-=-=-==-=-=-=*

Gefeliciteerd, je hebt nu de database klaar gemaakt.

Nu gaan we naar onze public folder en dan naar het bestand index.php, in dat bestand zie je deze regels staan:

```
$host = 'localhost'; // Dit is de naam van jouw host, vaak is dit: localhost.
$dbname = 'dierenDatabase'; // Dit is de naam van jouw database, in mijn geval is dat graphixapi, hier zet je de naam van jouw database neer.
$user = 'root'; // Dit is de user van jouw database, dit is bijna altijd root, dit kan je dus laten staan.
$password = ''; // Dit is het password van jouw database, als je op localhost zit heb je nooit een password.
```

Dit staat eigenlijk allemaal al goed, behalve de $dbname. Daar staat achter de haakjes op dit moment 'dierenDatabase', dit omdat ik tijdens het maken van de tutorial een database gemaakt heb genaamd dierenDatabase. Tussen die haakjes kan je je eigen database naam zetten, bijvoorbeeld 'testDatabase' of 'DierenData'

**LET OP: DE NAAM MOET OVEREEN KOMEN MET WAT ER BIJ PHPMYADMIN STAAT, LET GOED OP DE SPELLING**

*=-=-=-==-=-=-==-=-=-==-=-=-==-=-=-==-=-=-==-=-=-==-=-=-==-=-=-=*

Als je al deze stappen uitgevoerd hebt dan zou alles moeten werken, je kan nu in visual studio code een nieuwe terminal openen: Terminal > New Terminal.
In de terminal voer je dit command uit:

```
php -S localhost:8000
```

Deze regel start jouw api op localhost:8000, je kan nu in je browser naar deze url gaan:
*http://localhost:8000/dieren*

Nu zou je de error 'Onjuiste API token.' moeten krijgen.

Je kan naar deze url gaan om de data te krijgen:
*http://localhost:8000/dieren?token=FrfZ0SIPyPEXULxPP4RwPo9Usc1Dr77YiIuqIKoch2GZc*

*=-=-=-==-=-=-==-=-=-==-=-=-==-=-=-==-=-=-==-=-=-==-=-=-==-=-=-=*

Als alles goed gedaan is zou je nu een scherm moeten krijgen met heel veel tekst, hier staat de data uit jouw database.

**Gefeliciteerd, je hebt nu een api die data over 4 verschillende dieren bevat.**
**© Ole@GraphixDevelopment**
