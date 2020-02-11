# Network 
net <- readRDS('network/net.rds')
lkm <- net$lkm
# speed <- readRDS('network/speed.rds')

# Vehicles
veh <- readRDS('veh/HGV_01.rds') 
# Profiles
data(profiles)
pc <- profiles[[1]]
# pc <- read.csv('profiles/pc.csv') #Change with your data
# Emission Factors data-set
data(fe2015)
efe <- fe2015
# efe <- read.csv('ef/fe2015.csv')
efeco <- 'PC_G' # Character to identify the column of the respective EF
efero <- ifelse(is.data.frame(veh), ncol(veh), ncol(veh[[1]]))
# efero reads the number of the vehicle distribution
trips_per_day <- 5

# Mileage, Check name of categories with names(fkm)
# data(fkm)
# pckm <- fkm[['KM_PC_E25']](1:efero)
# pckm <- cumsum(pckm)

# Sulphur
# sulphur <- 50 # ppm


# Input and Output

directory <- "HGV_01"
vfuel <- 'E_25' 
vsize <- '' # It can be small/big/<=1400, one word
vname <-  "HGV_01" 


# CO 
pol <- 'CO' 
print(pol)
message('This is just an example!
 You need to update this to your project!')
x <- efe[efe$Pollutant == pol, 'PC_G']
lefe <- EmissionFactorsList(x)
array_x <- emis(veh = veh, lkm = lkm, ef = lefe, profile = pc,
          speed = Speed(34))
x_DF <- emis_post(arra = array_x, veh = vname, size = vsize,
                  fuel = vfuel, pollutant = pol, by = 'veh')
x_STREETS <- emis_post(arra = array_x, pollutant = pol,
                       by = 'streets_wide') 
saveRDS(x_DF, file = paste0('emi/', "HGV_01" ,'_', pol, '_DF.rds'))
saveRDS(x_STREETS, file = paste0('emi/', "HGV_01" ,'_', pol, '_STREETS.rds'))
rm(array_x, x_DF, x_STREETS, pol, lefe)

# Other Pollutants...