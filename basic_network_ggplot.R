

basic_network_ggplot <- function(df){
  library(ggplot2)
  ggplot() +
    geom_segment(data = df$edges, 
                 aes(x=from.x, 
                     xend = to.x, 
                     y=from.y, 
                     yend = to.y, 
                     color = color)) +
    geom_point(data = df$nodes,aes(x=V1,y=V2),
               size = df$nodes$size + 0.8, 
               colour = "black") +
    geom_point(data = df$nodes, 
               aes(x=V1, 
                   y=V2,
                   color = groups), 
               size = df$nodes$size) +
    geom_text(data = df$nodes,aes(x = V1,y = V2, 
                                  label = labels),
              size = df$nodes$size * .25) +
    theme_void()
  
}