#Ideas for Part B
```{r}
df_avg <- df %>% group_by(country) %>% 
  summarise('Average kWh/Capita'=mean(energy_per_capita), 'Average kWh/GDP'=mean(energy_per_gdp))

ggplot(df_avg,aes(x=`Average kWh/Capita`,y=`Average kWh/GDP`, colour=country)) + 
  geom_point()
```




#FIGURE
```{r}
df_avg_sum <- df %>% group_by(year) %>% 
  summarise('Avg_kWh'=round(mean(energy_per_capita),2),
            'Sum_kWh'=round(sum(energy_per_capita),2),
            'Sum_Population_(Millions)'= round(sum(population/1e6),2)) 
  
  
ggplot(df_avg_sum,aes(x=year,y=Sum_kWh)) + 
  geom_point(colour="black", size = 3) +
  #geom_smooth(method = "lm", se = FALSE, color = "blue") +
  scale_x_continuous(breaks=seq(1985, 2022,3)) +
  ylab("Total Energy (kWh) per Capita") +
  labs(title="Total Energy Consumption per Capita from 1985 to 2022", subtitle = "Aggregate data from the 10 largest Nations by Energy Consumption")
```


# TABLE maybe include growth?
```{r echo=FALSE}
df %>% group_by(year) %>% 
  summarise('Avg kWh/Capita'=round(mean(energy_per_capita),2),
            'Sum kWh/Capita'=round(sum(energy_per_capita),2),
            'Avg Population (Millions)'= round(mean(population/1e6),2),
            'Sum Population (Millions)'= round(sum(population/1e6),2)) %>% 
  tail(10) %>% 
  kable(caption="Averages and Totals of Energy Consumption (kWh) by Capita and Population (Millions) Number fron 2008 to 2018")

```






