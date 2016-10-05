library(ggplot2)
library(dplyr)
surveys <- read.csv("data/portal_data_joined.csv")
surveys_complete <- surveys %>%
  filter(species_id != "", !is.na(weight)) %>%
  filter(!is.na(hindfoot_length), sex != "")
# count records per species
species_counts <- surveys_complete %>%
  group_by(species_id) %>%
  tally

head(species_counts)

# get names of the species with counts >= 10
frequent_species <-  species_counts %>%
  filter(n >= 10) %>%
  select(species_id)

# filter out the less-frequent species
surveys_complete <- surveys_complete %>%
  filter(species_id %in% frequent_species$species_id)

surveys_plot <- ggplot(surveys_complete, 
                       aes(x = weight, 
                           y = hindfoot_length))

## http://docs.ggplot2.org/current/scale_brewer.html
RColorBrewer::brewer.pal.info
surveys_plot + 
  geom_point(alpha = 1, shape = 1, aes(color=genus)) +
  scale_color_brewer(type="qualitative", palette = "Paired") +
  scale_x_sqrt()
?scale_continuous

# Challenge: Use dplyr to calculate the mean weight and hindfoot_length 
# as well as the sample size for each species.
# Make a scatterplot of mean hindfoot_length vs mean weight,
# with the sizes of the points corresponding to the sample size.
survey_sum <- surveys_complete %>%
  group_by(species_id) %>%
  summarize(weight = mean(weight),
            hindfoot_length = mean(hindfoot_length),
            count = n())
ggplot(survey_sum, aes(weight, hindfoot_length, size = count)) +
  geom_point(shape = 1)

## If you don't want to create surveys_sum object.
ggplot(surveys_complete %>%
         group_by(species_id) %>%
         summarize(weight = mean(weight),
                   hindfoot_length = mean(hindfoot_length),
                   count = n()),
       aes(weight,
           hindfoot_length,
           size = count)) +
  geom_point(alpha = 0.7)



## Challenge: Calculate counts grouped by year, species_id, and sex
## make the faceted plot splitting further by sex (within each panel)
## color by sex rather than species
yearly_counts <- surveys_complete %>% 
  group_by(year, species_id, sex) %>% 
  tally
ggplot(yearly_counts, 
       aes(x = year, y = n, group = sex, colour = sex)) +
  geom_line() +
  facet_wrap(~ species_id)

## Drop legend.
ggplot(yearly_counts, 
       aes(x = year, y = n, group = sex, colour = sex)) +
  geom_line() +
  facet_wrap(~ species_id) +
  theme(legend.position = "none")
