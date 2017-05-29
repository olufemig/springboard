# titanic is available in your workspace
str(titanic)
# Check out the structure of titanic
summary(titanic)
# Use ggplot() for the first instruction
ggplot(titanic, aes(x=factor(Pclass),fill=factor(Sex))) +
  geom_bar(position= "dodge") +
  geom_line
# Use ggplot() for the second instruction


# Position jitter (use below)
posn.j <- position_jitter(0.5, 0)

# Use ggplot() for the last instruction


