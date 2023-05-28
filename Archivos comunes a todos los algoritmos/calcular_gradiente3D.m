function [resultado_grad] = calcular_gradiente3D(r)
%CALCULAR_GRADIENTE3D calcula el gradiente exacto (con fallos de cálculo de ordenador) en 3D
syms x y z
S=10^-4*[100,1,1;1,1,0;1,0,10];
f = 100*exp(-[x,y,z]*S*[x;y;z]);
grad=gradient(f);
fx=grad(1,1);
fy=grad(2,1);
fz=grad(3,1);
%Extraer el valor del gradiente en un punto
x=r(1,1);
y=r(2,1);
z=r(3,1);
subs(grad);
resultado_grad=eval(grad);
end