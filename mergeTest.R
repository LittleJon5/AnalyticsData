ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", span = 0.2, color = "green") +
  facet_wrap( ~ cyl)
