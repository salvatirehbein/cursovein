net <- readRDS('network/net.rds')
PC_01 <- age_ldv(x = net$ldv, name = 'PC', k = 3/4)
saveRDS(PC_01, file = 'veh/PC_01.rds')
LCV_01 <- age_ldv(x = net$ldv, name = 'LCV', k = 1/4/2)
saveRDS(PC_01, file = 'veh/LCV_01.rds')
HGV_01 <- age_ldv(x = net$hdv, name = 'HGV', k = 3/4)
saveRDS(PC_01, file = 'veh/HGV_01.rds')
BUS_01 <- age_ldv(x = net$hdv, name = 'BUS', k = 1/4)
# BUS only for example  purposes
# BUS a traffic simulation only for BUS, or other source of information
saveRDS(BUS_01, file = 'veh/BUS_01.rds')
MC_01 <- age_ldv(x = net$ldv, name = 'MC', k = 1/4/2)
saveRDS(MC_01, file = 'veh/MC_01.rds')
 # Add more
