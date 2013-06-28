function Impacto()
clc
clear all
format bank
Variables1=xlsread('historicopoblacion.xls','vehiculos','X43:AA63');
z=xlsread('historicopoblacion.xls','vehiculos','X68');
D=Variables1';
c=zeros(z,1);
b=zeros(z,1);
for m=1:z
    for l=0:3
        if l==3
            E((2*l)+1,m)=D(l+1,m);
        else
        q=D(l+1,m)/2;
        E((2*l)+1,m)=q;
        E((2*l)+2,m)=q;
        end
       end
end
succes=xlswrite('Impac.Amb..xlsx',E,'a','I1:AB7');
Variables=xlsread('Impac.Amb..xlsx','a','C1:AB7');
for i=1:6
    p=Variables(i,4);
    for j=1:z
        a(i,j)=Variables(i,2)*Variables(i,j+6);    
        b(p+j-1)=a(i,j)+c(j);
        c(j)=b(p+j-1);
    end
end
for k=1:z
h(k)=b(k);
x(k)=k+2013;
end

plot(x,h,'b-')
grid on;
title('Generación de residuos de Evs Vs. Año','FontName','Arial','FontSize',18);
xlabel('Año');
ylabel('Toneladas Desechos de baterias');

for i=1:6
    aa(i,1)=Variables(i,5)+Variables(i,6);
    bb(i,1)=Variables(i,5)*Variables(i,7)*Variables(i,3)/1000;
    cc(i,1)=aa(i,1)*Variables(7,3)/1000;
    dd(i,1)=bb(i)/cc(i);
    ff(i,1)=floor(dd(i,1));
end
succes=xlswrite('Impac.Amb..xlsx',bb,'a','C10:C15');
succes=xlswrite('Impac.Amb..xlsx',ff,'a','D10:D15');