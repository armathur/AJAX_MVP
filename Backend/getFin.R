library(quantmod)
#TAL.f, SILC.f,
library(plyr)

#Load the LPL_werk Data
vector_russel_2k = c()




for(i in ls()){
  if(!is.na(get(i)[[1]]) && class(get(i))[1] == "xts" ){
    vector_russel_2k =  c(vector_russel_2k,i)
    rm(list=c(i))
  }
  else{
    if(i != "vector_russel_2k"){
      rm(list=c(i))
    }
    
  }
  
  
}

rm(i)
  

#Load the .f data

checkRow <- function(var_dataFrame){
  
  
  if(nrow(var_dataFrame) <5)
  {
    
    new.row <- data.frame("Dat" = "random", stringsAsFactors=F)
  
    var_dataFrame <- rbind.fill(var_dataFrame, new.row)
    print(ncol(var_dataFrame))
    var_dataFrame <- var_dataFrame[-which(colnames(var_dataFrame)=="Dat")]
    print(ncol(var_dataFrame))
    print(nrow(var_dataFrame))
    
    
  }
  
  
  
  
  if(nrow(var_dataFrame)<5){
    print("hello")
    var_dataFrame <- checkRow(var_dataFrame)
  }
  
  return(var_dataFrame)
}


df <- data.frame()
list_obj = ls()

for(i in vector_russel_2k){
  
    if(any(paste0(i,".f") == list_obj)){
      
      assign("temp",get(paste0(i,".f")))
      temp<-data.frame(t(viewFinancials(temp,type=c("BS"),"Q")))
      temp<-cbind(temp,"Date" = rownames(temp))
      temp<-checkRow(temp)
      rownames(temp)<-NULL
      assign("temp_2",get(paste0(i,".f")))
      temp_2<-data.frame(t(viewFinancials(temp_2,type=c("IS"),"Q")))
      rownames(temp_2)<-NULL
      temp_2<-checkRow(temp_2)
      temp_2 = cbind(temp,temp_2)
      assign("temp_3",get(paste0(i,".f")))
      temp_3<-data.frame(t(viewFinancials(temp_3,type=c("CF"),"Q")))
      rownames(temp_3)<-NULL
      temp_3<-checkRow(temp_3)
      
      temp_3 = cbind(temp_2,temp_3)
      temp_3 = cbind("Ticker"=rep(i,nrow(temp_3)),temp_3)
      print("hey")
      df<- rbind(df,temp_3)
      print("done")
    }
  else{
    next
  }
      
      
      
}













checkRow_a <- function(var_dataFrame){
  
  
  if(nrow(var_dataFrame) <4)
  {
    
    new.row <- data.frame("Dat" = "random", stringsAsFactors=F)
    
    var_dataFrame <- rbind.fill(var_dataFrame, new.row)
    print(ncol(var_dataFrame))
    var_dataFrame <- var_dataFrame[-which(colnames(var_dataFrame)=="Dat")]
    print(ncol(var_dataFrame))
    print(nrow(var_dataFrame))
    
    
  }
  
  
  
  
  if(nrow(var_dataFrame)<4){
    print("hello")
    var_dataFrame <- checkRow(var_dataFrame)
  }
  
  return(var_dataFrame)
}



df_a <- data.frame()
list_obj = ls()

for(i in vector_russel_2k){
  
  if(any(paste0(i,".f") == list_obj)){
    
    assign("temp",get(paste0(i,".f")))
    temp<-data.frame(t(viewFinancials(temp,type=c("BS"),"A")))
    temp<-cbind(temp,"Date" = rownames(temp))
    temp<-checkRow_a(temp)
    rownames(temp)<-NULL
    assign("temp_2",get(paste0(i,".f")))
    temp_2<-data.frame(t(viewFinancials(temp_2,type=c("IS"),"A")))
    rownames(temp_2)<-NULL
    temp_2<-checkRow_a(temp_2)
    temp_2 = cbind(temp,temp_2)
    assign("temp_3",get(paste0(i,".f")))
    temp_3<-data.frame(t(viewFinancials(temp_3,type=c("CF"),"A")))
    rownames(temp_3)<-NULL
    temp_3<-checkRow_a(temp_3)
    
    temp_3 = cbind(temp_2,temp_3)
    temp_3 = cbind("Ticker"=rep(i,nrow(temp_3)),temp_3)
    print("hey")
    df_a<- rbind(df_a,temp_3)
    print("done")
  }
  else{
    next
  }
  
  
  
}

