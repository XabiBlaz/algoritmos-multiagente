function [alpha,u] = alpha_strongWolfe_zoom_ruido(x,p,alphalo,alphahi,c1,c2,t,N,D,S,w0,v,d)
% ALPHA_STRONGWOLFE_ZOOM helps us to compute the alpha, está implementado
% el ruido de la señal
% alphas = alpha_strongWolfe_zoom(func,grad,x,p,alphalo,alphahi,c1,c2)
% Algorithm 3.6 on page 61 in Nocedal and Wright
 fx = funcion_ruido_2D(x,v,d);
 gx = gradient_point2D_ruido(x,t,N,D,S,w0,v,d)'*p;
 u=1;
 while 1
    alphax = 1/2*(alphalo + alphahi);
    xx = x + alphax*p;
    fxx = funcion_ruido_2D(xx,v,d);
    gxx = gradient_point2D_ruido(xx,t,N,D,S,w0,v,d)'*p;
    xl = x + alphalo*p;
    fxl = funcion_ruido_2D(xl,v,d);
   if ((fxx > funcion_ruido_2D(xl,v,d) + c1*alphax*gx || (fxx >= fxl)))
      alphahi = alphax;
   else
      if abs(gxx) <= -c2*gx
        alpha = alphax;
        break;
      end
      if gxx*(alphahi-alphalo) >= 0
        alphahi = alphalo;
      end
      alphalo = alphax;
   end
   if u>3000
       alpha=alphax;
       break;
   end
   u=u+1;
   
end