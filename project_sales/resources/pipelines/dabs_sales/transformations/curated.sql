CREATE OR REFRESH MATERIALIZED VIEW dabs_mini.curated.salesRep
AS
SELECT 
    people_cleansed.Sales_Rep AS Salesman, 
    ROUND(SUM(sales_cleansed.Total_Profit), 0) AS Sales_Total,
    DATE_FORMAT(sales_cleansed.Order_Date, 'yyyy-MM') AS MonthOfSale
FROM
    dabs_mini.enriched.people_cleansed
LEFT JOIN 
    dabs_mini.enriched.sales_cleansed
ON
    people_cleansed.Order_ID = sales_cleansed.Order_ID
GROUP BY 
    people_cleansed.Sales_Rep, 
    DATE_FORMAT(sales_cleansed.Order_Date, 'yyyy-MM');


CREATE OR REFRESH MATERIALIZED VIEW dabs_mini.curated.itemInRegion
AS
SELECT 
    Region, 
    Item_Type,
    ROUND(SUM(Total_Profit), 0) AS Sales_Total,
    DATE_FORMAT(Order_Date, 'yyyy-MM') AS MonthOfSale
FROM
    dabs_mini.enriched.sales_cleansed
GROUP BY
    Region,
    Item_Type,
    DATE_FORMAT(Order_Date, 'yyyy-MM')


