library(tidyquant)
library(ggplot2)

yc <- tq_get(c("DGS10", "DGS2"), get = "economic.data") %>%
  spread(symbol, price) %>%
  mutate(spread = DGS10 - DGS2)

ggplot(yc, aes(date, spread)) +
  geom_line(linewidth = 1) +
  geom_hline(yintercept = 0, linetype = "dashed") +
  labs(
    title = "Yield Curve Spread (10Y–2Y)",
    y = "Spread (%)",
    x = "Date"
  ) +

  theme_minimal()
