
library(quantmod)

#Load the LPL_werk Data
vector_russel_2k = c()


for(i in ls()){
  if(!is.na(get(i)[[1]]) && class(get(i))[1] == "xts" ){
    # assign("temp",get(i))
    # temp <- data.frame(temp)
    # temp<-cbind(temp,"Date" = rownames(temp))
    # temp <- temp[c(6,4)]
    # rownames(temp) <- NULL
    # assign(i, temp)
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


df <- data.frame()
list_obj = ls()

for(i in vector_russel_2k){
  
    if(any(paste0(i,".f") == list_obj)){
      
      assign("temp",get(paste0(i,".f")))
      temp<-data.frame(t(viewFinancials(temp,type=c("BS"),"Q")))
      temp<-cbind(temp,"Date" = rownames(temp))
      rownames(temp)<-NULL
      assign("temp_2",get(paste0(i,".f")))
      temp_2<-data.frame(t(viewFinancials(temp_2,type=c("IS"),"Q")))
      rownames(temp_2)<-NULL
      temp_2 = cbind(temp,temp_2)
      assign("temp_3",get(paste0(i,".f")))
      temp_3<-data.frame(t(viewFinancials(temp_3,type=c("CF"),"Q")))
      rownames(temp_3)<-NULL
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


