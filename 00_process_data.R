##### Process Data #####
source("header.R")

poaceae = readr::read_csv("raw-data/PoaceaeR.csv")

cyperaceae = readr::read_csv("raw-data/CyperaceaeR.csv")

poales = rbind(poaceae, cyperaceae)

site_species = readr::read_csv("raw-data/herbspplistR.csv")

readr::write_rds(poales, "objects/poales.rds")
readr::write_rds(site_species, "objects/site_species.rds")
