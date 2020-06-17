--1.Napisz procedur� wypisuj�c� do konsoli ci�g Fibonacciego.
--Procedura musi przyjmowa� jako argument wej�ciowy liczb� n. 
--Generowanie ci�gu Fibonacciego musi zosta� zaimplementowane jako osobna funkcja,wywo�ywana przez procedur�.

CREATE PROCEDURE fib (@n INT)
AS BEGIN 
DECLARE @1 INT = 0; 
DECLARE @2 INT = 1; 
DECLARE @3 INT = 1;	
DECLARE @razem INT;

IF @n = 1
BEGIN
	SET @1=0 ;
END;
ELSE 
BEGIN
	WHILE @n-1>1
	BEGIN
	 SET @1 = @2+ @3;
	 SET @2 = @3;
	 SET @3 = @1;
	 SET @n = @n-1;
	END;
END;
SELECT @1 as fibonacci;
RETURN;

--2.Napisz trigger DML, kt�ry po wprowadzeniu danych do tabeli Personszmodyfikuje nazwisko tak, aby by�o napisane du�ymi literami.

CREATE TRIGGER nazw ON AdventureWorks2017.Person.Person
FOR UPDATE AS UPDATE AdventureWorks2017.Person.Person SET LastName=UPPER(LastName)
UPDATE AdventureWorks2017.Person.Person SET FirstName='Louis' WHERE BusinessEntityID=1;
SELECT FirstName,LastName FROM AdventureWorks2017.Person.Person WHERE BusinessEntityID = 1;


--3.Przygotuj trigger �taxRateMonitoring�, kt�ry wy�wietli komunikat o b��dzie, je�eli nast�pi zmiana warto�ci w polu �TaxRate�o wi�cej ni� 30%

CREATE TRIGGER taxRateMonitoring ON AdventureWorks2017.Sales.SalesTaxRate
AFTER UPDATE AS
BEGIN
DECLARE @tax FLOAT; 
SELECT @tax= TaxRate FROM DELETED
DECLARE @tax1 FLOAT;
SELECT  @tax1 =TaxRate FROM INSERTED

IF(@tax1>@tax+ 0.3*@tax) OR (@tax1<@tax-0.3*@tax)
PRINT 'Wystapil blad'
ROLLBACK;
END;

