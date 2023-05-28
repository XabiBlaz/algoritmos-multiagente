function [H] = Hessiano_error(c0,t,N,D,S,w0,v,d)
%Aqu� el gradiente es negativo, contrario a la funci�n estudiada
%GRADIENT_POINT: Con el n�mero de robots N, el punto donde se indica el
%centro c0 y el radio de la formaci�n D se devuelve su gradiente aproximado grad_centr
e=[1;0];
K=0;


for j=1:N
        %A este �ngulo se le puede a�adir movimiento rotatorio (w*t)
        phi=w0*t+2*pi()*j/N;
        R=[cos(phi) -sin(phi);sin(phi) cos(phi)];
        %Posici�n del robot individual
        delta_i=normrnd(0,d^2,[2,1]);
        c0=c0+normrnd(0,d^2,[2,1]);
        r_i=c0+D*R*e+delta_i;
        %Suma para el gradiente (esto luego se utiliza para la aprox. del
        %grad. en el centro)
        v_i=normrnd(0,v^2);
        
        K=K-(funcion_ruido_2D(r_i,v,d)-funcion_ruido_2D(c0,v,d))*(r_i-c0)*(r_i-c0)';
end
K_centr=16/(N*D^4)*K;
%Aproximaci�n del Hessiano, soluci�n de la ecuaci�n general:
H12=K_centr(2,1)/2;
A=[3 1;1 3];
b=[K_centr(1,1);K_centr(2,2)];
vec_x=linsolve(A,b);
H11=vec_x(1,1);
H22=vec_x(2,1);
H=[H11 H12;H12 H22];   
end

