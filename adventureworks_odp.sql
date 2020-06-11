--1.Przygotuj blok anonimowy, który:
--znajdzie średnią stawkę wynagrodzenia pracowników,
--wyświetli szczegółypracowników, których stawka wynagrodzenia jest niższa niż średnia. 
BEGIN
SELECT AVG(Rate) AS średnia_płaca FROM AdventureWorks2017.HumanResources.EmployeePayHistory EPH
SELECT * FROM AdventureWorks2017.HumanResources.Employee E JOIN AdventureWorks2017.HumanResources.EmployeePayHistory EPH ON EPH.BusinessEntityID = E.BusinessEntityID
WHERE EPH.Rate < (SELECT AVG(Rate) FROM AdventureWorks2017.HumanResources.EmployeePayHistory EPH)
END;
--2.Utwórz funkcję, która zwróci datę wysyłki określonego zamówienia.
CREATE FUNCTION wysylka (@ID INT) RETURNS TABLE AS
RETURN
		(SELECT Purchasing.PurchaseOrderHeader.ShipDate FROM Purchasing.PurchaseOrderHeader
		 WHERE Purchasing.PurchaseOrderHeader.PurchaseOrderID = @ID );

--3.Utwórz procedurę składowaną, która jako parametr przyjmujęnazwę produktu, a jako rezultat wyświetlajego identyfikator, numeri dostępność

CREATE PROCEDURE prod (@prod_name VARCHAR(25))
AS 
SELECT P.ProductID, P.name,P.MakeFlag FROM AdventureWorks2017.Production.Product P 
WHERE P.Name = @prod_name;

--4.Utwórz funkcję, która zwraca numer karty kredytowej dla konkretnego zamówienia

CREATE FUNCTION nr_karty (@ID VARCHAR(25)) RETURNS TABLE AS
	RETURN
	(SELECT CardNumber FROM AdventureWorks2017.Sales.CreditCard
	 JOIN AdventureWorks2017.Sales.SalesOrderHeader ON
	 AdventureWorks2017.Sales.SalesOrderHeader.CreditCardID = AdventureWorks2017.Sales.CreditCard.CreditCardID
	 AND AdventureWorks2017.Sales.SalesOrderHeader.SalesOrderID = @ID);

--5.Utwórz procedurę składowaną, która jako parametry wejściowe przyjmujedwie liczby, num1i num2, a zwraca wynik ich dzielenia. Ponadto wartość num1 powinna zawsze być większa niż wartość num2.
--Jeżeli wartość num1jest mniejsza niż num2, wygeneruj komunikat o błędzie „Niewłaściwie zdefiniowałeś dane wejściowe”.

CREATE PROCEDURE procedura (@num1 FLOAT, @num2 FLOAT)
AS
	IF @num1>@num2
		SELECT @num1/@num2
	ELSE
		PRINT 'Niewlasciwie zdefiniowales dane wejsciowe';