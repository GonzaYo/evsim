function[C,D]=newton(X,Y)
clc
disp('  **  Laboratorio Tres  **  ')  %// Según sea el caso
disp('Codigos: 223164  223155')  %// Según sean los participantes
c=clock;
Year=num2str(c(1));
Mes=num2str(c(2));
Dia=num2str(c(3));
Hora=num2str(c(4));
Minuto=num2str(c(5));
display([Year '/' Mes '/' Dia '/' Hora ':' Minuto]);
% Entrada   - X: vector que contiene la lista de abscisas
%           - Y: vector que contiene la lista de ordenadas
% Salida    - C: vector que contiene los coeficientes del
%                polinomio interpolante de Newton
%           - D: tabla de diferencias divididas
%  METODOS NUMERICOS: Programas en Matlab
% (c) 2004 por John H. Mathews y Kurtis D. Fink
%  Software complementario acompañando al texto:
%  METODOS NUMERICOS con Matlab, Cuarta Edición
%  ISBN: 0-13-065248-2
%  Prentice-Hall Pub. Inc.
%  One Lake Street
%  Upper Saddle River, NJ 07458
n = length(X);
D = zeros(n, n);
D(:, 1) = Y';
% Formar la tabla de diferencias divididas
for  j = 2:n
   for  k = j:n
      D(k, j) = (D(k, j-1) - D(k-1, j-1)) / (X(k) - X(k-j+1));
   end
end
% Determinar los coeficientes del polinomio interpolante de Newton
C = D(n, n);
for  k = (n-1):-1:1
   C = conv(C, poly(X(k)));
   m = length(C);
   C(m) = C(m) + D(k, k);
end
res=poly2sym(poly(C));
ezplot(res,2006:1:2015);
title(' ');
end
