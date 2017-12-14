#' Updating Salesforce
#'
#' This function is used to update salesforce objects with the current result
#' @param access_token for salesforce credentials
#' @param  instance_url is salesforce url
#' @param myobject is object name
#' @param data is dataset value
#'
#' @import RForcecom
#' @import jsonlite
#' @import dplyr
#'
#' @export
#'


updater <- function(access_token, instance_url, myobject, data){

  instance_u <- paste0(instance_url,'/')
  api <- '36.0'
  session <- c(sessionID = access_token,instanceURL = instance_u, apiVersion = api)

  update_job <- rforcecom.createBulkJob(session,
                                        operation ='update', object = myobject) # Create a new bulkjob for updating Salesforce
  my_data <- data # Dataframe to be uploaded
  batches_info <- rforcecom.createBulkBatch(session,
                                            jobId = update_job$id, data = my_data) #Update job
  close_job_info <- rforcecom.closeBulkJob(session, jobId=update_job$id)

}
