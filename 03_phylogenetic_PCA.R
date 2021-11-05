##### Phylogenetic PCA #####

# example
## load data from Mahler et al. (2010)
data(anoletree)
data(anole.data)
class(anole.data)
## run phylogenetic PCA
anole.pca<-phyl.pca(anoletree,anole.data)
print(anole.pca)
## plot results
plot(anole.pca)
biplot(anole.pca)

##### Make Fake Data #####
# read in data
phylo = readr::read_rds("objects/fire_herbs_phylo.rds")
tips = phylo[["tip.label"]]
num = length(tips)

# make fake data
set.seed(1)
SRL = runif(num)
RD = runif(num, max = 2)
RHF = runif(num, max = 5)
RBD = runif(num, max = 4)
RCC = runif(num, max = 10)
RNC = runif(num, max = 10)
fake_data = data.frame(SRL, RD, RHF, RBD,
                       RCC, RNC, row.names = tips)
ppca = phyl.pca(phylo, fake_data)
biplot(ppca)
