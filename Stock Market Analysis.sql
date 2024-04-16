use synthetic_stock_datastock;
/*1*/
/*Average Daily Trading Volume*/
SELECT Ticker, 
COUNT(*) AS TotalDaysTraded, SUM(Volume) AS TotalSharesTraded, AVG(Volume) AS AvgSharesTraded
FROM synthetic_stock_data
GROUP BY Ticker;

/*2*/
/*Most Volatile Stocks*/
SELECT Ticker, Beta
FROM synthetic_stock_data
ORDER BY Beta DESC
LIMIT 5;   

/*3*/
/*Stocks with Highest Dividend and Lowest Dividend*/
-- Stocks with the Highest Dividend
SELECT Ticker, DividendAmount
FROM synthetic_stock_data
ORDER BY DividendAmount DESC
LIMIT 10; 

-- Stocks with the Lowest Dividend
SELECT Ticker, DividendAmount
FROM synthetic_stock_data
WHERE DividendAmount > 0 
ORDER BY DividendAmount ASC
LIMIT 10;

/*4*/
/*(a) Highest P/E Ratios*/
select Ticker,PERatio
from synthetic_stock_data
order by PERatio desc
limit 1;

/*(b) Lowest P/E Ratios*/
select Ticker,PERatio
from synthetic_stock_data
order by PERatio 
limit 1;

/*5*/
/*Stocks with Highest Market Cap*/
select Ticker,MarketCap
from synthetic_stock_data
order by MarketCap desc
limit 1;

/*6*/
/*Stocks Near 52 Week High*/
SELECT ticker, MAX(52WeekHigh) 
FROM synthetic_stock_data
WHERE date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR)
GROUP BY ticker;

/*7*/
/*Stocks Near 52 Week Low*/
SELECT ticker, min(52WeekHigh) 
FROM synthetic_stock_data
WHERE date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR)
GROUP BY ticker;

/*8*/
/*Stocks with Strong Buy Signals and stocks with Strong Selling Signal*/
SELECT RSI,Ticker
FROM synthetic_stock_data
WHERE 
    RSI < 45 OR -- Oversold market
    (RSI BETWEEN 45 AND 68) OR -- Neutral zone
    RSI >= 69;
    
SELECT MACD,Ticker
FROM  synthetic_stock_data
WHERE MACD > 0 -- bullish
   OR MACD < 0;-- bearish