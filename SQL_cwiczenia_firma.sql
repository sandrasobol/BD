
--a) Zmodyfikuj numer telefonu w tabeli pracownicy, dodaj¹c do niego kierunkowy dla Polski w nawiasie (+48)
UPDATE ksiegowosc.pracownicy 
SET telefon='(+48)' || pracownicy.telefon;
--b) Zmodyfikuj atrybut telefonw tabeli pracownicy tak, aby numer oddzielony by³ myœlnikami wg wzoru: ‘555-222-333’
UPDATE ksiegowosc.pracownicy 
SET telefon = SUBSTRING(telefon,1,8) || '-' || SUBSTRING(telefon,9,3) || '-' || SUBSTRING(telefon,12,3);
--c)Wyœwietl dane pracownika, którego nazwisko jest najd³u¿sze, u¿ywaj¹c du¿ych liter
SELECT ksiegowosc.pracownicy.* 
FROM ksiegowosc.pracownicy 
ORDER BY char_length(nazwisko) DESC LIMIT 1;
--d) Wyœwietl dane pracowników i ich pensje zakodowane przy pomocy algorytmu md5 
SELECT ksiegowosc.pracownicy.*, MD5(CAST(pensje.kwota AS VARCHAR)) AS md5_kwota FROM ksiegowosc.pracownicy 
JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika 
JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji;
--e)Wyœwietl pracowników, ich pensje oraz premie. Wykorzystaj z³¹czenie lewostronne.
SELECT pracownicy.imie, pracownicy.nazwisko, pensje.kwota, premie.kwota 
FROM ksiegowosc.wynagrodzenie  
LEFT JOIN ksiegowosc.pracownicy ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
LEFT JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii;
--f)wygeneruj raport (zapytanie), które zwróciw wyniki treœæ wg poni¿szego szablonu:
--Pracownik Jan Nowak, w dniu 7.08.2017 otrzyma³ pensjê ca³kowit¹ na kwotê 7540 z³, gdzie wynagrodzenie zasadnicze wynosi³o: 5000 z³, premia: 2000 z³, nadgodziny: 540 z³
SELECT CONCAT('Pracownik ', ksiegowosc.pracownicy.imie, ' ',ksiegowosc.pracownicy.nazwisko,' ,w dniu ',
ksiegowosc.godziny.data,' otrzyma³ pensjê ca³kowit¹ na kwotê ',COALESCE(ksiegowosc.premie.kwota,0)+COALESCE(ksiegowosc.pensje.kwota,0),
' ,gdzie wynagrodzenie zasadnicze wynosi³o: ',ksiegwosc.pensje.kwota,
' ,nadgodziny: ', ksiegowosc.premie.kwota) AS Informacja
FROM ksiegowosc.wynagrodzenie
LEFT JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
LEFT JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii 
LEFT JOIN ksiegowosc.pracownicy ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
LEFT JOIN ksiegowosc.godziny ON ksiegowosc.godziny.id_pracownika = ksiegowosc.pracownicy.id_pracownika;


