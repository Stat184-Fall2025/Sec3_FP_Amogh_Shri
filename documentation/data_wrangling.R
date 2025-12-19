library(tidyquant)
library(dplyr)
library(tidyr)
library(ggplot2)

# 1. Fed Rates
fed <- tq_get("FEDFUNDS", get = "economic.data") %>%
  filter(date >= as.Date("2010-01-01"))

# View(fed)

# 2. S&P 500 and CPI

# S&P 500 Index
sp <- tq_get("^GSPC", from = "2020-01-01", to = "2022-06-01") %>%
  mutate(norm = adjusted / adjusted[1] * 100)

# CPI (Consumer Price Index)
cpi <- tq_get("CPIAUCSL", get = "economic.data") %>%
  filter(date >= as.Date("2020-01-01")) %>%
  mutate(norm = price / price[1] * 100)


# 3. Yield Curve Spread (10Y - 2Y)
yc <- tq_get(c("DGS10", "DGS2"), get = "economic.data") %>%
  spread(symbol, price) %>%
  mutate(spread = DGS10 - DGS2)
