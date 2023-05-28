function alphas = alpha_strongWolfe_zoom3D(x,p,alphalo,alphahi,c1,c2,t,N,D,S,w0)
% ALPHA_STRONGWOLFE_ZOOM helps us to compute the alpha
% alphas = alpha_strongWolfe_zoom(func,grad,x,p,alphalo,alphahi,c1,c2)
% Algorithm 3.6 on page 61 in Nocedal and Wright
 fx = funcion3D(x);
 gx = gradient_point_3D(x,t,N,D,S,w0)'*p;
 while 1
    alphax = 1/2*(alphalo + alphahi);
    xx = x + alphax*p;
    fxx = funcion3D(xx);
    gxx = gradient_point_3D(xx,t,N,D,S,w0)'*p;
    xl = x + alphalo*p;
    fxl = funcion3D(xl);
   if ((fxx > funcion3D(xl)+ c1*alphax*gx || (fxx >= fxl)))
      alphahi = alphax;
   else
      if abs(gxx) <= -c2*gx
        alphas = alphax;
        break;
      end
      if gxx*(alphahi-alphalo) >= 0
      alphahi = alphalo;
      end
      alphalo = alphax;
   end
   
end