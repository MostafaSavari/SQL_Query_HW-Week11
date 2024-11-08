/*
1
نام و قیمت محصولاتی که قیمتشان بیشتر از: ۵۰۰ دلار است را نمایش دهید.
*/
SELECT * FROM dbo.Products WHERE Price >= 500 
 ----------------------------------------------------------
 /*
2
مجموع مبلغ سفارات ثبت شده در هر سال را نمایش دهید.
*/


SELECT YEAR(OrderDate) [Year],
SUM(TotalAmount) TotalAmountForYear 
FROM dbo.Orders
GROUP BY YEAR(OrderDate)
---------------------------------------------------------------------------
 /*
3
مجموع فروش: (مجموع مبلغ سفارشت) برای هر دسته‌ای محصول را حساب کنید.
*/

SELECT 
c.Name [CategoryName],
SUM(o.TotalAmount) TotalAmountByCategory,
COUNT(o.Id) TotalOrderByCategory 
FROM dbo.Orders o
INNER JOIN dbo.Products p
ON p.Id = o.ProductId
INNER JOIN dbo.Categories c
ON c.Id = p.CategoryId
GROUP BY c.Name
--------------------------------------------------------------------

 /*
4
نام محصولات و قمیت آن را به ترتیب  قیمت از بالا به پایین نمایش دهید
*/

SELECT * FROM dbo.Products ORDER BY Name,Price DESC


--------------------------------------------------------------------
 /*
5
تعداد سفارشاتی که هر مشتری ثبت کرده است را محاسبه کنید. 
*/

SELECT c.Name,
COUNT(o.Id) CountOrders 
FROM dbo.Customers C
INNER JOIN dbo.Orders O
ON O.CustomerId = C.Id
GROUP BY c.Name

--------------------------------------------------------------------
 /*
6
متوسط قیمت محصولات در هر دسته بندی را محاسبه کنید.
*/

SELECT c.Name,AVG(P.Price) AveragePrice
FROM dbo.Products P
INNER JOIN dbo.Categories C 
ON C.Id = P.CategoryId
GROUP BY c.Name

--------------------------------------------------------------------
 /*
7
نام محصولات و دسته بندی را به تریتب حروف الفبایی نمایش دهید
*/

SELECT * FROM dbo.Products P
INNER JOIN dbo.Categories C
ON C.Id = P.CategoryId
ORDER BY C.Name,P.Name ASC

--------------------------------------------------------------------
 /*
8
مجموع مبلغ سفارشات ثبت شده هر دسته بندی در سال 2023 را نمایش دهید
*/

SELECT SUM(TotalAmount)TotalAmount FROM dbo.Orders WHERE YEAR(OrderDate) = '2023'

--------------------------------------------------------------------
 /*
9
تعداد سفارشاتی که در هر ماه از سال ثبت شده است را محاسبه کنید
*/

SELECT YEAR(OrderDate),
DATENAME(month, OrderDate),
COUNT(*) CountOrders
FROM dbo.Orders 
GROUP BY YEAR(OrderDate),DATENAME(month, OrderDate)
ORDER BY YEAR(OrderDate)

--------------------------------------------------------------------
 /*
10
مجموع فروش (مجموع مبلغ سفارشات) برای هر مشتری را نمایش دهید
*/

SELECT 
c.Name,
SUM(O.TotalAmount) SUMTotalAmount
FROM dbo.Orders O
INNER JOIN dbo.Customers C
ON C.Id = O.CustomerId
GROUP BY c.Name

--------------------------------------------------------------------
 /*
11
نام دسته بندی و تعداد سفارشات ثبت شده در هر دسته بندی را  نمایش دهید
*/

SELECT 
c.Name CategoryName ,
COUNT(*) CountOrders
FROM dbo.Orders O
INNER JOIN dbo.Products P 
ON P.Id = O.ProductId
INNER JOIN dbo.Categories C
ON C.Id = P.CategoryId
GROUP BY c.Name

--------------------------------------------------------------------
 /*
12
نام و تعداد سفارشات هر مشتری را به ترتیب تعداد سفارشات از زیاد به کم نمایش دهید
*/

SELECT 
c.Name,
COUNT(*) CountOrders
FROM dbo.Orders O
INNER JOIN dbo.Customers C
ON C.Id = O.CustomerId
GROUP BY c.Name
ORDER BY COUNT(*) DESC

--------------------------------------------------------------------
 /*
13
تعداد سفارشات ثبت شده در هر سال را محاسبه کنید.
*/

SELECT 
YEAR(OrderDate) [Year],
COUNT(*) [Count]
FROM dbo.Orders
GROUP BY YEAR(OrderDate)

--------------------------------------------------------------------
 /*
14
نام محصولات و تعداد خریداران هر محصول را به ترتیب تعداد خریدارن از زیاد به کم نمایش دهید
*/

SELECT
p.Name,
COUNT(o.Id) CountOrders
FROM dbo.Products P
LEFT JOIN dbo.Orders O 
ON O.ProductId = P.Id
LEFT JOIN dbo.Customers C
ON C.Id = O.CustomerId
GROUP BY p.Name
ORDER BY CountOrders DESC

