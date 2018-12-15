#Data importation


SciViews::R
(sleep <- read$csv("https://docs.google.com/spreadsheets/d/15bi2eKujJLabLjSyodTHFJKFzx1dk-GtS9fnImSb1-Y/export?format=csv", locale = locale(decimal_mark = ",")))

write$rds(sleep, file = "./data/sleep", compress = "gz")

sleep  <- read("./data/sleep.rds")

