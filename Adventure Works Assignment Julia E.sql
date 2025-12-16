Select * from DimCustomer


----- QTN 1
------ EXTRACT TOTAL INCOME
SELECT SUM (YearlyIncome) AS Total_Male_Income 
FROM DimCustomer
WHERE Gender= 'M';

------- QTN 2
------- EXTRACT AVG. INCOME
Select FirstName, AVG (YearlyIncome) AS AvgIncome 
From DimCustomer
Where Gender='M'
AND MaritalStatus= 'S'
GROUP BY FirstName;

--------- QTN 3
--------- EXTRACT COLUMNS
SELECT * FROM DimCustomer
Where FirstName Like 'A%'
AND LastName Like 'C%';