##### Phylogeny #####
library(devtools)
library(V.PhyloMaker)

# example
### make the example file
c1 <- c("Carya floridana", "Carya pallida", "Epiprinus siletianus", "Platycarya strobilacea", "Tilia amurensis", "Apodanthes caseariae", "Pilostyles blanchetii")
c2 <- c("Carya", "Carya", "Epiprinus", "Platycarya", "Tilia", "Apodanthes", "Pilostyles")
c3 <- c("Juglandaceae", "Juglandaceae", "Euphorbiaceae", "Juglandaceae", "Malvaceae", "Apodanthaceae", "Apodanthaceae")
example <- data.frame(species = c1, genus = c2, family = c3)

### run the function
result <- phylo.maker(example, scenarios=c("S1","S2","S3"))

### plot the phylogenies with node ages displayed.
library(ape)
par(mfrow = c(1, 1))
plot.phylo(result$scenario.1, cex = 1.5, main = "scenario.1")
nodelabels(round(branching.times(result$scenario.1), 1), cex = 1)
plot.phylo(result$scenario.2[[1]], cex = 1.5, main = "scenario.2")
nodelabels(round(branching.times(result$scenario.2[[1]]), 1), cex = 1)
plot.phylo(result$scenario.3, cex = 1.5, main = "scenario.3")
nodelabels(round(branching.times(result$scenario.3), 1), cex = 1)

### our data
fire_herbs = read.csv(file = "objects/fire_herbs.csv")
library(stringr)

fire_herbs$Genus <- stringr::word(fire_herbs$TaxonName, 1)

# make a new dataframe
phylo = data.frame(species = fire_herbs$TaxonName, 
                   genus = fire_herbs$Genus, 
                   family =fire_herbs$Family)
phylo_out <- phylo.maker(phylo, scenarios=c("S1","S2","S3"))
par(mfrow = c(1, 1))
plot.phylo(phylo_out$scenario.1, cex = 1.5, main = "scenario.1")
nodelabels(round(branching.times(phylo_out$scenario.1), 1), cex = 1)
scen1 = phylo_out[[1]]
plotTree(scen1,ftype="i",fsize=0.6,lwd=1)

write_rds(scen1, "objects/fire_herbs_phylo.rds")
