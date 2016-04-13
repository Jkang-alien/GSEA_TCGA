########### data transform TCGA for GSEA

ID_P <- data_group[data_group$group == 'Preserved Xi',1]
index_P <- colnames(mir) %in% ID_P
ID_T <- data_group[data_group$group == 'Two copies of Xa',1]
index_T <- colnames(mir) %in% ID_T
GSEA <- data.frame(NAME = mir[,1], DESCRIPTION = rep('na', 18632), mir[,index_P], mir[,index_T])
cls <- c(rep(0,sum(index_P)), rep(1, sum(index_T)))

write.table(GSEA, file = '/home/jun/XIST/GSEA/data.txt', append = FALSE, 
            quote = FALSE, sep = '\t',
            row.names = FALSE,
            col.names = TRUE 
)

write(cls, file = '/home/jun/XIST/GSEA/cls.cls', append = FALSE, 
      #quote = FALSE, 
      sep = '\t',
      #row.names = FALSE,
      #col.names = TRUE, 
      ncolumns = length(cls)
)
