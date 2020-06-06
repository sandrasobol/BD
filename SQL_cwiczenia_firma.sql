
--a) Zmodyfikuj numer telefonu w tabeli pracownicy, dodaj�c do niego kierunkowy dla Polski w nawiasie (+48)
UPDATE ksiegowosc.pracownicy 
SET telefon='(+48)' || pracownicy.telefon;
--b) Zmodyfikuj atrybut telefonw tabeli pracownicy tak, aby numer oddzielony by� my�lnikami wg wzoru: �555-222-333�
UPDATE ksiegowosc.pracownicy 
SET telefon = SUBSTRING(telefon,1,8) || '-' || SUBSTRING(telefon,9,3) || '-' || SUBSTRING(telefon,12,3);
--c)Wy�wietl dane pracownika, kt�rego nazwisko jest najd�u�sze, u�ywaj�c du�ych liter
SELECT ksiegowosc.pracownicy.* 
FROM ksiegowosc.pracownicy 
ORDER BY char_length(nazwisko) DESC LIMIT 1;
--d) Wy�wietl dane pracownik�w i ich pensje zakodowane przy pomocy algorytmu md5 
SELECT ksiegowosc.pracownicy.*, MD5(CAST(pensje.kwota AS VARCHAR)) AS md5_kwota FROM ksiegowosc.pracownicy 
JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika 
JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji;
--e)Wy�wietl pracownik�w, ich pensje oraz premie. Wykorzystaj z��czenie lewostronne.
SELECT pracownicy.imie, pracownicy.nazwisko, pensje.kwota, premie.kwota 
FROM ksiegowosc.wynagrodzenie  
LEFT JOIN ksiegowosc.pracownicy ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
LEFT JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii;
--f)wygeneruj raport (zapytanie), kt�re zwr�ciw wyniki tre�� wg poni�szego szablonu:
--Pracownik Jan Nowak, w dniu 7.08.2017 otrzyma� pensj� ca�kowit� na kwot� 7540 z�, gdzie wynagrodzenie zasadnicze wynosi�o: 5000 z�, premia: 2000 z�, nadgodziny: 540 z�
SELECT CONCAT('Pracownik ', ksiegowosc.pracownicy.imie, ' ',ksiegowosc.pracownicy.nazwisko,' ,w dniu ',
ksiegowosc.godziny.data,' otrzyma� pensj� ca�kowit� na kwot� ',COALESCE(ksiegowosc.premie.kwota,0)+COALESCE(ksiegowosc.pensje.kwota,0),
' ,gdzie wynagrodzenie zasadnicze wynosi�o: ',ksiegwosc.pensje.kwota,
' ,nadgodziny: ', ksiegowosc.premie.kwota) AS Informacja
FROM ksiegowosc.wynagrodzenie
LEFT JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
LEFT JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii 
LEFT JOIN ksiegowosc.pracownicy ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
LEFT JOIN ksiegowosc.godziny ON ksiegowosc.godziny.id_pracownika = ksiegowosc.pracownicy.id_pracownika;


