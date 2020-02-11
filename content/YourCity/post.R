# streets ####
CO <- emis_merge('CO', net = net)
saveRDS(CO, 'post/streets/CO.rds')

# grids ####
gCO <- emis_grid(CO, g)
print(plot(gCO['V1'], axes = TRUE)) # only an example

saveRDS(gCO, 'post/grids/gCO.rds')

# df ####
dfCO <- emis_merge('CO', what = 'DF.rds', FALSE)
saveRDS(dfCO, 'post/df/dfCO.rds')
aggregate(dfCO$g, by = list(dfCO$veh), sum, na.rm = TRUE) # Only an example

 # Add more
