clc
clear all
[Variables Nombres]=xlsread('Impac.Amb..xlsx');
format bank
for i=1:6
    a(i)=Variables(i,5)+Variables(i,6);
    b(i)=Variables(i,5)*Variables(i,7)*Variables(i,3)/1000;
    c(i)=a(i)*Variables(7,3)/1000;
    d(i,1)=b(i)/c(i);
end
succes=xlswrite('Impac.Amb..xlsx',d,'H10:H15');