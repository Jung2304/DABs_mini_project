CREATE OR REFRESH STREAMING TABLE dabs_mini.enriched.people_cleansed
(
    CONSTRAINT valid_order_id EXPECT (Order_ID IS NOT NULL),
    CONSTRAINT valid_customer EXPECT (Customer_Name IS NOT NULL),
    CONSTRAINT valid_sales_rep EXPECT (Sales_Rep IS NOT NULL),
    CONSTRAINT valid_region EXPECT (Region IS NOT NULL),
    CONSTRAINT valid_country EXPECT (Country IS NOT NULL),
    CONSTRAINT valid_sales_channel EXPECT (Sales_Channel IS NOT NULL)
) 
AS 
SELECT * 
FROM STREAM(dabs_mini.conformed.people_raw);

CREATE OR REFRESH STREAMING TABLE dabs_mini.enriched.sales_cleansed 
AS
SELECT
    *,
    (Unit_Price - Unit_Cost) AS Profit_Per_Unit
FROM STREAM(dabs_mini.conformed.sales_raw); 

