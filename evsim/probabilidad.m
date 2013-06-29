%Se importa la tabla de Excel donde se encuentran los datos de los
%vehiculos
[a,b,entrada]=xlsread('Vehiculos.xls','Entrada','Entrada');
[a,b,evs]=xlsread('Vehiculos.xls',3,'escogidos');
tiempo=entrada{1,1};
escenario=entrada{1,2};
%[c,d,ci]=xlsread('Vehiculos.xlsx',2);
o=length(evs(:,1));
%Se crean variables vacias para almacenar las variables y se ingresa el costo de la gasolina y el kWh
vehiculos=cell(o,1);
precios=cell(o,1);
autonomiabateria=cell(o,1);
autonomiagasolina=cell(o,1);
energiabateria=cell(o,1);
capacidadgalones=cell(o,1);
tipotec=cell(o,1);
time=2013:1:tiempo;
%precio de la Gasolina y la electricidad a traves del tiempo 
pregas=521.48*time-1040101.45;
%En la siguiente linea se encuentra comentado otrá proyección para la
%gasolina
%pregas=((14000-8000)/(2027-2013))*time-854714.2857;
electri=5.6853431372549*time-11315.6670588235;
%Creación de Variables para almacenar el costo total del combustible en el
%tiempo
costocombus=cell(o,length(time));
%costocombuspre=cell(o,length(time));
prob=zeros(o,1);
preciobateria=zeros(o,1);
%Definición de la inflación.
%infla=0.03;
%Revisión técnico mecánica 2013
revision=138300;
semaforizacion=39000;

%Se definen los tipos de usuario tipos de usuario
usuario1={};
usuario1{1,1}=40;
usuario1{2,1}=[1 1 0 0 0 0 0 1 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0];

%se colocan los datos de cada una de las variables 

for i=1:length(evs(:,1));
vehiculos{i,1}=evs{i,1};
precios{i,1}=evs{i,7};
autonomiabateria{i,1}=evs{i,9};
autonomiagasolina{i,1}=evs{i,8};
energiabateria{i,1}=evs{i,5};
capacidadgalones{i,1}=evs{i,4};
tipotec{i,1}=evs{i,2};


end

for i=2:length(evs(:,1));
if strcmp(energiabateria{i,1},'ND')
    preciobateria(i,1)=0;
else
    preciobateria(i,1)=688*1834.86239*energiabateria{i,1};
end
end

%se calcula el costo de recargar cada vehiculo según el consumo de cada
%usuario
cb=zeros(length(time),1);

for u=1:length(time)
    gasolina=pregas(u);
    kWh=electri(u);
    cambiobateria=mod(u,5);
    cb(u,1)=cambiobateria;
for j=2:o;
    %costo combustible para BEVs
if  strcmp(tipotec{j,1},'BEV')
   if usuario1{1,1}>autonomiabateria{j,1};
        display('No es suficiente la autonomia del BEV', vehiculos{j,1});
   else
        costocombus{j,u}=((energiabateria{j,1}*kWh)/autonomiabateria{j,1})*usuario1{1,1};
        %costocombuspre{j,u}=costocombus{j,u}/((1+infla)^u);
   end
end
%costo combustible para PHEVs
     if strcmp(tipotec{j,1},'PHEV')
         if strcmp(autonomiabateria{j,1},'ND')
         costocombus{j,u}=inf;
         else
         %Comparación entre autonomia bateria PHEV y recorrido de usuario
         %para determinar si se usa solamente la bateria o es necesario
         %usar gasolina
         if  usuario1{1,1}<autonomiabateria{j,1} || usuario1{1,1} == autonomiabateria{j,1} 
         costocombus{j,u}=(energiabateria{j,1}*kWh/autonomiabateria{j,1})*usuario1{1,1};
         %costocombuspre{j,u}=costocombus{j,u}/((1+infla)^u);
         else
             if strcmp(autonomiagasolina{j,1},'ND')
             costocombus{j,u}=inf;
             else
             if usuario1{1,1}>autonomiabateria{j,1};
                 usogas=usuario1{1,1}-autonomiabateria{j,1};
                 costocombus{j,u}=(capacidadgalones{j,1}*gasolina/autonomiagasolina{j,1})*usogas+(energiabateria{j,1}*kWh);
                 %costocombuspre{j,u}=costocombus{j,u}/((1+infla)^u);
             end
             end
         end
         end
     else
     end
     
%     Costo combustible para HEVs
     if strcmp(tipotec{j,1},'HEV')
         costocombus{j,u}=(capacidadgalones{j,1}*gasolina/autonomiagasolina{j,1})*usuario1{1,1}*365;
         %costocombuspre{j,u}=costocombus{j,u}/((1+infla)^u);
     end
     if strcmp(tipotec{j,1},'CI')
         if escenario ~= 1
             costocombus{j,u}=(capacidadgalones{j,1}*gasolina/autonomiagasolina{j,1})*usuario1{1,1}*365+revision+0.015*precios{j,1}+semaforizacion;
         %costocombuspre{j,u}=costocombus{j,u}/((1+infla)^u);
         else
             costocombus{j,u}=(capacidadgalones{j,1}*gasolina/autonomiagasolina{j,1})*usuario1{1,1}*365;
         end
     end
     
end
end

costocombustot=zeros(j,u);

for j=2: length(evs(:,1));
    for u=1:length(time)
        costocombustot(j,u)=costocombus{j,u};
    end
end

costocombustot=sum(costocombustot');
costocombustot=costocombustot';
%prob{1,1}='Costo Total del Vehiculo';

%gasolina=
% costocombustot={};
% for j=2:o
%    for u=1:length(time)
%  costocombustot{j,1}=costocombus{j,u};
%    end
% end

costotalveh=zeros(length(evs(:,1)),1);
cb=numel(cb(cb==0));
for j=2:length(evs(:,1))
%     if strcmp(precios{j,1},'ND')
%     prob(j,1)=NaN;
%     else
    costotalveh(j,1)=(precios{j,1}+costocombustot(j,1))+energiabateria{j,1}*688*1834.86239*cb;
    prob(j,1)=1/(costotalveh(j,1));    
    %end
end
 
[consumoenergiadia, tiempocarga,horarecarveh]=curvacarga(usuario1,vehiculos,tipotec,energiabateria);


probfinalveh1(1,1)=(prob(2,1)/sum(prob));
probfinalveh1(2,1)=(prob(3,1)/sum(prob));
probfinalveh1(3,1)=(prob(4,1)/sum(prob));
probfinalveh1(4,1)=(prob(5,1)/sum(prob));
probfinalveh1(5,1)=(prob(6,1)/sum(prob));
probfinalveh1(6,1)=(prob(7,1)/sum(prob));
probfinalveh1(7,1)=(prob(8,1)/sum(prob));
probfinalveh1(8,1)=(prob(9,1)/sum(prob));

[aa,ab,cantvehexcel]=xlsread('historicopoblacion.xls','vehiculos','ventavehiculos');

cantveh=cell(length(cantvehexcel),1);
vehven=zeros(21,8);
for i=1:length(cantvehexcel) 
    cantveh{i,1}=mnrnd(ceil(cantvehexcel{i,1}),probfinalveh1,1);
end

for j=1:21
        vehven(j,:)=cantveh{j,1};
end

vehventotal=sum(vehven);
BEV=vehven(:,1)+vehven(:,2);
PHEV=vehven(:,3)+vehven(:,4);
HEV=vehven(:,5)+vehven(:,6);
CI=vehven(:,7)+vehven(:,8);
subplot(2,2,1), plot(time,BEV(1:length(time),1),time,PHEV(1:length(time),1),time,HEV(1:length(time),1),time,CI(1:length(time),1))
title('Clientes potenciales de cada tecnología');
legend('BEV','PHEV','HEV','CI')
xlabel('Año');
ylabel('Cantidad de Vehiculos')
axis([2013 time(length(time)) 0 1000])

BEVtot=BEV;
PHEVtot=PHEV;
HEVtot=HEV;
CItot=CI;
for j=2:21
    BEVtot(j,1)=BEVtot(j-1,1)+BEV(j,1);
    PHEVtot(j,1)=PHEVtot(j-1,1)+PHEV(j,1);
    HEVtot(j,1)=HEVtot(j-1,1)+HEV(j,1);
    CItot(j,1)=CItot(j-1,1)+CI(j,1);
end

totalvehiculosev=BEVtot+PHEVtot+HEVtot;

subplot(2,2,2), plot(time,BEVtot(1:length(time),1),time,PHEVtot(1:length(time),1),time,HEVtot(1:length(time),1),time,CItot(1:length(time),1))
title('Cantidad de Vehiculos de cada tecnología');
legend('BEV','PHEV','HEV','CI')
xlabel('Año');
ylabel('Cantidad de Vehiculos')
axis([2013 time(length(time)) 0 10000])
% for j=1:length(probfinalveh1)
% for i=1:length(cantvehexcel)
% cantveh(i,j)=binornd(cantvehexcel{i,1},probfinalveh1(j,1));
% end
% end
subplot(2,2,3), plot(time,BEVtot(1:length(time),1)+PHEVtot(1:length(time),1)+HEVtot(1:length(time),1),time,CItot(1:length(time),1))
title('Cantidad de Vehiculos');
legend('Electricos','Combustión Interna')
xlabel('Año');
ylabel('Cantidad de Vehiculos')
axis([2013 time(length(time)) 0 15000])