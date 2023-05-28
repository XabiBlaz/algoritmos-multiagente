function [resultadoH] = calcular_hessiano_2D(r)
%CALCULAR_HESSIANO_2D calcula el Hessiano exacto en el punto r
syms x y
S=10^-4*[2,1;1,1];
f = 100*exp(-[x,y]*S*[x;y]);
H=hessian(f,[x,y]);
x=r(1,1);
y=r(2,1);
subs(H);
resultadoH=eval(H);

end

