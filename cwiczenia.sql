--1.Napisz procedurê wypisuj¹c¹ do konsoli ci¹g Fibonacciego.
--Procedura musi przyjmowaæ jako argument wejœciowy liczbê n. 
--Generowanie ci¹gu Fibonacciego musi zostaæ zaimplementowane jako osobna funkcja,wywo³ywana przez procedurê.

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

--2.Napisz trigger DML, który po wprowadzeniu danych do tabeli Personszmodyfikuje nazwisko tak, aby by³o napisane du¿ymi literami.

CREATE TRIGGER nazw ON AdventureWorks2017.Person.Person
FOR UPDATE AS UPDATE AdventureWorks2017.Person.Person SET LastName=UPPER(LastName)
UPDATE AdventureWorks2017.Person.Person SET FirstName='Louis' WHERE BusinessEntityID=1;
SELECT FirstName,LastName FROM AdventureWorks2017.Person.Person WHERE BusinessEntityID = 1;


--3.Przygotuj trigger ‘taxRateMonitoring’, który wyœwietli komunikat o b³êdzie, je¿eli nast¹pi zmiana wartoœci w polu ‘TaxRate’o wiêcej ni¿ 30%

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

