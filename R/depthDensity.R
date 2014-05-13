# require(np)
# require(charmeSim)
# 
# ### Generowanie danych
# data = sampleData(1:5, 100)
# x = data[,1]; y = data[,2]
# plot(x,y)
# 
# nx = 5
# ny = 32

depthDensity = function(x, y, nx = 5, ny = 32, xg = NULL, yg = NULL)
{
  if(is.null(xg)) xy_grid = createGrid(x,y,nx,ny)
  if(!is.null(xg)) xy_grid = createGrid2(xg, yg)
  xy = cbind(x,y)
  
  dens_raw = npudens(xy, edat = xy_grid)$dens
  dens_x   = npudens(x, edat = xy_grid[,1])$dens
  
  dens = dens_raw/dens_x
  
  
  d_xy = depthLocal(xy_grid, xy, depth1 = "LP") # glebia xy
  d_x  = depthLocal(xy_grid[,1,drop = FALSE], xy[,1,drop = FALSE], depth1 = "LP") # glebia xy
  
  dep_scale = d_xy/d_x
  
  xg = unique(xy_grid[,1])
  yg = unique(xy_grid[,2])
  
  
  dens_mat  = matrix(dens, ncol = length(xg))
  dep_scale_mat = matrix(dep_scale, ncol = length(xg))
  
  
  result = list(dep_scale = dep_scale_mat, density_raw = dens_mat, density = dens_mat/ dep_scale_mat, xg = xg, yg = yg)

result
}
## plot((xy_grid[1:32,2]),(dr[1:32]))
