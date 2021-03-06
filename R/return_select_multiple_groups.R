#'
#' RETURN LIST OF DATA FRAMES FOR EACH SELECT MULTIPLE
#' The data frame will be split and grouped by each select multiple question
#' @param data the data set
#' @param questionnaire the questionnaire object generated by koboquest
#' @return list of data frames. Each dataframe contain a select mutliple question with all options
#' @export
#'
#'
return_select_multiple_groups<-function(data, questionnaire){
  which_are_select_multiple<-which(
    sapply(names(data), questionnaire$question_is_select_multiple)
  )
  if(length(which_are_select_multiple)!=0){
    select_multiple_data<-data[,which_are_select_multiple]
  }
  select_multiple_group_list<-list()
  for ( i in 1:ncol(select_multiple_data)){
    concat_column_name<-colnames(select_multiple_data)[i]
    select_multiple_group_suffix<-paste0(concat_column_name, ".")
    select_multiple_group_list[[concat_column_name]]<-data %>% select(starts_with(select_multiple_group_suffix))
  }
  select_multiple_group_list
}
