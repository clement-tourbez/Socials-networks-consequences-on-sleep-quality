#Data importation
SciViews::R

library("lubridate")
library("magrittr")


(sleep <- read_csv("https://docs.google.com/spreadsheets/d/15bi2eKujJLabLjSyodTHFJKFzx1dk-GtS9fnImSb1-Y/export?format=csv", locale = locale(decimal_mark = ",")))


#head(sleep)



sleep %>.%
    filter(., ! is.na(age), ! is.na(bed_time)) -> sleep

sleep$sex <- as.factor(sleep$sex)


visdat::vis_dat(sleep)

write$rds(sleep, file = "DATA/sleep.rds", compress = "gz")

sleep  <- read("DATA/sleep.rds")
