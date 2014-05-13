createGrid = function(x,y,nx,ny)
{
  xg = seq(min(x), max(x), length.out = nx)  
  yg = seq(min(y), max(y), length.out = ny)  
  
  r = NULL
  tmp = sapply(xg, function(i) cbind(i,yg), simplify = FALSE)
  for(i in 1:length(tmp)) r = rbind(r,tmp[[i]])
  r
}

createGrid2 = function(xg, yg)
{
  r = NULL
  tmp = sapply(xg, function(i) cbind(i,yg), simplify = FALSE)
  for(i in 1:length(tmp)) r = rbind(r,tmp[[i]])
  r
}



