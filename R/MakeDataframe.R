#' Prepare a dataframe for the GKtauDataframe function
#'
#' This function prepares a dataframe for the GKtauDataframe
#' function, in four ways: (1), selecting a subset of variables
#' to retain for analysis; (2), extracting a subset of records;
#' (3), grouping numeric variables via the GroupNumeric function;
#' and (4), regrouping categorical variables via the function
#' RegroupCategorical.
#'
#' This is a helper function to simplify the task of creating
#' dataframes for analysis using the GKtauDataframe function,
#' particularly when these results are to be plotted using the
#' plot.GKtauMatrix method.  The sequence of operations is this:
#' first, variables are selected according to keepVars and
#' records are retained as determined by recordSubset (if
#' this value is NULL, the default, all records are retained);
#' then, the function GroupNumericDataframe is applied using
#' the parameters specified by groupNumericList (if not NULL)
#' to create a dataframe with the specified numeric variables
#' grouped as factors; finally, the RegroupCategoricalDataframe
#' function is called to regroup categorical variables in this
#' modified dataframe using the parameters specfied by
#' regroupCategoricalList (if not NULL).
#'
#' @param df Original dataframe from which new dataframe will
#' be created.
#' @param keepVars Character vector with names of variables from
#' df to be used in constructing the new dataframe.
#' @param recordSubset Integer vector of record indices to be
#' retained in constructing the new dataframe; if NULL (the
#' default), retain all records from df.
#' @param groupNumericList List of parameters to be passed to
#' the GroupNumericDataframe function.
#' @param regroupCategoricalList List of parameters to be
#' passed to the RegroupCategoricalDataframe function.
#' @return Modified dataframe, constructed from the variables
#' specified in keepVars from df, the records specified by
#' recordSubset, and any data conversions specified by
#' groupNumericList and/or regroupCategoricalList.
#'
#' @author Ron Pearson
#' @export
#'
MakeDataframe <- function(df, keepVars, recordSubset = NULL,
                          groupNumericList = NULL,
                          regroupCategoricalList = NULL){
  #
  allVars <- colnames(df)
  badVars <- setdiff(keepVars, allVars)
  if (length(badVars) > 0){
    errorMsg <- paste("Variable(s)", badVars,
                      "not present in original dataframe")
    stop(errorMsg)
  }
  keepIndex <- which(allVars %in% keepVars)
  if (is.null(recordSubset)){
    dfSub <- df[, keepIndex]
  } else {
    dfSub <- df[recordSubset, keepIndex]
  }
  #
  if (!is.null(groupNumericList)){
    dfSub <- GroupNumericDataframe(dfSub, groupNumericList)
  }
  if (!is.null(regroupCategoricalList)){
    dfSub <- RegroupCategoricalDataframe(dfSub,
                        regroupCategoricalList)
  }
  #
  return(dfSub)
}
