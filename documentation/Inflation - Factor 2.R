library(tidyquant)
library(ggplot2)

  sp <- tq_get("^GSPC", from = "2020-01-01", to = "2022-06-01")
  cpi <- tq_get("CPIAUCSL", get = "economic.data")

ggplot() +
  geom_line(data = sp, aes(date, adjusted / adjusted[1] * 100),
            linewidth = 1) +
  geom_line(data = cpi, aes(date, price / price[1] * 100),
            linetype = "dashed") +
  labs(
    title = "S&P 500 vs Inflation (CPI)",
    y = "Index (Normalized)",
    x = "Date"
  ) +
  theme_minimal()
  
