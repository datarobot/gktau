## Resubmission
This is a resubmission.  In this version I have:

* set stringsAsFactors = FALSE in the data frame returned by the function GKtau to be compatible with upcoming change in data frame default for this argument
* applied as.character() to GKtau arguments x and y so that missing levels of a factor no longer cause GKtau to return NaN
* applied as.data.frame() to GKtauDataframe so that it works correctly with data tables
* Updated the version from 0.0.2 to 0.0.3

## Test environments
local Windows 10 install
win-builder (devel and release)

## R CMD check results
There were no ERRORs, WARNINGs, or NOTEs.

## Downstream dependencies
The only downstream dependency is ITNr, which fails probably as a result of the second change noted above.  I have notified the maintainer of the ITNr package, identifying the part of the code where the failure appears to be occurring.

