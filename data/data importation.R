#Data importation


SciViews::R
(sleep <- read$csv("https://docs.google.com/spreadsheets/d/15bi2eKujJLabLjSyodTHFJKFzx1dk-GtS9fnImSb1-Y/export?format=csv", locale = locale(decimal_mark = ",")))









sleep %>.%
    filter(., ! is.na(age), ! is.na(bed_time)) -> sleep

sleep$sex <- as.factor(sleep$sex)


visdat::vis_dat(sleep)

write$rds(sleep, file = "./data/sleep", compress = "gz")

sleep  <- read("../data/sleep.rds")
