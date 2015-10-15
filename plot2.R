# plot2.R

# Read data files

NEI <- readRDS("./summarySCC_PM25.rds")

SCC <- readRDS("./Source_Classification_Code.rds")


# Separate Baltimore, MD emissions from PM2.5 decreased by year from 1999 to 2008

BTMEmmision<- NEI[NEI$fips=="24510",]


# Aggregate Baltimore City, MD total emissions from PM2.5 decreased by year from 1999 to 2008

BTMaggTotal <- aggregate(Emissions ~ year, BTMEmmision, sum)


# plot

png('plot2.png')

barplot(height=BTMaggTotal$Emissions,
	names.arg=BTMaggTotal$year, col="red",
	xlab="years", 
	ylab=expression('total PM'[2.5]*' emission'),
	main=expression('Total PM'[2.5]*' emissions in Baltimore,MD'))

dev.off()