CREATE OR REPLACE STREAMING TABLE dabs_mini.conformed.people_raw
AS
SELECT 
    `Order ID` AS Order_ID,
    `Customer Name` AS Customer_Name,
    `Sales Rep` AS Sales_Rep,
    Region,
    Country,
    `Sales Channel` AS Sales_Channel
FROM STREAM read_files(
    '/Volumes/dabs_mini/default/mini_proj/',
    format => 'csv',
    header => true,
    pathGlobFilter => 'people.csv'
);

CREATE OR REPLACE STREAMING TABLE dabs_mini.conformed.sales_raw
AS
SELECT
    Region,
    Country,
    `Item Type` AS Item_Type,
    `Sales Channel` AS Sales_Channel,
    `Order Priority` AS Order_Priority,

    to_date(`Order Date`, 'yyyy-MM-dd') AS Order_Date,

    `Order ID` AS Order_ID,

    to_date(`Ship Date`, 'yyyy-MM-dd') AS Ship_Date,

    CAST(`Units Sold` AS INT)              AS Units_Sold,
    CAST(`Unit Price` AS DECIMAL(10,2))    AS Unit_Price,
    CAST(`Unit Cost` AS DECIMAL(10,2))     AS Unit_Cost,
    CAST(`Total Revenue` AS DECIMAL(12,2)) AS Total_Revenue,
    CAST(`Total Cost` AS DECIMAL(12,2))    AS Total_Cost,
    CAST(`Total Profit` AS DECIMAL(12,2))  AS Total_Profit

FROM STREAM read_files(
    '/Volumes/dabs_mini/default/mini_proj/',
    format => 'csv',
    header => true,
    pathGlobFilter => 'sales.csv'
);

