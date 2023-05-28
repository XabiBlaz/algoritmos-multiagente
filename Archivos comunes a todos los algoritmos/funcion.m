function [y] = funcion(r)
%FUNCION2D con la entrada de la matriz S y la posición actual te da la
%respuesta del valor de la funcion
S=10^-4*[2,1;1,1];
y=-100*exp(-r'*S*r);
end

