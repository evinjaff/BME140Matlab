%Problem 1%
Ph_Systole = 122;
Po = 100;
Pa = 90;
Pc = 40;
Pu = 12;
Ph_Diastole = 10;
Rho = 275;
Roa = 125;
Rac = 625;
Rcv = 350;
Rvh = 25;
Chd = .013;
Chs = .0005;
Co = .00065;
Ca = .002;
Cz = .006;
Cv = .167;
Vo = .085;
Va = .17 + .02;
Vc = .06;
Vv = .65;
Vh = 0;
Q = .08;

for i=1:800
    
end

%Problem 2%
Voi = .15;
Vai = .35 + .05;
Vci = .30;
Vvi = .3 + 2.5 + .45;
Vhi = .1;

%Problem 3%
time_systole = .001:.001:.26;
time_diastole = .001:.001:.54;
time_total = .001:.001:.8;

%Problem 4%
Chsys = (Chd-Chs)*exp((-time_systole)/.03) + Chs ; 
Chdias= (Chs-Chd)*exp((-time_diastole)/.03) + Chd; 
C_total = [Chsys Chdias];

%Plot for Problem 4%
plot(time_total,C_total);
title("Left Ventricle Compliance over one heartbeat");
xlabel("Time (s)");
ylabel("Compliance of Left Ventricle (L/mmHg)");
