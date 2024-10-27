/* CREATE TABLE crypto_data_2 (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    symbol VARCHAR(10) NOT NULL,
    market_cap BIGINT,
    price DECIMAL(16, 8),
    volume_24h BIGINT,
    circulating_supply BIGINT,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
 */
 
 CREATE TABLE crypto_data (
    id VARCHAR(255) PRIMARY KEY,                 -- Unique identifier for the cryptocurrency
    symbol VARCHAR(10),                          -- Ticker symbol of the cryptocurrency
    name VARCHAR(255),                           -- Name of the cryptocurrency
    image TEXT,                                  -- URL of the cryptocurrency image
    current_price DECIMAL(18, 2),                -- Current price of the cryptocurrency
    market_cap BIGINT,                           -- Market capitalization of the cryptocurrency
    market_cap_rank INT,                         -- Rank of the cryptocurrency by market capitalization
    fully_diluted_valuation BIGINT,              -- Fully diluted valuation of the cryptocurrency
    total_volume BIGINT,                         -- Total trading volume in the last 24 hours
    high_24h DECIMAL(18, 2),                     -- Highest price in the last 24 hours
    low_24h DECIMAL(18, 2),                      -- Lowest price in the last 24 hours
    price_change_24h DECIMAL(18, 2),             -- Price change in the last 24 hours
    price_change_percentage_24h DECIMAL(10, 6),  -- Percentage change in price over the last 24 hours
    market_cap_change_24h BIGINT,                -- Change in market capitalization in the last 24 hours
    market_cap_change_percentage_24h DECIMAL(10, 6), -- Percentage change in market cap in the last 24 hours
    circulating_supply DECIMAL(18, 2),           -- Circulating supply of the cryptocurrency
    total_supply DECIMAL(18, 2),                 -- Total supply of the cryptocurrency
    max_supply DECIMAL(18, 2),                   -- Maximum supply of the cryptocurrency
    ath DECIMAL(18, 2),                          -- All-time high price
    ath_change_percentage DECIMAL(10, 6),        -- Percentage change from the all-time high price
    ath_date TIMESTAMP,                          -- Date and time when the all-time high was reached
    atl DECIMAL(18, 2),                          -- All-time low price
    atl_change_percentage DECIMAL(10, 6),        -- Percentage change from the all-time low price
    atl_date TIMESTAMP,                          -- Date and time when the all-time low was reached
    --roi DECIMAL(18, 6),                          -- Return on investment (null for Bitcoin in this case)
    last_updated TIMESTAMP                       -- Last time the data was updated
);
