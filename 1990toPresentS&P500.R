library(quantmod)
library(tidyverse)

getSymbols("^GSPC", src = "yahoo", from = "1990-01-01")

chartSeries(GSPC,
            name = "S&P 500 Index (1990–Present)",
            theme = chartTheme("white"),
            TA = "addSMA(200)")

