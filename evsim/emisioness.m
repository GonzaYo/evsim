%El script solo tiene en cuenta vehiculos particulares, motos, taxis,
%microbuses y camionetas. Queda la opcion de incorporar buses, camiones
%etc.
%estas Variables NVpi-NCCi es el numero de vehiculos, y depende 
%de lo que arroje el estudio de mercado o la curva parametrica que nos 
%recomendo la ingeniera.

Porcentajes=xlsread('Impac.Amb..xlsx','a','B17:B48')

%Lo anterior supongo que hay que cambiarlo debido a que estas variables
%dependen del numero de vehiculos de combustion por a�o. adem�s hay que
%tener en cuenta si vamos a tener en cuenta la cantidad de contaminantes
%que se dejan emitir (si se toman los vehiculos de combustion que no
%estar�n en circulacion), o si se muestra la cantidad de contaminantes que
%se emiten (aqui habr�a que tener en cuenta las emisiones de los vehiculos
%de combustion interna y los hibridos, de los cuales tocar�a buscar info).
x=length(a);
for i=1:x;
CO2(1,i)=datos(i,3)*datos(i,2)*a(i)
CO(1,i)=datos(i,4)*datos(i,2)*a(i);
NOX(1,i)=datos(i,5)*datos(i,2)*a(i);
THC(1,i)=datos(i,6)*datos(i,2)*a(i);
PM(1,i)=datos(i,7)*datos(i,2)*a(i);
end
CO2T=0;COT=0;NOXT=0;THCT=0;PMT=0;
for i=1:x
CO2T=CO2(i)+CO2T;
COT=CO(i)+COT;
NOXT=NOX(i)+NOXT;
THCT=THC(i)+THCT;
PMT=PM(i)+PMT;
end
disp('CO2 (Ton/a�o)');disp(CO2T);disp('CO (Ton/a�o)');disp(COT);
disp('NOX (Ton/a�o)');disp(NOXT);disp('THC (Ton/a�o)');disp(THCT);
disp('P M (Ton/a�o)');disp(PMT);