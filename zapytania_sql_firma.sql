create database firma;
create schema ksiegowosc;

CREATE TABLE ksiegowosc.pracownicy(
    id_pracownika INT  UNIQUE PRIMARY KEY NOT NULL,
    imie VARCHAR(50) NOT NULL,
    nazwisko  VARCHAR(50) NOT NULL,
    adres VARCHAR (100) NOT NULL, 
    telefon VARCHAR(12) NOT NULL
);

CREATE TABLE ksiegowosc.godziny(
    id_godziny INT UNIQUE PRIMARY KEY NOT NULL,
    data VARCHAR (25) NOT NULL,
    liczba_godzin INT,
    id_pracownika REFERENCES INT
);

CREATE TABLE ksiegowosc.pensje(
    id_pensji INT UNIQUE PRIMARY KEY NOT NULL,
    stanowisko VARCHAR (50) NOT NULL,
    kwota INT,
    id_premii REFERENCES INT
);

CREATE TABLE ksiegowosc.premie(
    id_premii INT UNIQUE PRIMARY KEY,
    rodzaj VARCHAR (50) NOT NULL,
    kwota INT
);
CREATE TABLE ksiegowosc.wynagrodzenie (
	id_wynagrodzenia INT UNIQUE PRIMARY KEY  NOT NULL,
	data VARCHAR(25) NOT NULL,
	id_pracownika INT REFERENCES ksiegowosc.pracownicy(id_pracownika),
	id_godziny INT REFERENCES ksiegowosc.godziny(id_godziny),
	id_pensji INT REFERENCES ksiegowosc.pensje(id_pensji),
	id_premii INT REFERENCES ksiegowosc.premie(id_premii)
);


COMMENT ON TABLE ksiegowosc.pracownicy IS 'Pracownicy naszej firmy';
COMMENT ON TABLE ksiegowosc.godziny IS 'Godziny przepracowane z ostatnich dni';
COMMENT ON TABLE ksiegowosc.pensje IS 'Wyp³ata dla ka¿dego stanowiska';
COMMENT ON TABLE ksiegowosc.premie IS 'Dodatkowe pieniadze dla pracownikow';
COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'Podsumowanie';


INSERT INTO ksiegowosc.pracownicy 
VALUES(1,'Wiktor', 'Kot', 'ul.Sadowa 12, 30-204 Krakow', 789465783);
INSERT INTO ksiegowosc.pracownicy  
VALUES(2,'Piotr', 'Wrona', 'ul. Okolna 2, 30-188 Krakow', 786795678);
INSERT INTO ksiegowosc.pracownicy  
VALUES(3,'Oliwia', 'Mazur', 'ul. Piêkna 17, 30-456 Krakow', 673456867);
INSERT INTO ksiegowosc.pracownicy 
VALUES(4,'Nadia', 'Rak', 'ul. Widokowa 34, 30-234 Krakow', 789123423);
INSERT INTO ksiegowosc.pracownicy 
VALUES(5,'Janina', 'Salomon', 'ul.Szkolna 1, 30-959 Krakow', 874508970);
INSERT INTO ksiegowosc.pracownicy 
VALUES(6,'Patrycja', 'Wilczek', 'ul. Radosna 34, 30-846 Krakow', 756468467);
INSERT INTO ksiegowosc.pracownicy 
VALUES(7,'Andrzej', 'Telec', 'ul. Polna 74, 30-272 Krakow', 567234576);
INSERT INTO ksiegowosc.pracownicy 
VALUES(8,'Konrad', 'Feliks', 'ul. Modra 45 Krakow', 754356789);
INSERT INTO ksiegowosc.pracownicy  
VALUES(9,'Patryk', 'Sowa', 'ul. Kolna 212, 30-929 Krakow', 583635278 );
INSERT INTO ksiegowosc.pracownicy 
VALUES(10,'Julia', 'Palec', 'ul. Bysra 3, 30-239 Krakow', 673468967);

INSERT INTO ksiegowosc.godziny 
VALUES(1,'2019-04-05', 6, 1);
INSERT INTO ksiegowosc.godziny
VALUES(2,'2019-04-05', 8, 10);
INSERT INTO ksiegowosc.godziny
VALUES(3,'2019-04-05', 6, 3);
INSERT INTO ksiegowosc.godziny 
VALUES(4,'2019-04-05', 7, 4);
INSERT into ksiegowosc.godziny
VALUES(5,'2019-04-06', 8, 5);
INSERT INTO ksiegowosc.godziny
VALUES(6,'2019-04-06', 7, 9);
INSERT INTO ksiegowosc.godziny 
VALUES(7,'2019-04-06', 9, 8);
INSERT INTO ksiegowosc.godziny 
VALUES(8,'2019-04-06', 10, 4);
INSERT INTO ksiegowosc.godziny
VALUES(9,'2019-04-07', 8 , 3);
INSERT INTO ksiegowosc.godziny
VALUES(10,'2019-04-07', 7, 1);

INSERT INTO ksiegowosc.premie
VALUES(1,'premia œwi¹teczna', 300);
INSERT INTO ksiegowosc.premie
VALUES(2,'premia za nadgodziny', 150);
INSERT into ksiegowosc.premie 
VALUES(3,'premia za punktualnoœæ', 180);
INSERT INTO ksiegowosc.premie 
VALUES(4,'premia za sprzeda¿', 330);
INSERT INTO ksiegowosc.premie 
VALUES(5,'premia dla pracownika miesi¹ca', 400);
INSERT INTO ksiegowosc.premie
VALUES(6,'premia frekwencyjna', 260);
INSERT INTO ksiegowosc.premie
VALUES(7,'premia za prace weekendow¹', 180);
INSERT INTO ksiegowosc.premie
VALUES(8,'brak premii', 8);
INSERT INTO ksiegowosc.premie
VALUES(9,'premia za terminowoœæ', 170);
INSERT INTO ksiegowosc.premie
VALUES(10,'premia za pomoc', 100);

INSERT INTO ksiegowosc.pensje 
VALUES(1,'m³odszy analityk', 3500,1);
INSERT INTO ksiegowosc.pensje 
VALUES(2,'starszy analityk', 4000,1);
INSERT INTO ksiegowosc.pensje 
VALUES(3,'ksiêgowy', 4000,7);
INSERT into ksiegowosc.pensje 
VALUES(4,'m³odszy ksiêgowy', 3500,7);
INSERT into ksiegowosc.pensje 
VALUES(5,'g³ówny analityk', 5500,9);
INSERT INTO ksiegowosc.pensje 
VALUES(6,'g³ówny ksiêgowy', 5500,3);
INSERT INTO ksiegowosc.pensje 
VALUES(7,'specjalista ds. rozwoju', 3600,3);
INSERT INTO ksiegowosc.pensje 
VALUES(8,'specjalista ds. promocji', 3600,9);
INSERT INTO ksiegowosc.pensje  
VALUES(9,'v-ce prezes', 10000,9);
INSERT INTO ksiegowosc.pensje  
VALUES(10,'prezes', 15000,1);

INSERT INTO ksiegowosc.wynagrodzenie
VALUES(1,'2019-04-08',1,1,9,8);
INSERT INTO ksiegowosc.wynagrodzenie
VALUES(2,'2019-04-08',2,2,10,1);
INSERT INTO ksiegowosc.wynagrodzenie
VALUES(3,'2019-04-08',3,3,4,1);
INSERT INTO ksiegowosc.wynagrodzenie
VALUES(4,'2019-04-08',4,4,8,3);
INSERT INTO ksiegowosc.wynagrodzenie
VALUES(5,'2019-04-08',5,5,3,6);
INSERT INTO ksiegowosc.wynagrodzenie
VALUES(6,'2019-04-08',6,6,3,1);
INSERT INTO ksiegowosc.wynagrodzenie
VALUES(7,'2019-04-08',7,7,4,1);
INSERT INTO ksiegowosc.wynagrodzenie
VALUES(8,'2019-04-09',8,8,5,2);
INSERT INTO ksiegowosc.wynagrodzenie
VALUES(9,'2019-04-09',9,9,2,1);
INSERT INTO ksiegowosc.wynagrodzenie
VALUES(10,'2019-04-09',10,10,3,10);

--a) Wyœwietl tylko id pracownika oraz jego nazwisko.
SELECT id_pracownika,nazwisko FROM ksiegowosc.pracownicy;
--b) Wyœwietl id pracowników, których p³aca jest wiêksza ni¿ 1000.
SELECT id_pracownika FROM ksiegowosc.wynagrodzenie, ksiegowosc.pensje  
WHERE ksiegowosc.wynagrodzenie.id_pensji=ksiegowosc.pensje.id_pensji
AND kwota > '1000';
--c) Wyœwietl id pracowników nieposiadaj¹cych premii,których p³aca jest wiêksza ni¿ 2000.
SELECT id_pracownika FROM ksiegowosc.wynagrodzenie, ksiegowosc.pensje
WHERE ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
AND ksiegowosc.wynagrodzenie.id_premii = '8'
AND kwota > '2000';
--d) Wyœwietl pracowników, których pierwsza litera imienia zaczyna siê na literê ‘J’.
SELECT * FROM ksiegowosc.pracownicy 
WHERE imie LIKE 'J%'; 
--e) Wyœwietl pracowników, których nazwisko zawiera literê ‘n’ oraz imiê koñczy siê na literê ‘a’.
SELECT * FROM ksiegowosc.pracownicy
WHERE nazwisko LIKE '%n%' AND imie LIKE '%a';
--f)Wyœwietl imiê i nazwisko pracowników oraz liczbê ich nadgodzin, przyjmuj¹c, i¿ standardowy czas pracy to 160 h miesiêcznie. 
SELECT imie, nazwisko, liczba_godzin - 160 AS nadgodziny
FROM ksiegowosc.pracownicy JOIN ksiegowosc.godziny ON pracownicy.id_pracownika = godziny.id_pracownika;
--g) Wyœwietl imiê i nazwisko pracowników, których pensja zawiera siê w przedziale 1500 –3000PLN.
SELECT imie, nazwisko FROM ksiegowosc.pracownicy 
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
JOIN ksiegowosc.pensje ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenie.id_pensji 
WHERE kwota BETWEEN 1500 AND 3000;
--h)Wyœwietl imiê i nazwisko pracowników, którzy pracowali w nadgodzinachi nie otrzymali premii.
SELECT imie, nazwisko, liczba_godzin -160 AS nadgodziny, id_premii
FROM ksiegowosc.pracownicy, ksiegowosc.godziny, ksiegowosc.wynagrodzenie
WHERE ksiegowosc.pracownicy.id_pracownika = ksiegowosc.godziny.id_pracownika
AND ksiegowosc.wynagrodzenie.id_godziny = ksiegowosc.godziny.id_godziny
AND id_premii = '8' AND liczba_godzin > 160;
--i)Uszereguj pracowników wed³ug pensji.
SELECT pracownicy.*, kwota FROM ksiegowosc.pracownicy 
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
ORDER BY kwota;
--j)Uszereguj pracowników wed³ug pensji i premii malej¹co.
SELECT pracownicy.*, pensje.kwota, premie.kwota FROM ksiegowosc.pracownicy 
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji 
JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii
ORDER BY pensje.kwota, premie.kwota DESC;
--k)Zlicz i pogrupuj pracowników wed³ug pola ‘stanowisko’.
SELECT stanowisko, COUNT(stanowisko) AS "ilosc" FROM ksiegowosc.pracownicy 
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
GROUP BY stanowisko;
--l)Policz œredni¹, minimaln¹ i maksymaln¹ p³acê dla stanowiska ‘kierownik’ (je¿eli takiego nie masz, to przyjmij dowolne inne).
SELECT CAST(AVG(kwota::numeric) AS DECIMAL(10,2)) AS œrednia, MIN(kwota::numeric) AS minimum,MAX(kwota::numeric) AS maksimum
FROM ksiegowosc.pensje WHERE ksiegowosc.pensje.stanowisko = 'prezes';
--m) Policz sumê wszystkich wynagrodzeñ.
SELECT SUM(kwota) FROM ksiegowosc.pensje;
--n)Policz sumê wynagrodzeñ w ramach danego stanowiska.
SELECT stanowisko,SUM(kwota) AS kwota_wg_stanowiska FROM ksiegowosc.pensje GROUP BY stanowisko;
--o)Wyznacz liczbê premii przyznanych dla pracowników danego stanowiska.
SELECT stanowisko, COUNT(premie.kwota) AS "ilosc premii" FROM ksiegowosc.premie 
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii 
JOIN ksiegowosc.pensje ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenie.id_pensji 
GROUP BY stanowisko;
--p)Usuñ wszystkich pracowników maj¹cych pensjê mniejsz¹ ni¿ 1200 z³.
DELETE FROM ksiegowosc.wynagrodzenie USING ksiegowosc.pensje 
WHERE pensje.kwota <1200 AND wynagrodzenie.id_pensji = pensje.id_pensji;


