ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_hline(yintercept = 25) +
  geom_line() +
  geom_smooth(method = "lm", span = 0.2, color = "yellow") +
  facet_wrap( ~ cyl)
