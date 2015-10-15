

# plot5.R

# Read data files

NEI <- readRDS("./summarySCC_PM25.rds")

SCC <- readRDS("./Source_Classification_Code.rds")


# Select vehicles emmission data subset 
# identify emmission source 
vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)

vSCC <- SCC[vehicle,]$SCC

# create dataset

vNEI <- NEI[NEI$SCC %in% vSCC,]

# Separate Baltimore, MD protion

BTMvNEI <- vNEI[vNEI$fips=="24510",]

BTMvNEI$county <- "Baltimore"

# Separate Los Angeles, CA protion

LAXvNEI <- vNEI[vNEI$fips=="06037",]

LAXvNEI$county <- "Los Angeles"


BTM_LAV_vNEI <- rbind(BTMvNEI,LAXvNEI)


# plot

library(ggplot2)

png('plot6.png')

ggplot(BTM_LAV_vNEI,aes(x=factor(year),y=Emissions, fill=county)) +
	geom_bar(stat="identity",width=0.5) +
	facet_grid(county  ~ ., scales="free") +
	xlab("year") +
	ylab(expression("total PM"[2.5]*" emissions")) +
	ggtitle(expression("Motor vehicle PM"[2.5]* paste("emissions in Baltimore and Los Angeles", sep="")))

dev.off()
