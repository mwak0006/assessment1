#Ideas for Part B
```{r}
df_avg <- df %>% group_by(country) %>% 
  summarise('Average kWh/Capita'=mean(energy_per_capita), 'Average kWh/GDP'=mean(energy_per_gdp))

ggplot(df_avg,aes(x=`Average kWh/Capita`,y=`Average kWh/GDP`, colour=country)) + 
  geom_point()
```