# GoodmanKruskal 0.0.3 (2020-03-11)

* set stringsAsFactors = FALSE in the data frame returned by the function GKtau to be compatible with upcoming change in data frame default for this argument
* applied as.character() to GKtau arguments x and y so that missing levels of a factor no longer cause GKtau to return NaN
* applied as.data.frame() to GKtauDataframe so that it works correctly with data tables
