function [grad_centr] = gradient_point_3D(c0,t,N,D,S,w0)
%GRADIENT_POINT: Con el número de robots N, el punto donde se indica el
%centro c0 y el radio de la formación D se devuelve su gradiente aproximado grad_centr


grad_sum=0;
for j=1:N
    %Determinación del ángulo azimutal
    phi=w0*t+2*pi*j/N;
    %Determinación del ángulo polar
    if rem(j,2)==0
        theta=pi-0.955316618;
    else
        theta=0.955316618;
    end
    %Posición del robot individual (esfera)
    delta_i=0;
    %delta_i=normrnd(0,delta^2,[3 1]);
            
    r_i=c0+D*[sin(theta)*cos(phi);sin(theta)*sin(phi);cos(theta)]+delta_i;
    %Suma para el gradiente (se tiene en cuenta cada%robot)
    grad_sum=grad_sum-(100*exp(-r_i'*S*r_i))*(r_i-c0);
end
%Aproximación del gradiente en el centro
grad_centr=3/(N*D^2)*grad_sum;

end
