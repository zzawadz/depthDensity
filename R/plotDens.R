plotDens = function(den, type = "depth", ...)
{
  if(type == "raw") density = den$density_raw
  if(type == "depth") density = den$density
  mden = max(density)*1.05
  xg = den$xg
  yg = den$yg
  rn = max(diff(xg))
  density = density/max(mden) * rn
  xlim = range(xg); xlim[2] = xlim[2]+rn
  plot(xlim, range(yg), type = "n",...)
  for(i in 1:length(xg)) lines(xg[i]+density[,i], yg, ...)
  abline(v = xg)
}
