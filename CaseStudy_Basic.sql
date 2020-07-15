CREATE DATABASE CASESTUDY_BASIC

USE CASESTUDY_BASIC


--DATA PREPARATION AND UNDERSTANDING

  --1. What is the total number of rows in each of the 3 tables in the database? 

    SELECT * FROM
    ( SELECT 'Customer' AS Table_Name,COUNT(*) [Total Number of Rows] FROM Customer UNION ALL
      SELECT 'Transactions' AS Table_Name,COUNT(*) [Total Number of Rows] FROM Transactions UNION ALL
      SELECT 'Prod_cat_info' AS Table_Name,COUNT(*) [Total Number of Rows] FROM Prod_cat_info ) TBL


  --2. What is the total number of transactions that have a return? 

    SELECT COUNT(QTY)  [No of Transactions with return] FROM Transactions WHERE QTY<1

  --4. What is the time range of the transaction data available for analysis? Show the output in number of days, months and years simultaneously in different columns. 

   SELECT MIN(tran_date)[Start Date],Max(tran_date)[End Date],
   DATEDIFF(YEAR,MIN(tran_date),Max(tran_date))[No Of Years],
   DATEDIFF(MONTH,MIN(tran_date),Max(tran_date))[No Of Months],
   DATEDIFF(DAY,MIN(tran_date),Max(tran_date))[No Of Days]
   FROM Transactions

  --5. Which product category does the sub-category “DIY” belong to? 

   SELECT  prod_cat[Product Category] FROM Prod_cat_info WHERE prod_subcat='DIY'



-- DATA ANALYSIS 


  --1. Which channel is most frequently used for transactions?
 
   SELECT TOP 1 Store_type,COUNT(Store_type)[No of Transactions] FROM Transactions GROUP BY Store_type ORDER BY COUNT(Store_type) DESC


  --2. What is the count of Male and Female customers in the database? 

   SELECT * FROM
   (
   SELECT 'Females' AS Category, COUNT(customer_Id) [Total Count]
   FROM Customer
   WHERE Gender='F'
   UNION ALL
   SELECT 'Males' AS Category, COUNT(customer_Id) [Total Count]
   FROM Customer
   WHERE Gender='M')TBL


 --3. From which city do we have the maximum number of customers and how many?
 
   SELECT TOP 1 city_code,COUNT(customer_Id)[No of Customers] FROM Customer WHERE city_code IS NOT NULL 
   GROUP BY city_code ORDER BY 2 DESC


 --4. How many sub-categories are there under the Books category? 

   SELECT COUNT(prod_subcat)[Subcategories] FROM Prod_cat_info WHERE prod_cat='Books'


 --5. What is the maximum quantity of products ever ordered? 

   SELECT MAX(Qty)[Maximum Qty of product ordered] FROM Transactions


  --6.What is the net total revenue generated in categories Electronics and Books? 

   SELECT 'Books' As Category, ROUND(SUM(Total_amt),2)[Net Total Revenue]
   FROM Transactions T1
   LEFT JOIN Prod_cat_info T2 ON T1.prod_cat_code=T2.prod_cat_code AND T1.prod_subcat_code=T2.prod_sub_cat_code
   WHERE prod_cat ='Books'
   UNION 
   SELECT 'Electronic' As Category, ROUND(SUM(Total_amt),2)[Net Total Revenue]
   FROM Transactions T1
   LEFT JOIN Prod_cat_info T2 ON T1.prod_cat_code=T2.prod_cat_code AND T1.prod_subcat_code=T2.prod_sub_cat_code
   WHERE prod_cat ='Electronics'

  
  --7. How many customers have >10 transactions with us, excluding returns? 

   SELECT COUNT(*)[Number of Customers] FROM
   ( SELECT cust_id,COUNT(Qty)[No_of_Transactions] FROM Transactions 
   WHERE QTY>0 
   GROUP BY cust_id 
   HAVING COUNT(Qty)>10 
    )T1
 
  --8. What is the combined revenue earned from the “Electronics” & “Clothing” categories, from “Flagship stores”? 

  SELECT ROUND(SUM(Total_amt),2)[Net Total Revenue]
  FROM Transactions T1
  LEFT JOIN Prod_cat_info T2 ON T1.prod_cat_code=T2.prod_cat_code AND T1.prod_subcat_code=T2.prod_sub_cat_code
  WHERE prod_cat IN ('Clothing','Electronics') AND Store_type='Flagship Store'

  --9. What is the total revenue generated from “Male” customers in “Electronics” category? Output should display total revenue by prod sub-cat. 
 
  SELECT gender, prod_cat[Product Category],prod_subcat[Product SubCategory],SUM(total_amt)[Total Revenue Generated]
  FROM Customer 
  INNER JOIN Transactions T2 ON customer_Id=cust_id
  INNER JOIN Prod_cat_info T3 ON T2.prod_cat_code=T3.prod_cat_code AND T2.prod_subcat_code=T3.prod_sub_cat_code
  WHERE Gender='M' AND prod_cat='Electronics'
  GROUP BY prod_cat,prod_subcat,gender


  --10.What is percentage of sales and returns by product sub category; display only top 5 sub categories in terms of sales? 

   SELECT TOP 5 SUBCAT AS [SubCategory],
   ( CASE WHEN SALES IS NOT NULL THEN ROUND(SALES/(SELECT SUM(CAST(total_amt AS FLOAT)) AS TOT FROM Transactions)*100,2) END) AS Sales_Percentage,
   ( CASE WHEN RETURNS IS NOT NULL THEN ABS(ROUND(RETURNS/(SELECT SUM(CAST(total_amt AS FLOAT)) AS TOT FROM Transactions)*100,2)) END) AS Returns_Percentage
    FROM ( SELECT prod_subcat AS SUBCAT,
         SUM( CASE WHEN CAST(total_amt AS FLOAT)>0 THEN CAST(total_amt AS FLOAT)END) AS SALES,
         SUM( CASE WHEN CAST(total_amt AS FLOAT)<0 THEN CAST(total_amt AS FLOAT)END) AS RETURNS
         FROM Transactions T
         INNER JOIN Prod_cat_info P ON T.prod_subcat_code=P.prod_sub_cat_code AND T.prod_cat_code=P.prod_cat_code
         GROUP BY prod_subcat)T
    ORDER BY SALES DESC
   

  --11. For all customers aged between 25 to 35 years find what is the net total revenue generated by these consumers in last 30 days of transactions from max transaction date available in the data?
   
  SELECT SUM(CAST(total_amt AS FLOAT)) AS Total_Revenue
  FROM Customer AS T1
  INNER JOIN Transactions AS T2 ON T1.customer_Id=T2.cust_id
  WHERE 
  (CONVERT(DATE,tran_date,103)>=DATEADD(DAY,-30,(SELECT MAX(CONVERT(DATE,tran_date,103)) FROM Transactions))) AND
  (DATEDIFF(YEAR,CONVERT(DATE,DOB,103),(SELECT MAX(CONVERT(DATE,tran_date,103)) FROM Transactions)) BETWEEN 25 AND 35)
  GO


  --12.Which product category has seen the max value of returns in the last 3 months of transactions?

  SELECT  top 1 prod_cat,COUNT(Qty)[No Of Returns] FROM Prod_cat_info T1
  INNER JOIN Transactions T2 ON T1.prod_cat_code=T2.prod_cat_code AND T1.prod_sub_cat_code=T2.prod_subcat_code
  WHERE QTY<0 AND DATEDIFF(MONTH,tran_date,(SELECT MAX(tran_date) FROM Transactions))<=3
  GROUP BY prod_cat
  ORDER BY 2 DESC
 

 --13.Which store-type sells the maximum products; by value of sales amount and by quantity sold? 
 
  SELECT * FROM
  ( SELECT TOP 1 'By Value of Sales' AS Maximum_Product,  Store_type FROM Transactions
  GROUP BY Store_type
  ORDER BY SUM(Qty) DESC
  UNION ALL
  SELECT TOP 1 'By Quantity Sold' AS Maximum_Product,Store_type  FROM Transactions
  GROUP BY Store_type
  ORDER BY SUM(total_amt) DESC)TBL

  

 --14.What are the categories for which average revenue is above the overall average. 

   SELECT prod_cat ,ROUND(AVG(total_amt),2)[Average Revenue]
   FROM Prod_cat_info T1 
   INNER JOIN Transactions T2 ON T1.prod_cat_code=T2.prod_cat_code 
   GROUP BY prod_cat
   HAVING AVG(total_amt)>=(SELECT AVG(total_amt) FROM Transactions)
  
  
   --15. Find the average and total revenue by each subcategory for the categories which are among top 5 categories in terms of quantity sold. 

  SELECT prod_cat[Category],prod_subcat[SubCategory],ROUND(SUM(total_amt),2)[Total Revenue],ROUND(AVG(total_amt),2)[Average Revenue] FROM Prod_cat_info  T1
  INNER JOIN Transactions T2 ON T1.prod_cat_code=T2.prod_cat_code AND T1.prod_sub_cat_code=T2.prod_subcat_code 
  WHERE prod_cat IN
           ( SELECT TOP 5 prod_cat from  Prod_cat_info T1
             INNER JOIN Transactions T2 ON T1.prod_cat_code=T2.prod_cat_code AND T1.prod_sub_cat_code=T2.prod_subcat_code 
              GROUP BY prod_cat ORDER BY SUM(Qty) DESC)
  GROUP BY prod_subcat,prod_cat 

 