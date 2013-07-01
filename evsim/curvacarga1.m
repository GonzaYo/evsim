function [ conkWh,tiempo,horausoveh ] = curvacarga( usuario1,vehiculos,tipotec,energiabateria )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[a,b,cc]=xlsread('CurvaCargaLosCedros.xlsx',1,'curvacarga');
g=length(cc(:,1));
hora=cell(g,1);
conkWh=cell(g,1);
recarlenta=3.6;

for i=1:g;
hora{i,1}=cc{i,1};
conkWh{i,1}=cc{i,3};
end
horausoveh=usuario1{2,1};

tiempo=zeros(length(energiabateria),1);
for i=1:length(energiabateria)
    if strcmp(energiabateria{i,1},'Bateria kWh') || strcmp(tipotec{i,1},'HEV')
    tiempo(i,1)=0;
    else
    tiempo(i,1)=ceil(energiabateria{i,1}/recarlenta);
    end

    tiemporecar=tiempo;
end
conta=0;
for i=1:length(energiabateria);
if tiemporecar(i,1)>0
    for e=1:24
        if horausoveh(1,randi(24))==0
            conta=conta+1;
            horausoveh(1,i)=horausoveh(1,i)-1;
        end
    end
end
end
