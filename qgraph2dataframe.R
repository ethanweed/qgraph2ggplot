

qgraph2dataframes <- function(p, scale_nodes, scale_edges){

  # make dataframe with node data
  df_nodes <- as.data.frame(p$layout)
  df_nodes$groups <- p$Arguments$groups
  df_nodes$labels <- p$Arguments$labels
  
  if(missing(scale_nodes))
    {df_nodes$size <- p$graphAttributes$Nodes$width
    }
  if(!missing(scale_nodes))
    {df_nodes$size <- rescale(p$graphAttributes$Nodes$width, to = scale_nodes)
    }  
  
  df_nodes$color <- p$graphAttributes$Nodes$color
  
  # make dataframe with edge data
  df_edges <- data.frame(p$Edgelist)
  df_edges$from.x <- df_nodes$V1[match(df_edges$from, rownames(df_nodes))]
  df_edges$from.y <- df_nodes$V2[match(df_edges$from, rownames(df_nodes))]
  df_edges$to.x <- df_nodes$V1[match(df_edges$to, rownames(df_nodes))]
  df_edges$to.y <- df_nodes$V2[match(df_edges$to, rownames(df_nodes))]
  df_edges$weight <- p$Edgelist$weight
  df_edges$color <- as.factor(ifelse(df_edges$weight >= 0, 1, 0))
  
  if(missing(scale_edges)){
    df_edges$width <- p$graphAttributes$Edges$width
  }
  
  if(!missing(scale_edges)){
    df_edges$width <- rescale(p$graphAttributes$Edges$width, to = scale_edges)
  }
  
  network_data <- list(nodes = df_nodes, edges = df_edges)
  return(network_data)
}

