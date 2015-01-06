#This R script is to show how to query a database and work in R and github
# Wahida H. Ali
# 2015-01-06

#install and load a new package
install.packages("RSQLite", dependencies=T)
library(RSQLite)

#locate the database files (portal_mammals.sql, dragged and dropped)

#starting commands?
driver <- dbDriver("SQLite")
con<-dbConnect(driver, dbname="portal_mammals.sqlite")

#results file of SQL query
results<-dbGetQuery(con, "SELECT species, wgt, year
                    FROM surveys")

#disconnect from database
dbDisconnect(con)

#plotting results of year and weight
plot(results$year, results$wgt)