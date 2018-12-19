#Data importation
SciViews::R

library("lubridate")
library("magrittr")


(sleep <- read_csv("https://docs.google.com/spreadsheets/d/15bi2eKujJLabLjSyodTHFJKFzx1dk-GtS9fnImSb1-Y/export?format=csv", locale = locale(decimal_mark = ",")))


head(sleep)



sleep %>.%
    filter(., ! is.na(age), ! is.na(bed_time)) -> sleep

sleep$sex <- as.factor(sleep$sex)


## Cutting sleep$age into sleep$age_rec
sleep$age_rec <- cut(sleep$age, include.lowest=TRUE,  right=TRUE,
                     breaks=c(0, 30, 110))

## Cutting sleep$video_game_time into sleep$video_game_time_rec
sleep$vg_rec <- cut(sleep$video_game_time, include.lowest=TRUE,  right=TRUE,
                                 breaks=c(0, 1, 2, 5, 20))

## Cutting sleep$facebook_and_messenger_time into sleep$facebook_and_messenger_time_rec
sleep$fb_rec <- cut(sleep$facebook_and_messenger_time, include.lowest=TRUE,  right=TRUE,
                                             breaks=c(0, 1, 2, 5))
## Cutting sleep$other_social_network_time into sleep$other_rec
sleep$other_rec <- cut(sleep$other_social_network_time, include.lowest=TRUE,  right=TRUE,
                       breaks=c(0, 1, 2, 5))




visdat::vis_dat(sleep)

write$rds(sleep, file = "DATA/sleep.rds", compress = "gz")

sleep  <- read("DATA/sleep.rds")
