function [resultadoH] = calcular_hessiano_3D(r)
%CALCULAR_HESSIANO3D Summary of this function goes here
syms x y z
S=10^-4*[100,1,1;1,1,0;1,0,10];
f = 100*exp(-[x,y,z]*S*[x;y;z]);
H=hessian(f,[x,y,z]);
x=r(1,1);
y=r(2,1);
z=r(3,1);
subs(H);
resultadoH=eval(H);
end

