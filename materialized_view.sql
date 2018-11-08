CREATE MATERIALIZED VIEW MV_MUSIC_LISTENING (, ShopID, Profit) AS
    SELECT BookID, ShopID, SUM(TotPrice)
    FROM Fact_Book_Sales
    GROUP BY BookID, ShopID