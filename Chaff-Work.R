chaff <- read.table('chaff.txt', header = T)

chaff2<- chaff%>% 
  pivot_longer(names_to = "sex", 
               values_to = "mass",
               cols = everything())

summary(file)
library('tidyverse')

chaff2
summary(chaff2)

chaff2 %>% group_by(sex) %>%
  summarise(mean = mean(mass),
            n = length(mass),
            sdev = sd(mass),
            median = median(mass))

t.test(data = chaff2, #two sample t.test significant difference between male and female mass 
       mass ~ sex,
       var.equal = T)

#ggplot(data = chaff2,
       aes(x = mean, y = residual)) +
  geom_point()

fig 1 <- ggplot(chaff2, aes(sex, mass)) +
  geom_boxplot()

ggsave