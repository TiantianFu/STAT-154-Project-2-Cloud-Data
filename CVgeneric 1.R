CVgeneric <- function(classifier,tr_feature,tr_label,K,loss){
  folds = createFolds(tr_label,K)
  loss_rate = c()
  modelList = list()
  dat = cbind(tr_feature,tr_label)
  
  for (i in 1:length(folds)){
    # val_set = dat[folds[[i]],]
    # train_set = dat[-folds[[i]],]
    # y_true = val_set$tr_label
    
    val_set = tr_feature[folds[[i]], ]
    training_set = tr_feature[-folds[[i]], ]
    y_lab = tr_label[-folds[[i]]]
    y_true <- tr_label[folds[[i]]]
    
    currFormula <- as.formula(paste("tr_label","~",paste(colnames(tr_feature), collapse = "+"), sep = ""))
    func = get(classifier)
    
    if (classifier %in% c("lda","qda")){
      modelList <- func(currFormula,data = dat)
      y_hat = predict(modelList,newdata = val_set)$class
      
    }
    else if(classifier == "glm"){
      modelList <- glm(currFormula,data = dat,family=binomial)
      
      y_hat = predict(modelList,newdata = val_set, type='response')
      y_hat = ifelse(y_hat > 0.5,1,-1)
    }
    
    else if (classifier == "knn"){
      #modelList <- func(currFormula,data = training_set,kernel =
      #"linear")
      y_hat <- knn(training_set, val_set, y_lab, k=350, prob= TRUE)
    }
    else if (classifier == "randomForest"){
      modelList = randomForest(currFormula, data = dat,ntree = 500, importance = TRUE)
      y_hat <- predict(modelList, newdata = val_set)
    }
    loss_rate[i] = loss(y_hat,y_true)
  }
  
  return ((loss_rate))
}