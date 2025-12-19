library(tidyquant)
library(ggplot2)

fed <- tq_get("FEDFUNDS", get = "economic.data")

ggplot(fed, aes(date, price)) +
  geom_line(linewidth = 1) +
  labs(
    title = "Federal Funds Rate (Policy Signal)",
    y = "Percent",
    x = "Date"
  ) +
  theme_minimal()
