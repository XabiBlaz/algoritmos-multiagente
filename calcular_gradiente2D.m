function [resultado_grad] = calcular_gradiente2D(r)
%CALCULAR_GRADIENTE2D calcula el gradiente exacto (con fallos de cálculo de ordenador) en 2D
syms x y
S=10^-4*[2,1;1,1];
f = 100*exp(-[x,y]*S*[x;y]);
grad=gradient(f);
fx=grad(1,1);
fy=grad(2,1);
%Extraer el valor del gradiente en un punto
x=r(1,1);
y=r(2,1);
subs(grad);
resultado_grad=eval(grad);
end

