library(tidyverse)
library(quantmod)
library(tidyquant)
library(janitor)

sp_2007_raw <- tq_get("^GSPC", from = "2005-01-01", to = "2011-05-01")
sp_2020_raw <- tq_get("^GSPC", from = "2019-01-01", to = "2021-01-01")
sp_now_raw  <- tq_get("^GSPC", from = "2025-05-01")

normalize_index <- function(df) {
  df %>%
    mutate(norm = adjusted / adjusted[1] * 100)
}

sp_2007_norm <- sp_2007_raw %>%
  normalize_index() %>%
  mutate(period = "2005–2011")

sp_2020_norm <- sp_2020_raw %>%
  normalize_index() %>%
  mutate(period = "2019–2021")

sp_now_norm <- sp_now_raw %>%
  normalize_index() %>%
  mutate(period = "Present")


all_sp_norm <- bind_rows(
  sp_2007_norm,
  sp_2020_norm,
  sp_now_norm
)

getSymbols("^GSPC", src = "yahoo", from = "1990-01-01")

# Convert xts → tibble
sp_1990_raw <- GSPC %>%
  as.data.frame() %>%
  rownames_to_column("date") %>%
  as_tibble() %>%
  mutate(date = as.Date(date))

# Clean column names
sp_1990_clean <- sp_1990_raw %>%
  clean_names() %>%
  rename(
    open   = gspc_open,
    high   = gspc_high,
    low    = gspc_low,
    close  = gspc_close,
    volume = gspc_volume,
    adj    = gspc_adjusted
  )

ggplot(all_sp_norm, aes(x = date, y = norm, color = period)) +
  geom_line(linewidth = 1) +
  labs(
    title = "S&P 500 Market Trajectories Across Crises (Normalized)",
    y = "Index (Normalized to 100)",
    x = "Date",
    color = "Period"
  ) +
  theme_minimal()

chartSeries(
  GSPC,
  name = "S&P 500 Index (1990–Present)",
  theme = chartTheme("white"),
  TA = "addSMA(200)"
)
