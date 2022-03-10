# Class 05 Data Visualization

# This is the "base" R  plot
plot(cars)

# Get a new plotting package/library called ggplot2
# install.packages("ggplot2")

# Call/load the package into the R brain
library(ggplot2)

# Sets up the plot
ggplot(cars)

ggplot(data=cars) + aes(x=dist, y=speed) + geom_point()

# Add a line
ggplot(data=cars) + 
  aes(x=dist, y=speed) + 
  geom_point() + 
  geom_smooth(method="lm", se=FALSE)

# Add more layers
ggplot(data=cars) + 
  aes(x=dist, y=speed) + 
  geom_point() +
  geom_smooth(method="lm", se=FALSE) +
  labs(title="Speed and Stopping Distances of Cars",
       x="Speed (MPH)",
       y="Stopping Distance (ft)",
       subtitle="For a given speed, how far must a car go to stop?",
       caption="Dataset: 'cars'",
       ) +
  theme_bw()



# RNASeq experiment data set
# Read the data in R
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

nrow(genes)
colnames(genes)
ncol(genes)

# Plot the result
ggplot(genes) +
  aes(x=Condition1, y=Condition2) +
  geom_point()

# Q. How many genes are up-regulated?
table(genes$State)

# Add some color to denote up/down values
 p <- ggplot(genes) +
  aes(x=Condition1, y=Condition2, color=State) +
  geom_point()
 
 #Add more layers
 p + scale_colour_manual(values=c("blue", "gray", "red")) +
   labs(title="Gene Expression Changes Upon Drug Treatment",
        x="Control (no drug)",
        y="Drug Treatment",
        )

 
 
 # install.packages("gapminder")
 library(gapminder)
 

 # install.packages("dplyr")
 library(dplyr)
 
 gapminder_2007 <- gapminder %>% filter(year==2007)
 

 # Basic scatter plot of gapminder_2007
 ggplot(gapminder_2007) +
   aes(x=gdpPercap, y=lifeExp, color=continent, size=pop) +
   geom_point(alpha=0.5)
 
 

 # Basic bar chart of gapminder_top5
 gapminder_top5 <- gapminder %>%
   filter(year==2007) %>%
   arrange(desc(pop)) %>%
   top_n(5, pop)
 
 ggplot(gapminder_top5) +
   aes(x=reorder(country, -pop), y=pop, fill=gdpPercap) +
   geom_col()
 