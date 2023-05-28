function [alpha,u] = alpha_strongWolfe_RUIDO(x, p, steplengthParam,t,N,D,S,w0,v,d)
% ALPHA_STRONGWOLFE helps us to check Linear research algorithm satisfying the strong Wofle condition
%alpha = alpha_strongWolfe( func, grad, x, p, steplengthParam)can compute the outcome of alpha
%  Algorithms 3.5 on pages 60-61 in Nocedal and Wright
u=1;
c1 = steplengthParam(1);
c2 = steplengthParam(2);
alpha1 = steplengthParam(3);
k = steplengthParam(4);
alpha0 = 0;
while 1
    fxx = funcion_ruido_2D(x+alpha1*p,v,d);
    fx0 = funcion_ruido_2D(x,v,d);
    if (fxx > funcion_ruido_2D(x,v,d)+ c1*alpha1*gradient_point2D_ruido(x,t,N,D,S,w0,v,d)'*p || ((u>=1) && (fxx >= funcion_ruido_2D(x+alpha0*p,v,d))))
        [alpha,j] = alpha_strongWolfe_zoom_ruido(x,p,alpha0,alpha1,c1,c2,t,N,D,S,w0,v,d); 
        u=j+u;
        break;
    end
    gxx = gradient_point2D_ruido(x+alpha1*p,t,N,D,S,w0,v,d)'*p;
    gx0 = gradient_point2D_ruido(x,t,N,D,S,w0,v,d)'*p;
    if abs(gxx) <= -c2*gx0  
        alpha = alpha1;  
        break;
    end
    
    if gxx >= 0
        [alpha,j] = alpha_strongWolfe_zoom_ruido(x,p,alpha1,alpha0,c1,c2,t,N,D,S,w0,v,d); 
        u=j+u;
        break;
    end
    alpha0 = alpha1;
    alpha1 = k*alpha1;
    u=u+1;
end
end