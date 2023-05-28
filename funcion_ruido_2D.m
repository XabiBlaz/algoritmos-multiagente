function [y] = funcion_ruido_2D(r,v,d)
%FUNCION2D con la entrada de la matriz S y la posici�n actual te da la
%respuesta del valor de la funcion
S=10^-4*[2,1;1,1];
v_i=normrnd(0,v^2);
delta_i=normrnd(0,d^2,[2 1]);
y=-100*exp(-(r+delta_i)'*S*(r+delta_i))+v_i;
end
