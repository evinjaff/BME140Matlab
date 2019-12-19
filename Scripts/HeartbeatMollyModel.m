
%Problem 1%
Ph_systole(1) = 122;%mmhg
Po(1) = 100;
Pa(1) = 90;
Pc(1) = 40;
Pv(1) = 12;
Ph_diastole(1) = 10;
Rho =275;%mmhg*s/L
Rac =625;
Rcv =350;
Rvh =25;
Roa =125;
Chd =0.013;%L/mmHg
Chs =0.0005;
Co =0.00065;
Ca =0.002;
Cc = 0.006;
Cv = 0.167;
Vor = 0.085;
Var = .02+.17;
Vcr = .06;
Vvr = .06+.5+.09;
Vhr = 0;
Q = .08;
deltaT=.001;

%Problem 2
Vo(1)=.15;
Va(1)=.35+.05;
Vc(1)=.3;
Vv(1)=.3+2.5+.45;
Vh(1)=.1;



%Problem 3%
time_systole = .001:.001:.26;
time_diastole = .001:.001:.54;
time_total = .001:.001:.8;

%Problem 4%
Chsys = (Chd-Chs)*exp((-time_systole)/.03) + Chs ; 
Chsys = Chsys*1.3;
Chdias= (Chs-Chd)*exp((-time_diastole)/.03) + Chd;
Chdias = Chdias*1.3;
C_total = [Chsys Chdias];
C_total = C_total*1.3;

for J=1:50
    if J>1
        Vh(1)=Vh(801);
        Vo(1)=Vo(801);
        Va(1)=Va(801);
        Vc(1)=Vc(801);
        Vv(1)=Vv(801);
    end

for i=1:800
    
    %Problem 2%
    Po(i)=(Vo(i)-Vor)/Co;
    Pa(i)=(Va(i)-Var)/Ca;
    Pc(i)=(Vc(i)-Vcr)/Cc;
    Pv(i)=(Vv(i)-Vvr)/Cv;
    Ph(1)=100;
    Ph(i)=(Vh(i)-Vhr)/C_tot(i);
%       Ph(i+1) = (Vh_contained(i) - Vh_residual)/(C_total(i));
%       Po(i) = (Vo_contained(i) - Vo_residual)/Co;
%       Pa(i+1) = (Va_contained(i) - Va_residual)/Ca;
%       Pc(i) = (Vc_contained(i) - Vc_residual)/Cc;
%       Pv(i+1) = (Vv_contained(i) - Vv_residual)/Cv;
             
       if Ph(i)>Po(i)
             Q1(i)=(Ph(i)-Po(i))/Rho;
       else
             Q1(i) = 0;
       end
       Q3(i) = (Po(i)-Pa(i))/Roa;
       Q5(i) = (Pa(i)-Pc(i))/Rac;
       Q7(i) = (Pc(i)-Pv(i))/Rcv;
       if Pv(i) > Ph(i)
          Q9(i) = (Pv(i)-Ph(i))/Rvh;
       else 
          Q9(i) = 0;
       end
   Q2(i)=Q1(i)-Q3(i);
   Q4(i)=Q3(i)-Q5(i);
   Q6(i)=Q5(i)-Q7(i);
   Q8(i)=Q7(i)-Q9(i);
   if Pv(i)<Ph(i)
       Q10(i)=-Q1(i);
   else 
       Q10(i)=Q9(i);
   end

    Vh(i+1) = Vh(i)+ Q10(i)*dt;
    Vo(i+1) = Vo(i)+Q2(i)*dt;
    Va(i+1) = Va(i)+Q4(i)*dt;
    Vc(i+1) = Vc(i)+Q6(i)*dt;
    Vv(i+1) = Vv(i)+Q8(i)*dt;
    
    
      
end
end

% plot(time_total,Ph)
% title('Pressure of Left Ventricle vs time')
% xlabel('Time (sec)')
% ylabel('Pressure (mmHg)')
% 
% figure(2)
% plot(time_total,Vh(1:800))
% title('Volume of Left Ventricle vs time')
% xlabel('Time (sec)')
% ylabel('Volume (L)')

plot(Vh(1:800)*1.5,Ph*1.5)

title('Pressure-Volume Loop of Normal Heart')
xlabel('Volume(L)')
ylabel('Pressure (mmHg)')


%Problem 1%
Ph_systole(1) = 122;%mmhg
Po(1) = 100;
Pa(1) = 90;
Pc(1) = 40;
Pv(1) = 12;
Ph_diastole(1) = 10;
Rho =275;%mmhg*s/L
Rac =625;
Rcv =350;
Rvh =25;
Roa =125;
Chd =0.013;%L/mmHg
Chs =0.0005;
Co =0.00065;
Ca =0.002;
Cc = 0.006;
Cv = 0.167;
Vor = 0.085;
Var = .02+.17;
Vcr = .06;
Vvr = .06+.5+.09;
Vhr = 0;
Q = .08;
deltaT=.001;

%Problem 2
Vo(1)=.15;
Va(1)=.35+.05;
Vc(1)=.3;
Vv(1)=.3+2.5+.45;
Vh(1)=.1;



%Problem 3%
time_systole = .001:.001:.26;
time_diastole = .001:.001:.54;
time_total = .001:.001:.8;

%Problem 4%
Chsys = (Chd-Chs)*exp((-time_systole)/.03) + Chs ; 
Chdias= (Chs-Chd)*exp((-time_diastole)/.03) + Chd; 
C_total = [Chsys Chdias];

for J=1:50
    if J>1
        Vh(1)=Vh(801);
        Vo(1)=Vo(801);
        Va(1)=Va(801);
        Vc(1)=Vc(801);
        Vv(1)=Vv(801);
    end

for i=1:800
    
    %Problem 2%
    Po(i)=(Vo(i)-Vor)/Co;
    Pa(i)=(Va(i)-Var)/Ca;
    Pc(i)=(Vc(i)-Vcr)/Cc;
    Pv(i)=(Vv(i)-Vvr)/Cv;
    Ph(1)=100;
    Ph(i)=(Vh(i)-Vhr)/C_tot(i);
%       Ph(i+1) = (Vh_contained(i) - Vh_residual)/(C_total(i));
%       Po(i) = (Vo_contained(i) - Vo_residual)/Co;
%       Pa(i+1) = (Va_contained(i) - Va_residual)/Ca;
%       Pc(i) = (Vc_contained(i) - Vc_residual)/Cc;
%       Pv(i+1) = (Vv_contained(i) - Vv_residual)/Cv;
             
       if Ph(i)>Po(i)
             Q1(i)=(Ph(i)-Po(i))/Rho;
       else
             Q1(i) = 0;
       end
       Q3(i) = (Po(i)-Pa(i))/Roa;
       Q5(i) = (Pa(i)-Pc(i))/Rac;
       Q7(i) = (Pc(i)-Pv(i))/Rcv;
       if Pv(i) > Ph(i)
          Q9(i) = (Pv(i)-Ph(i))/Rvh;
       else 
          Q9(i) = 0;
       end
   Q2(i)=Q1(i)-Q3(i);
   Q4(i)=Q3(i)-Q5(i);
   Q6(i)=Q5(i)-Q7(i);
   Q8(i)=Q7(i)-Q9(i);
   if Pv(i)<Ph(i)
       Q10(i)=-Q1(i);
   else 
       Q10(i)=Q9(i);
   end

    Vh(i+1) = Vh(i)+ Q10(i)*dt;
    Vo(i+1) = Vo(i)+Q2(i)*dt;
    Va(i+1) = Va(i)+Q4(i)*dt;
    Vc(i+1) = Vc(i)+Q6(i)*dt;
    Vv(i+1) = Vv(i)+Q8(i)*dt;
    
    
      
end
end

% plot(time_total,Ph)
% title('Pressure of Left Ventricle vs time')
% xlabel('Time (sec)')
% ylabel('Pressure (mmHg)')
% 
% figure(2)
% plot(time_total,Vh(1:800))
% title('Volume of Left Ventricle vs time')
% xlabel('Time (sec)')
% ylabel('Volume (L)')

plot(Vh(1:800),Ph)

title('Pressure-Volume Loop of Normal Heart')
xlabel('Volume(L)')
ylabel('Pressure (mmHg)')