USE Database12;

select * from [dbo].[MT3];
--QUESTION1

--Q1

select * from [dbo].[MT3] where OrderStatus='Completed';

--Q2
select state,count(*) as completed_order from [dbo].[MT3] group by State;

--Q3
select sum(Quantity)as total_quantity_sold from [dbo].[MT3];

--Q4
select sum(NetSales)as total_quantity_sold from [dbo].[MT3];

--Q5
select sum(Profit) as total_profit from[dbo].[MT3];

--Q6
select avg(HighValueOrder) as avg_value from[dbo].[MT3];

--Q7
select state from  [dbo].[MT3] where NetSales>1000000;

--Q8
select state,sum(NetSales) as totalsales from[dbo].[MT3] group by state order by Totalsales desc;

--QUESION2

--Q1
select * from [dbo].[MT3] where OrderStatus='Completed';

--Q2
select CustomerName,sum(NetSales) as total_netsale from [dbo].[MT3]  group by CustomerName order by  total_netsale desc;

--Q3
WITH CustomerSalesCTE AS (
    SELECT 
        CustomerID,
        CustomerName,
        SUM(NetSales) AS TotalSales,
        COUNT(DISTINCT OrderID) AS TotalOrders,
        SUM(Quantity) AS TotalItemsPurchased
    FROM [dbo].[MT3]
    GROUP BY CustomerID, CustomerName
)
SELECT 
    CustomerID,
    CustomerName,
    TotalOrders,
    TotalItemsPurchased,
    TotalSales
FROM CustomerSalesCTE
ORDER BY TotalSales DESC;

--Q4
SELECT TOP 5
    CustomerID,
    CustomerName,
    COUNT(DISTINCT OrderID) AS TotalOrders,
    SUM(Quantity) AS TotalItemsPurchased,
    SUM(NetSales) AS TotalSales
FROM [dbo].[MT3]
GROUP BY CustomerID, CustomerName
ORDER BY TotalSales DESC;

--Q5
SELECT 
    CustomerID,
    CustomerName,
    COUNT(DISTINCT OrderID) AS TotalOrders,
    SUM(Quantity) AS TotalItemsPurchased,
    SUM(NetSales) AS TotalSales
FROM [dbo].[MT3]
GROUP BY CustomerID, CustomerName
ORDER BY TotalSales DESC;

--QUESTION3

--Q1
SELECT * FROM[dbo].[MT3] WHERE OrderStatus='Completed';

--q2
select sum(NetSales) as total_net_sales from[dbo].[MT3] group by State;

--Q3
SELECT 
    State,
    SUM(NetSales) AS TotalSales,
    COUNT(DISTINCT OrderID) AS TotalOrders,
    SUM(Quantity) AS TotalItemsPurchased,
    RANK() OVER (ORDER BY SUM(NetSales) DESC) AS StateRank
FROM [dbo].[MT3]
GROUP BY State
ORDER BY StateRank;

--Q4
SELECT TOP 5
    CustomerID,
    CustomerName
     TotalSales
FROM [dbo].[MT3]
CustomerSales
ORDER BY TotalSales DESC;

--Q5
SELECT
    ProductName,
    Category,
    NetSales as
    SalesRank
FROM [dbo].[MT3]
ORDER BY SalesRank DESC;