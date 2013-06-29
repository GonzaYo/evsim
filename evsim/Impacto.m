function Impacto()
clc
clear all
format bank
probabilidad
%generacion de residuos sólidos por año
Variables1=[PHEVtot,BEVtot,HEVtot,CItot];
z=tiempo-2013;
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
succes=xlswrite('Impac.Amb..xlsx',E,'a','I1:AC7');
Variables=xlsread('Impac.Amb..xlsx','a','C1:AC7');
for i=1:6
    p=Variables(i,4);
    for j=1:z
        a(i,j)=Variables(i,2)*Variables(i,j+6);
        if p+j-1<z
        b(p+j-1)=a(i,j)+c(p+j-1);
        c(p+j-1)=b(p+j-1,1);
        else
        end
            end
end
cT=0;
for i=1:z
c(i)=c(i)+cT;
cT=c(i);
end
for k=1:z
h(k)=c(k);
x(k)=k+2013;
end
figure(2);
subplot(2,2,1);plot(x,h,'b>-');
grid on;
title('Generación de residuos de Evs Vs. Año','FontName','Arial','FontSize',18);
xlabel('Año');
ylabel('Toneladas Desechos de baterias');
% Equivalencia entre vehiculos hibridos y de combution interna
for i=1:6
    aa(i,1)=Variables(i,5)+Variables(i,6);
    bb(i,1)=Variables(i,5)*Variables(i,7)*Variables(i,3)/1000;
    cc(i,1)=aa(i,1)*Variables(7,3)/1000;
    dd(i,1)=bb(i)/cc(i);
    ff(i,1)=floor(dd(i,1));
end
succes=xlswrite('Impac.Amb..xlsx',bb,'a','C10:C15');
succes=xlswrite('Impac.Amb..xlsx',ff,'a','D10:D15');

%Parte de contaminantes atmosféricos
Por=xlsread('Impac.Amb..xlsx','a','B19:H50');
xx=length(Por);
for j=1:z
for i=1:xx;
CO2(1,i)=Por(i,3)*Por(i,2)*Por(i,1)*Variables1(j,4)/1e6*365;
CO2s(1,i)=Por(i,3)*Por(i,2)*Por(i,1)*(Variables1(j,4)+Variables1(j,3)+Variables1(j,2)+Variables1(j,1))/1e6*365;
CO(1,i)=Por(i,4)*Por(i,2)*Por(i,1)*Variables1(j,4)/1e6*365;
COs(1,i)=Por(i,4)*Por(i,2)*Por(i,1)*(Variables1(j,4)+Variables1(j,3)+Variables1(j,2)+Variables1(j,1))/1e6*365;
NOX(1,i)=Por(i,5)*Por(i,2)*Por(i,1)*Variables1(j,4)/1e6*365;
NOXs(1,i)=Por(i,5)*Por(i,2)*Por(i,1)*(Variables1(j,4)+Variables1(j,3)+Variables1(j,2)+Variables1(j,1))/1e6*365;
THC(1,i)=Por(i,6)*Por(i,2)*Por(i,1)*Variables1(j,4)/1e6*365;
THCs(1,i)=Por(i,6)*Por(i,2)*Por(i,1)*(Variables1(j,4)+Variables1(j,3)+Variables1(j,2)+Variables1(j,1))/1e6*365;
PM(1,i)=Por(i,7)*Por(i,2)*Por(i,1)*Variables1(j,4)/1e6*365;
PMs(1,i)=Por(i,7)*Por(i,2)*Por(i,1)*(Variables1(j,4)+Variables1(j,3)+Variables1(j,2)+Variables1(j,1))/1e6*365;
end
CO2T=0;COT=0;NOXT=0;THCT=0;PMT=0;CO2Ts=0;COTs=0;NOXTs=0;THCTs=0;PMTs=0;
for i=1:xx
CO2T=CO2(1,i)+CO2T;
COT=CO(1,i)+COT;
NOXT=NOX(1,i)+NOXT;
THCT=THC(1,i)+THCT;
PMT=PM(1,i)+PMT;
CO2Ts=CO2s(1,i)+CO2Ts;
COTs=COs(1,i)+COTs;
NOXTs=NOXs(1,i)+NOXTs;
THCTs=THCs(1,i)+THCTs;
PMTs=PMs(1,i)+PMTs;
end
Diox(j,1)=CO2T;
Mono(j,1)=COT;
Nitro(j,1)=NOXT;
Tetra(j,1)=THCT;
particula(j,1)=PMT;
Dioxs(j,1)=CO2Ts;
Monos(j,1)=COTs;
Nitros(j,1)=NOXTs;
Tetras(j,1)=THCTs;
particulas(j,1)=PMTs;
end

subplot(2,2,2);plot(x,Mono,'ro-',x,Monos,'r-',x,Diox,'bo-',x,Dioxs,'b-');
grid on;
title('Aumento de Emisiones de Contaminantes Vs. Año','FontName','Arial','FontSize',12);
xlabel('Año');
ylabel('Toneladas de contaminantes');
legend('CO con Mas','CO sin Mas','CO2 con Mas','CO2 sin Mas','Location','NorthWest');
subplot(2,2,3);plot(x,Nitro,'b<-',x,Nitros,'b-',x,Tetra,'ko-',x,Tetras,'k-');
grid on;
title('Aumento de Emisiones de Contaminantes Vs. Año','FontName','Arial','FontSize',12);
xlabel('Año');
ylabel('Toneladas de contaminantes');
legend('NOX con Mas','NOX sin Mas','THC con Mas','THC sin Mas','Location','NorthWest');
subplot(2,2,4);plot(x,particula,'g+-',x,particulas,'g-');
grid on;
title('Aumento de Emisiones de Material particulado Vs. Año','FontName','Arial','FontSize',12);
xlabel('Año');
ylabel('Toneladas');
legend('PM con Mas','PM sin Mas','Location','NorthWest');



