library(lipidr)
library(ggplot2)

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")
source("RIO.R")

input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
    pfix = prefix()
  if (length(pfix) != 0) {
     pfix <<- paste(pfix, "/", sep="")
  }

}

run <- function() {}

output <- function(outputfile) {
	pdf(outputfile)
	d_qc <- readRDS(paste(pfix, parameters["data", 2], sep="/"))
	measure <- parameters["measure", 2]
	plot_molecules(d_qc, "sd", measure = measure, log = FALSE)
	write.csv(d_qc$rowData, paste(outputfile, "csv", sep="."))
}

