ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", span = 0.2, color = "yellow") +
  facet_wrap( ~ cyl)
