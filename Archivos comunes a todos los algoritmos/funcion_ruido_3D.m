function [y] = funcion_ruido_3D(r,v,d)
%FUNCION2D con la entrada de la matriz S y la posición actual te da la
%respuesta del valor de la funcion
S=10^-4*[100,1,1;1,10,0;1,0,10]; %Matriz
v_i=normrnd(0,v^2);
delta_i=normrnd(0,d^2,[3 1]);
y=-100*exp(-(r+delta_i)'*S*(r+delta_i))+v_i;
end
