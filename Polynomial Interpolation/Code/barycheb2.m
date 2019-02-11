 function ye = barycheb2(xd, yd, xe )

  nd = length(xd);
  ni = length(xe);
  wd = [ 1/2; ones(nd-2,1); 1/2 ] .* (-1) .^ ( (0:nd-1)' );

   numer = zeros ( ni, 1 );
  denom = zeros ( ni, 1 );
  exact = zeros ( ni, 1 );
  for j = 1 : nd
    t = wd(j) ./ ( xe - xd(j) );
    numer = numer + t * yd(j);
    denom = denom + t;
    exact( xe == xd(j) ) = j;
  end
  ye = numer ./ denom;
  j = find ( exact );
  ye(j) = yd(exact(j));

  return
end
