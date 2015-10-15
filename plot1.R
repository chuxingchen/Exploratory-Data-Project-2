# plot1.R

# Read data files

NEI <- readRDS("./summarySCC_PM25.rds")

SCC <- readRDS("./Source_Classification_Code.rds")

# Aggregate the US total emissions from PM2.5 decreased by year from 1999 to 2008

aggTotal<- aggregate(Emissions ~ year, NEI, sum)


# plot

png('plot1.png')

barplot(height=aggTotal$Emissions, 
	names.arg=aggTotal$year, col="red",
	main=expression('Total PM'[2.5]*' emissions 1999 - 2008'),
	xlab="years", 
	ylab=expression('total PM'[2.5]*' emission'))


dev.off()



