# require(hdrcde)
# data = sampleData(1:5, 100)
# x = data[,1]; y = data[,2]
# plot(cde(x,y))

sampleData = function(x,n)
{
  tmp = sapply(x, function(i) cbind(i, rnorm(n,mean = i)), simplify = FALSE)
  r = NULL
  
  for(i in 1:length(tmp)) r = rbind(r,tmp[[i]])
  r
}
  
  

