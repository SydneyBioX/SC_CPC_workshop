# library(scMerge)
# library(purrr)
# library(furrr)
# 
# plan(multicore, workers = 5)
# set.seed(1234)
# nCells = c(100, 200, 500, 1000, 2000, 5000)
# 
# listSim = purrr::map(.x = nCells, 
#                      .f = ~ scMerge::ruvSimulate(m = .x, n = 20000, lambda = 5, sce = TRUE))
# 
# list_scMerge = furrr::future_map(
#   .x = listSim,
#   .f = ~ scMerge::scMerge(sce_combine = .x,
#                    ctl = paste0('gene', 1:500),
#                    cell_type = .x$cellTypes,
#                    ruvK = 10, assay_name = "scMerge_sim"),
#   .progress = TRUE)
# 
# list_scMerge_time = purrr::map(.x = list_scMerge, 
#                                .f = ~ .x@metadata$timeRuv)
# 
# 
# list_scMerge_fast = furrr::future_map(
#   .x = listSim,
#   .f = ~ scMerge::scMerge(sce_combine = .x,
#                           ctl = paste0('gene', 1:500),
#                           cell_type = .x$cellTypes,
#                           ruvK = 10, assay_name = "scMerge_sim", fast_svd = TRUE),
#   .progress = TRUE)
# 
# list_scMerge_fast_time = purrr::map(.x = list_scMerge_fast, 
#                                .f = ~ .x@metadata$timeRuv)
# save(list_scMerge_time, list_scMerge_fast_time, file = "~/Desktop/scMerge_time.RData")

load("~/Desktop/scMerge_time.RData")
library(tidyverse)
scMerge_slow_time = tibble(
  num_cells = c(100, 200, 500, 1000, 2000, 5000),
  time = purrr::map_dbl(.x = list_scMerge_time, .f = ~ as.numeric(.x, units = "secs")), 
  type = "default"
)

scMerge_fast_time = tibble(
  num_cells = c(100, 200, 500, 1000, 2000, 5000),
  time = purrr::map_dbl(.x = list_scMerge_fast_time, .f = ~ as.numeric(.x, units = "secs")),
  type = "fast"
)


timeplotdf = bind_rows(scMerge_slow_time,
                       scMerge_fast_time)


timeplotdf %>% 
  dplyr::filter(num_cells >= 200) %>% 
  ggplot(aes(x = as.factor(num_cells), 
             y = time, 
             colour = type, 
             group = type)) +
  geom_point(size = 2) +
  geom_line(size = 1.2) +
  scale_y_log10(breaks = c(1, 5, 10, 20, 50, 100, 200, 500, 1000, 1500)) +
  scale_color_brewer(palette = "Set1") +
  labs(x = "Number of cells", 
       y = "Time (s)",
       title = "Computational time of scMerge", 
       subtitle = "Number of genes fixed at 20,000") +
  theme_bw(14) +
  theme(legend.position = "bottom",
        panel.grid.minor = element_blank())
ggsave(filename = "scMerge_time.png", height = 6, width = 6)
