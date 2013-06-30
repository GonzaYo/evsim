function curvacarga() 

%EV=input('\n1. Digite el Numero de EVs a simular: ');
%aux1=rand(1,EV);
%fprintf('\nOPCIONES DE PHEVs: ' );
%fprintf('\nToyota Prius' ); 
%fprintf('\nChevrolet Volta' ); 
%fprintf('\n  ');
%phev1=input('\n1. Ingrese la cantidad de PHEVs-Toyota Prius a simular: ');
%phev2=input('\n1. Ingrese la cantidad de PHEVs-Chevrolet Volta a simular: ');
%fprintf('\nElija el tipo de Usuario de los PHEVs: ' );
%fprintf('\n Opción1: Trabajador Normal  ');
%fprintf('\n Opción2: Ama de casa  ');
%fprintf('\n Opción3: Trabajador 12horas ');
%fprintf('\n Opción4: Trabajador 2 jornadas  ');
%fprintf('\n Opción5: Trabajador de Noche  ');
%opPHEV=input('\n1. Ingrese la opción del tipo de usuario: '); 

%fprintf('\nOPCIONES DE BEVs: ' ); 
%fprintf('\nRenault Fluence' ); 
%fprintf('\nNissan Leaf SV' ); 
%fprintf('\n  ');
%bev1=input('\n1. Ingrese la cantidad de BEVs-Renault Fluence a simular: ');
%bev2=input('\n1. Ingrese la cantidad de BEVs-Nissan Leaf SV a simular: ');
%fprintf('\nElija el tipo de Usuario de los BEVs: ' );
%fprintf('\n Opción1: Trabajador Normal  ');
%fprintf('\n Opción2: Ama de casa  ');
%fprintf('\n Opción3: Trabajador 12horas ');
%fprintf('\n Opción4: Trabajador 2 jornadas  ');
%fprintf('\n Opción5: Trabajador de Noche  ');
%opBEV=input('\n1. Ingrese la opción del tipo de usuario: '); 

%PERFIL USUARIO
%-Velocidad 24km/h
%-Distancia 20 km


%succes=xlswrite('Impac.Amb..xlsx',E,'a','I1:AC7');
[~,~,Celdas]=xlsread('Vehiculos.xls','Entrada', 'B5:E9');

EV=cell2mat(Celdas(2,4));
phev1= cell2mat(Celdas(2,2));
phev2=cell2mat(Celdas (3,2));
opPHEV=cell2mat(Celdas(2,3));
bev1= cell2mat(Celdas(4,2));
bev2= cell2mat(Celdas(5,2));
opBEV=cell2mat(Celdas(4,3));

h= 1:1:24; 
kw=[53.05 47.75 42.44 47.75 53.05 84.89 95.50 84.89 79.58 74.28 74.28 79.58 79.58 74.28 63.67 58.36 58.36 63.67 84.89 106.11 106.11 95.50 74.28 63.67];

plugged1=zeros(1,24);
example1=zeros(1,24);
plugged2=zeros(1,24);
example2=zeros(1,24);
plugged3=zeros(1,24);
example3=zeros(1,24);
plugged4=zeros(1,24);
example4=zeros(1,24);
plugged5=zeros(1,24);
example5=zeros(1,24);

   
for j=1:1:EV
    
if (opPHEV==1  || opBEV==1)
       
        for i=2:1:5
            plugged1(i,j)=1;
            example1(i)=1;
        end
        for i=6:1:18
            plugged1(i,j)=0;
            example1(i)=0;
        end
        for i=19:1:24
            plugged1(i,j)=1;
            example1(i)=1;
        end
          
      
end
if (opPHEV==2  || opBEV==2) 
         
        for i=2:1:5
            plugged2(i,j)=1;
            example2(i)=1;
        end
        for i=6:1:19
            plugged2(i,j)=0;
            example2(i)=0;
        end
        for i=20:1:24
            plugged2(i,j)=1;
            example2(i)=1;
        end
       
    
end
if (opPHEV==3  || opBEV==3)
         
        for i=2:1:5
            plugged3(i,j)=1;
            example3(i)=1;
        end
        for i=6:1:9
            plugged3(i,j)=0;
            example3(i)=0;
        end
        for i=10:1:13
            plugged3(i,j)=1;
            example3(i)=1;
        end
        for i=14:1:16
            plugged3(i,j)=0;
            example3(i)=0;
        end
        for i=17:1:18
            plugged3(i,j)=1;
            example3(i)=1;
        end
        for i=19:1:20
            plugged3(i,j)=0;
            example3(i)=0;
        end
        for i=21:1:24
            plugged3(i,j)=1;
            example3(i)=1;
        end
      
end 
 
if (opPHEV==4  || opBEV==4)
        
        for i=2:1:6
            plugged4(i,j)=1;
            example4(i)=1;
        end
        for i=7:1:12
            plugged4(i,j)=0;
            example4(i)=0;
        end
        for i=13:1:14
            plugged4(i,j)=1;
            example4(i)=1;
        end
        for i=15:1:18
            plugged4(i,j)=0;
            example4(i)=0;
        end
        for i=19:1:24
            plugged4(i,j)=1;
            example4(i)=1;
        end
      
     
end 
     
if (opPHEV==5  || opBEV==5)
        
        for i=2:1:6
            plugged5(i,j)=0;
            example5(i)=0;
        end
        for i=7:1:17
            plugged5(i,j)=1;
            example5(i)=1;
        end
        for i=18:1:24
            plugged5(i,j)=0;
            example5(i)=0;
        end
        
end
    
end


bat_toy=5.2; %3 horas de carga a 120 V
bat_volta=16.5; %12 horas de carga a 120 V
bat_nissan=24; %8 horas de carga 120 V
bat_fluence=22; % 10 horas de carga 120 V
total_charge1=0;
total_charge2=0;
total_charge3=0;
total_charge4=0;

cargatoy=zeros(1,24);
cargavolta=zeros(1,24);
cargafluence=zeros(1,24);
carganissan=zeros(1,24);
cargatotal=zeros(1,24);
  
kw1=kw;   

if opPHEV==1
     for i=19:1:24
       if example1(i)==1 && i<25
           if total_charge1<bat_toy
           cargatoy(i)=bat_toy/3; 
           total_charge1=total_charge1+ cargatoy(i);
           end
           if total_charge2<bat_volta 
           cargavolta(i)=bat_volta/12; 
           total_charge2=total_charge2+ cargavolta(i);
           end
       end
     end
     for i=1:1:5
       if example1(i)==1 && i<25
           if total_charge1<bat_toy
           cargatoy(i)=bat_toy/3; 
           total_charge1=total_charge1+ cargatoy(i);
           end
           if total_charge2<bat_volta 
           cargavolta(i)=bat_volta/12; 
           total_charge2=total_charge2+ cargavolta(i);
           end
       end
     end 
 end  
 
 if opPHEV==2
     for i=20:1:24
       if example2(i)==1 && i<25
           if total_charge1<bat_toy
           cargatoy(i)=bat_toy/3; 
           total_charge1=total_charge1+ cargatoy(i);
           end
           if total_charge2<bat_volta 
           cargavolta(i)=bat_volta/12; 
           total_charge2=total_charge2+ cargavolta(i);
           end
       end
     end
     for i=1:1:5
       if example2(i)==1 && i<25
           if total_charge1<bat_toy
           cargatoy(i)=bat_toy/3; 
           total_charge1=total_charge1+ cargatoy(i);
           end
           if total_charge2<bat_volta 
           cargavolta(i)=bat_volta/12; 
           total_charge2=total_charge2+ cargavolta(i);
           end
       end
     end 
        
 end  
 if opPHEV==3
     for i=10:1:13
       if example3(i)==1 && i<25
           
           if total_charge1<bat_toy
           cargatoy(i)=bat_toy/3; 
           total_charge1=total_charge1+ cargatoy(i);
           end
           if total_charge2<bat_volta 
           cargavolta(i)=bat_volta/12; 
           total_charge2=total_charge2+ cargavolta(i);
           end
                            
       end
     end 
      for i=17:1:18
       if example3(i)==1 && i<25
           
           if total_charge1<bat_toy
           cargatoy(i)=bat_toy/3; 
           total_charge1=total_charge1+ cargatoy(i);
           end
           if total_charge2<bat_volta 
           cargavolta(i)=bat_volta/12; 
           total_charge2=total_charge2+ cargavolta(i);
           end
                            
       end
     end 
     
     for i=21:1:24
       if example3(i)==1 && i<25
           
           if total_charge1<bat_toy
           cargatoy(i)=bat_toy/3; 
           total_charge1=total_charge1+ cargatoy(i);
           end
           if total_charge2<bat_volta 
           cargavolta(i)=bat_volta/12; 
           total_charge2=total_charge2+ cargavolta(i);
           end
                            
       end
     end 
     
     for i=1:1:5
       if example3(i)==1 && i<25
           
           if total_charge1<bat_toy
           cargatoy(i)=bat_toy/3; 
           total_charge1=total_charge1+ cargatoy(i);
           end
           if total_charge2<bat_volta 
           cargavolta(i)=bat_volta/12; 
           total_charge2=total_charge2+ cargavolta(i);
           end
                            
       end
     end 

 end 
 if opPHEV==4
     for i=19:1:24
       if example4(i)==1 && i<25
           if total_charge1<bat_toy
           cargatoy(i)=bat_toy/3; 
           total_charge1=total_charge1+ cargatoy(i);
           end
           if total_charge2<bat_volta 
           cargavolta(i)=bat_volta/12; 
           total_charge2=total_charge2+ cargavolta(i);
           end
       end
     end
     for i=1:1:6
       if example4(i)==1 && i<25
           if total_charge1<bat_toy
           cargatoy(i)=bat_toy/3; 
           total_charge1=total_charge1+ cargatoy(i);
           end
           if total_charge2<bat_volta 
           cargavolta(i)=bat_volta/12; 
           total_charge2=total_charge2+ cargavolta(i);
           end
           
      end
     end 
     for i=13:1:14
           if example4(i)==1 && i<25
           if total_charge1<bat_toy
           cargatoy(i)=bat_toy/3; 
           total_charge1=total_charge1+ cargatoy(i);
           end
           if total_charge2<bat_volta 
           cargavolta(i)=bat_volta/12; 
           total_charge2=total_charge2+ cargavolta(i);
           end
           end
     end
       
 end 
 if opPHEV==5
      for i=7:1:17
       if example5(i)==1 && i<25
           if total_charge1<bat_toy
           cargatoy(i)=bat_toy/3; 
           total_charge1=total_charge1+ cargatoy(i);
           end
           if total_charge2<bat_volta 
           cargavolta(i)=bat_volta/12; 
           total_charge2=total_charge2+ cargavolta(i);
           end
       end
     end 
 
 end
 
 
 if opBEV==1
     for i=19:1:24
       if example1(i)==1 && i<25
           if total_charge3<bat_nissan
           carganissan(i)=bat_nissan/8; 
           total_charge3=total_charge3+ carganissan(i);
           end
           if total_charge4<bat_fluence
           cargafluence(i)=bat_fluence/10; 
           total_charge4=total_charge4+ cargafluence(i);
           end
       end
     end
     for i=1:1:5
       if example1(i)==1 && i<25
           if total_charge3<bat_nissan
           carganissan(i)=bat_nissan/8; 
           total_charge3=total_charge3+ carganissan(i);
           end
           if total_charge4<bat_fluence
           cargafluence(i)=bat_fluence/10; 
           total_charge4=total_charge4+ cargafluence(i);
           end
       end
     end 
 end  
 
 if opBEV==2
     for i=20:1:24
       if example2(i)==1 && i<25
           if total_charge3<bat_nissan
           carganissan(i)=bat_nissan/8; 
           total_charge3=total_charge3+ carganissan(i);
           end
           if total_charge4<bat_fluence
           cargafluence(i)=bat_fluence/10; 
           total_charge4=total_charge4+ cargafluence(i);
           end
       end
     end
     for i=1:1:5
       if example2(i)==1 && i<25
           if total_charge3<bat_nissan
           carganissan(i)=bat_nissan/8; 
           total_charge3=total_charge3+ carganissan(i);
           end
           if total_charge4<bat_fluence
           cargafluence(i)=bat_fluence/10; 
           total_charge4=total_charge4+ cargafluence(i);
           end
       end
     end 
        
 end  
 if opBEV==3
     for i=10:1:13
       if example3(i)==1 && i<25
           
           if total_charge3<bat_nissan
           carganissan(i)=bat_nissan/8; 
           total_charge3=total_charge3+ carganissan(i);
           end
           if total_charge4<bat_fluence
           cargafluence(i)=bat_fluence/10; 
           total_charge4=total_charge4+ cargafluence(i);
           end
                            
       end
     end 
      for i=17:1:18
       if example3(i)==1 && i<25
           
           if total_charge3<bat_nissan
           carganissan(i)=bat_nissan/8; 
           total_charge3=total_charge3+ carganissan(i);
           end
           if total_charge4<bat_fluence
           cargafluence(i)=bat_fluence/10; 
           total_charge4=total_charge4+ cargafluence(i);
           end
                            
       end
     end 
     
     for i=21:1:24
       if example3(i)==1 && i<25
           
           if total_charge3<bat_nissan
           carganissan(i)=bat_nissan/8; 
           total_charge3=total_charge3+ carganissan(i);
           end
           if total_charge4<bat_fluence
           cargafluence(i)=bat_fluence/10; 
           total_charge4=total_charge4+ cargafluence(i);
           end
                            
       end
     end 
     
     for i=1:1:5
       if example3(i)==1 && i<25
           
           if total_charge3<bat_nissan
           carganissan(i)=bat_nissan/8; 
           total_charge3=total_charge3+ carganissan(i);
           end
           if total_charge4<bat_fluence
           cargafluence(i)=bat_fluence/10; 
           total_charge4=total_charge4+ cargafluence(i);
           end
                            
       end
     end 

 end 
 if opBEV==4
     for i=19:1:24
       if example4(i)==1 && i<25
           if total_charge3<bat_nissan
           carganissan(i)=bat_nissan/8; 
           total_charge3=total_charge3+ carganissan(i);
           end
           if total_charge4<bat_fluence
           cargafluence(i)=bat_fluence/10; 
           total_charge4=total_charge4+ cargafluence(i);
           end
       end
     end
     for i=1:1:6
       if example4(i)==1 && i<25
           if total_charge3<bat_nissan
           carganissan(i)=bat_nissan/8; 
           total_charge3=total_charge3+ carganissan(i);
           end
           if total_charge4<bat_fluence
           cargafluence(i)=bat_fluence/10; 
           total_charge4=total_charge4+ cargafluence(i);
           end
           
      end
     end 
     for i=13:1:14
          if example4(i)==1 && i<25
           if total_charge3<bat_nissan
           carganissan(i)=bat_nissan/8; 
           total_charge3=total_charge3+ carganissan(i);
           end
           if total_charge4<bat_fluence
           cargafluence(i)=bat_fluence/10; 
           total_charge4=total_charge4+ cargafluence(i);
           end
          end
     end
       
 end 
 if opBEV==5
      for i=7:1:17
       if example5(i)==1 && i<25
           if total_charge3<bat_nissan
           carganissan(i)=bat_nissan/8; 
           total_charge3=total_charge3+ carganissan(i);
           end
           if total_charge4<bat_fluence
           cargafluence(i)=bat_fluence/10; 
           total_charge4=total_charge4+ cargafluence(i);
           end
       end
     end 
 
 end
 
        cargatoy=cargatoy*phev1;
        cargavolta=cargavolta*phev2;
        cargafluence=cargafluence*bev1;
        carganissan=carganissan*bev2;
        
        for i=1:1:24
                    
        cargatotal(i)=cargatoy(i)+cargavolta(i)+carganissan(i)+cargafluence(i);
        kw1(i)= kw1(i)+ cargatotal(i);
        
        end


figure 

if (phev1>0)
    subplot(2,3,1);
    bar(cargatoy, 'r', 'stacked' )
    xlim ([1 24]);
    ylabel('Potencia  (kW)');
    xlabel('Hora del día(h)');
    grid on;
    title ('P-t PHEV-Toyota Prius');
    hold on 
end
if (phev2>0)
    subplot(2,3,2);
    bar(cargavolta, 'b', 'stacked' )
     xlim ([1 24]);
     ylabel('Potencia (kW)');
    xlabel('Hora del día(h)');
     grid on;
    title ('P-t PHEV-Chevy Volt');
   hold on
end  

if (bev1>0)
    subplot(2,3,3);
    bar(cargafluence, 'r', 'stacked' )
    xlim ([1 24]);
    ylabel('Potencia (kW)');
    xlabel('Hora del día(h)');
     grid on;
    title ('P-t BEV-Renault Fluence ZE');
    hold on 
end
if (bev2>0)
    subplot(2,3,4);
    bar(carganissan, 'b', 'stacked' )
     xlim ([1 24]);
     ylabel('Potencia (kW)');
    xlabel('Hora del día(h)');
     grid on;
    title ('P-t BEV-Nissan Leaf SV');
end   

figure
subplot(1,2,1);
bar(h,kw, 'b', 'LineWidth',2);
ylabel('Potencia demandada cada hora (MW)');
xlabel('Hora del día(h)');
axis ([0 24 40 300]);
xlim ([0 24]);
grid on; 
title ('Curva Carga Barrio "Los Cedros" sin EVs');

subplot(1,2,2);
bar(h,kw1, 'g', 'LineWidth',2);
ylabel('Potencia demandada cada hora (MW)');
xlabel('Hora del día(h)');
axis ([0 24 40 300]);
xlim ([0 24]);
grid on;
title ('Curva Carga Barrio "Los Cedros" con EVs');




