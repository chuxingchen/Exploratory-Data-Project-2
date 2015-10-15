
# plot4.R

# Read data files

NEI <- readRDS("./summarySCC_PM25.rds")

SCC <- readRDS("./Source_Classification_Code.rds")

# Identifycoal combustion coal emmision sources

combCoal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)

combCoalEmmi <- SCC[combCoal,]

# Select emmissions from combustion coal emmission sources to create a new dataset

emissions <- NEI[(NEI$SCC %in% combCoalEmmi$SCC), ]

# Aggregate emmission by year from the selected dataset

emmissionYear <- aggregate(Emissions ~ year, emissions, sum)

# plot

library(ggplot2)

png("plot4.png")

ggplot(emmissionYear, aes(x=factor(year), y=Emissions)) +
    geom_bar(stat="identity", fill="red",width=0.5) +
    xlab("year") +
    ylab(expression("total PM"[2.5]*" emis sions")) +
    ggtitle(expression("Total PM"[2.5]* paste(" emissions from coal combustion sources", sep="")))

dev.off()
