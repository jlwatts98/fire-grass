##### Process Data #####
source("header.R")

poaceae = readr::read_csv("raw-data/PoaceaeR.csv")

cyperaceae = readr::read_csv("raw-data/CyperaceaeR.csv")

poales = rbind(poaceae, cyperaceae)

site_species = readr::read_csv("raw-data/herbspplistR.csv")

site_species2 = readr::read_csv("raw-data/totalherbfamilylist.csv") |>
  rename(
    number = X1,
    family = V1,
    species = V2
  )
site_species2 = site_species2[!grepl("NA", site_species2$species),]

readr::write_rds(poales, "objects/poales.rds")
readr::write_rds(site_species, "objects/site_species.rds")
readr::write_csv(site_species2, "objects/all_species.csv")
