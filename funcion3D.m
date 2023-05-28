function [y] = funcion3D(r)
%FUNCION2D con la entrada de la matriz S y la posición actual te da la
%respuesta del valor de la funcion
S=10^-4*[100,1,1;1,10,0;1,0,10]; %Matriz
y=-100*exp(-r'*S*r);
end


