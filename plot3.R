
# plot3.R

# Read data files

NEI <- readRDS("./summarySCC_PM25.rds")

SCC <- readRDS("./Source_Classification_Code.rds")


# Separate Baltimore City, MD emissions from PM2.5 decreased by year from 1999 to 2008

BTMEmmision<- NEI[NEI$fips=="24510",]


# Aggregate Baltimore City, MD total emissions from PM2.5 decreased by year and by type

BTMaggTotal <- aggregate(Emissions ~ year + type, BTMEmmision, sum)

# plot

library(ggplot2)

png("plot3.png",width=800,height=800,units="px",bg="transparent")

ggplot(BTMaggTotal, aes(x=factor(year), y=Emissions, fill=type)) +
	geom_bar(stat="identity", width=0.5) +
	facet_grid(. ~ type) +
	xlab("year") +
	ylab(expression("total PM"[2.5]*" emission")) +
	ggtitle(expression("PM"[2.5]*paste("Emissions in Baltimore, MD by source types", sep="")))

dev.off()