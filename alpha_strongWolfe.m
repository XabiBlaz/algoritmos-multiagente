function [alpha,u] = alpha_strongWolfe(x, p, steplengthParam,t,N,D,S,w0)
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
    fxx = funcion(x+alpha1*p);
    fx0 = funcion(x);
    if (fxx > funcion(x)+ c1*alpha1*gradient_point2D(x,t,N,D,S,w0)'*p || ((u>=1) && (fxx >= funcion(x+alpha0*p))))
        [alpha,j] = alpha_strongWolfe_zoom(x,p,alpha0,alpha1,c1,c2,t,N,D,S,w0); 
        u=j+u;
        break;
    end
    gxx = gradient_point2D(x+alpha1*p,t,N,D,S,w0)'*p;
    gx0 = gradient_point2D(x,t,N,D,S,w0)'*p;
    if abs(gxx) <= -c2*gx0  
        alpha = alpha1;  
        break;
    end
    
    if gxx >= 0
        [alpha,j] = alpha_strongWolfe_zoom(x,p,alpha1,alpha0,c1,c2,t,N,D,S,w0); 
        u=j+u;
        break;
    end
    alpha0 = alpha1;
    alpha1 = k*alpha1;
    u=u+1;
    if u>3000
        disp('Muchas iteraciones');
    end
end
end