function [pos_rob] = posicion_robots(c0,N,D,w0,i,t)
%POSICION_ROBOTS calcula la posici�n de los robots en cada iteraci�n en 2D
e=[1;0];
 for j=1:N
        %A este �ngulo se le puede a�adir movimiento rotatorio (w*t)
        phi=w0*t(i)+2*pi()*j/N;
        R=[cos(phi) -sin(phi);sin(phi) cos(phi)];
        %Posici�n del robot individual
        pos_rob(:,j)=c0+D*R*e;
end
end

