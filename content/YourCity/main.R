prev <- getwd()
#Changing working directory
print(setwd('YourCity'))
library(vein)
sessionInfo()

# 0 Delete previous emissions? ####
# borrar <- list.files('emi',
#                      pattern = '.rds', recursive = TRUE,
#                      full.names = TRUE)

# 1) Network ####
# Edit your net information and save net.rds it in network directory
# Your net must contain traffic per street at morning rush hour
# Below an example using the data in VEIN
data(net)
net <- sf::st_as_sf(net)
net <- sf::st_transform(net, 31983)
saveRDS(net, 'network/net.rds')

## Are you going to need Speed?
data(pc_profile)
pc_week <- temp_fact(net$ldv+net$hdv, pc_profile)
speed <- netspeed(pc_week, net$ps, net$ffs, net$capacity, net$lkm, alpha = 1)
saveRDS(speed, 'network/speed.rds')

# 2) Traffic ####
# Edit your file traffic.R

source('traffic.R') # Edit traffic.R

# 3) Estimation #### 
# Edit each input.R
# You must have all the information required in each input.R
inputs <- list.files(path = 'est', pattern = 'input.R',
                     recursive = TRUE, full.names = TRUE)
for (i in 1:length(inputs)){
  print(inputs[i])
  source(inputs[i])
}
# 4) Post-estimation #### 
g <- make_grid(net, 1000)
source('post.R')
#Changing to original working directory
print(setwd(prev))
