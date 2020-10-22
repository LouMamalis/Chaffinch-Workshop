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


fig1 <- ggplot(chaff2, aes(x = sex, y = mass)) +
  geom_boxplot()

units <- "in"  
fig_w <- 3.5
fig_h <- fig_w
dpi <- 300
device <- "tiff"

ggsave("fig1-chaff.tiff",
       plot = fig1,
       device = device,
       width = fig_w,
       height = fig_h,
       units = units,
       dpi = dpi)
