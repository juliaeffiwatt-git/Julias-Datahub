--------Create Database
CREATE DATABASE PROJECTSA


----- TASK 2

Select * from AdventureWork_Sales
Select * from AdventureWorks_Customers
Select * from AdventureWorks_Product_Categories
Select * from AdventureWorks_Product_Subcategories
Select * from AdventureWorks_Products
Select * from AdventureWorks_Territories



------- QUESTION 2

----- EXTRACT TOTAL SALES FOR EACH PRODUCT NAME
Select p.ProductName, SUM (s.SalesAmount) AS TotalSales
FROM AdventureWork_Sales s JOIN AdventureWorks_Products p
ON s.ProductKey = p.ProductKey 
GROUP BY p.ProductName;


------- EXTRACT TOTAL TAX AMOUNT BY PRODUCT COLOR
Select p.ProductColor, SUM(s.TaxAmt) AS TotalTaxAmount
FROM AdventureWork_Sales s JOIN AdventureWorks_Products p 
ON s.ProductKey = p.ProductKey
GROUP BY p.ProductColor;


-------EXTRACT TOTAL FREIGHT BY PRODUCT NAME
Select  p.ProductName, SUM(s.Freight) AS TotalFreight 
FROM AdventureWork_Sales s JOIN AdventureWorks_Products p
ON s.ProductKey = p.ProductKey 
GROUP BY p.ProductName;

------- EXTRACT TOTAL PRODUCT COST BY PRODUCT NAME 
Select p.ProductName, SUM (s.TotalProductCost)/ (Select Sum(TotalProductCost) 
FROM AdventureWork_Sales s) AS ProportionOfTotalCost 
FROM AdventureWork_Sales s JOIN AdventureWorks_Products p
ON s.ProductKey = p.ProductKey 
GROUP BY p.ProductName;




-------- Question 3

-----EXTRACT TOTAL SALES AMOUNT AND FREIGHT BY COUNTRY 
Select t.Country, SUM(s.SalesAmount) AS TotalSalesAmount,
SUM (s.Freight) AS TotalFreight 
FROM AdventureWork_Sales s 
JOIN AdventureWorks_Territories t ON s.SalesTerritoryKey = t.SalesTerritoryKey
GROUP BY t.Country ORDER BY TotalSalesAmount DESC;

-------- PERCENTAGE OF TOTAL TAX BY REGION 
Select t.Region, (SUM(s.TaxAmt)*100.0/ (Select SUM(TaxAmt) 
FROM AdventureWork_Sales)) AS TaxAmountPercentage FROM AdventureWork_Sales s
JOIN AdventureWorks_Territories t ON s.SalesTerritoryKey= t.SalesTerritoryKey
GROUP BY t.Region ORDER BY TaxAmountPercentage DESC;



---- TASK 4

Select * from World_GDP


----- QTN 1
---  United Nations Estimate for each Country Territory in Europe 

Select Country, [United_Nations_Estimate] AS UN_Estimate 
FROM World_GDP WHERE [UN_region] ='Europe';

----- QTN 2
----  Total World Bank Estimate in each UN Region 

SELECT [UN_REGION], SUM([World_Bank_Estimate]) 
AS TotalWorldBankEstimate FROM World_GDP GROUP BY [UN_region];

----- QTN 3
-----  UN Region with  Average World Bank Estimate greater than 1000000 

SELECT [UN_Region], AVG([World_Bank_Estimate]) AS AvgWorldBankEstimate 
FROM World_GDP GROUP BY [UN_region]HAVING AVG([World_Bank_Estimate]) > 1000000;

---- QTN 4
----- Country Territory with total World Bank Estimate greater than 2000000

SELECT Country, SUM([World_Bank_Estimate]) AS TotalWorldBankEstimate 
FROM World_GDP GROUP BY Country Having SUM([World_Bank_Estimate]) > 2000000;

