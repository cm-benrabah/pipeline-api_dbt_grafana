-- models/cleaned_crypto_data.sql

WITH cleansed_crypto_data AS (
    SELECT
        *
    FROM {{ ref('crypto_data_raw') }}  -- The ref function refers to the source table
    --WHERE price IS NOT NULL  -- Ensure price is not null
)
SELECT 
    symbol,                                 -- Ticker symbol of the cryptocurrency
    name,                                   -- Name of the cryptocurrency
    current_price,                          -- Current price of the cryptocurrency
    market_cap,                             -- Market capitalization of the cryptocurrency
    market_cap_rank,                        -- Rank of the cryptocurrency by market capitalization
    total_volume,                           -- Total trading volume in the last 24 hours
    high_24h,                               -- Highest price in the last 24 hours
    low_24h,                                -- Lowest price in the last 24 hours
    price_change_percentage_24h,            -- Percentage change in price over the last 24 hours
    circulating_supply,                     -- Circulating supply of the cryptocurrency
    max_supply,                             -- Maximum supply of the cryptocurrency
    last_updated                            -- Last time the data was updated
FROM 
    cleansed_crypto_data
WHERE 
    market_cap IS NOT NULL                  -- Filter to include only entries with a valid market cap
ORDER BY 
    market_cap_rank                      -- Order by rank based on market capitalization

