##### Selecting Which Species to Sample #####
source("header.R")

# load species list and per site species list
poales = readr::read_rds("objects/poales.rds")
site_species = readr::read_rds("objects/site_species.rds")

# create column with first two words (genus + species)
poales$spec_genus = word(poales$TaxonName, 1,2, sep = " ")

intersect = intersect(poales$spec_genus, site_species$GenusSpecies)
intersect

length(which(site_species$GenusSpecies == intersect[1]))
length(which(site_species$GenusSpecies == intersect[2]))
length(which(site_species$GenusSpecies == intersect[3]))
length(which(site_species$GenusSpecies == intersect[4]))
length(which(site_species$GenusSpecies == intersect[5]))
length(which(site_species$GenusSpecies == intersect[6]))
length(which(site_species$GenusSpecies == intersect[7]))
length(which(site_species$GenusSpecies == intersect[8]))
length(which(site_species$GenusSpecies == intersect[9]))
length(which(site_species$GenusSpecies == intersect[10]))

# make a phylogeny

out = classification(intersect, db='itis')
tr = class2tree(out)
plot(tr)

# save intersect
write_csv(as.data.frame(intersect), file = "objects/intersect.csv")


##### All overlapping species #####
fire_plants = readr::read_csv("raw-data/Fire_plants_results_edited.csv")

herbaceous = fire_plants |>
  dplyr::filter(Lifeform == "Herbaceous" & 
                  Group != "Moss")

herb_species = unique(herbaceous$TaxonName)
herb_species

# make a phylogeny

out = classification(herb_species, db='itis')
tr = class2tree(out)
class(tr)
plot(tr)
phylo = tr[[1]]
class(phylo)
plotTree(phylo,ftype="i",fsize=0.6,lwd=1)

# make a dataset with family and species
herbs = herbaceous |>
  dplyr::select(TaxonName, Family, Lifeform, Longevity, Group) |>
  dplyr::distinct()

# write to a csv
write_csv(herbs, file = "objects/fire_herbs.csv")
