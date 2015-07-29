ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_hline(yintercept = 25) +
  geom_line() +
<<<<<<< HEAD
  geom_smooth(method = "lm", span = 0.2, color = "red") +
=======
  geom_smooth(method = "lm", span = 0.2, color = "green") +
>>>>>>> 544e26a59681344b62c0e38a5bae4451d282223d
  facet_wrap( ~ cyl)
