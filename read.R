# library(tidyverse)

get_planet_data <- function(keep_file_copy = FALSE) {
  
  url <- "http://exoplanets.org/csv-files/exoplanets.csv"
  dest_file <- "exoplanets.csv"
  download.file(url = url,
                destfile = dest_file)
  
  output_df <- read_csv(dest_file)
  
  if (!keep_file_copy) {
    file.create(dest_file)
  }
  
  return(output_df)
}