ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_line() +
  geom_smooth()
