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

#BTMvNEITotal <- aggregate(Emissions ~ year, BTMvNEI,sum)


# plot

library(ggplot2)

png('plot5.png')

ggplot(BTMvNEI,aes(factor(year),Emissions)) +
	geom_bar(stat="identity",fill="red",width=0.5) +
	xlab("year") +
	ylab(expression("total PM"[2.5]*" emissions")) +
	ggtitle(expression("PM"[2.5]* paste(" emissions from motor vehicle sources in Baltimore,MD", sep="")))

dev.off()



