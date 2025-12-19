library(quantmod)
library(ggplot2)

sp_2007 <- tq_get("^GSPC", from = "2005-01-01", to = "2011-05-01")
sp_2020 <- tq_get("^GSPC", from = "2019-01-01", to = "2021-01-01")
sp_now  <- tq_get("^GSPC", from = "2025-05-01")

# Normalize both to 100 at start for shape comparison
normalize <- function(df) {
  df %>% mutate(norm = adjusted / adjusted[1] * 100)
}

sp_2007_n <- normalize(sp_2007)
sp_2020_n  <- normalize(sp_2020)
sp_now_n  <- normalize(sp_now)

sp_2007_n <- sp_2007_n %>% mutate(period = "2005-2011")
sp_2020_n <- sp_s2020_n %>% mutate(period = "2019-2021")
sp_now_n  <- sp_now_n  %>% mutate(period = "Present")

all_sp <- bind_rows(sp_2007_n, sp_2020_n, sp_now_n)

ggplot(all_sp, aes(x = date, y = norm, color = period)) +
  geom_line(linewidth = 1) +
  labs(
    title = "S&P 500 Market Trajectories Across Crises (Normalized)",
    y = "Index (Normalized to 100)",
    x = "Date",
    color = "Period"
  ) +
  theme_minimal()
