function [grad_centr] = gradient_point2D(c0,t,N,D,S,w0)
%GRADIENT_POINT: Con el número de robots N, el punto donde se indica el
%centro c0 y el radio de la formación D se devuelve su gradiente aproximado grad_centr
e=[1;0];
grad_sum=0;


for j=1:N
        %A este ángulo se le puede añadir movimiento rotatorio (w*t)
        phi=w0*t+2*pi()*j/N;
        R=[cos(phi) -sin(phi);sin(phi) cos(phi)];
        %Posición del robot individual
        pos_rob(:,j)=c0+D*R*e;
        r_i=pos_rob(:,j);
        %Suma para el gradiente (esto luego se utiliza para la aprox. del
        %grad. en el centro)
        grad_sum=grad_sum-100*exp(-r_i'*S*r_i)*(r_i-c0);
    end
        %Aproximación del gradiente en el centro
    grad_centr=2/(N*D^2)*grad_sum;
end

