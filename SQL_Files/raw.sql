CREATE OR REPLACE STREAMING TABLE dabs_mini.conformed.people_raw
(
    name STRING,
    yob STRING,
    income STRING,
    education STRING,
    graduation STRING,
    standing STRING
) AS
SELECT *
FROM STREAM read_files(
    '/Volumes/dabs_mini/default/mini_proj/',
    format => 'csv',
    header => true,
    pathGlobFilter => 'people.csv'
);

CREATE OR REPLACE STREAMING TABLE dabs_mini.conformed.sales_raw
(
    Region          STRING,
    Country         STRING,
    Item_Type       STRING,
    Sales_Channel   STRING,
    Order_Priority  STRING,
    Order_Date      DATE,
    Order_ID        STRING,
    Ship_Date       DATE,
    Units_Sold      INT,
    Unit_Price      DECIMAL(10,2),
    Unit_Cost       DECIMAL(10,2),
    Total_Revenue   DECIMAL(12,2),
    Total_Cost      DECIMAL(12,2),
    Total_Profit    DECIMAL(12,2)
) AS
SELECT *
FROM STREAM read_files(
    '/Volumes/dabs_mini/default/mini_proj/',
    format => 'csv',
    header => true,
    pathGlobFilter => 'sales.csv'
);

