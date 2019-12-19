
displacement = [2.8 2.9 3.1 3.45 3.9 4.6 5.0 5.4]; %Displacement of rubber band in cm
volume = [0 30 60 90 120 150 180 210]; %Volumes of water added in mL

force = (volume*10^-6) * 9.8067 *  999.9; %Turns force into length in Newtons

area = 4.0000e-06 %Area of rubber band in m

stress = force/area %Stress of Rubber Band
strain = (displacement - 2.8)/2.8 %Strain of Rubber Band


    modulus = stress(4:8) / strain(4:8)


 %Young's modulus calculated for linear section of graph points 4-8


plot(displacement, force, 'marker', '*')
xlabel("Displacement (cm)")
ylabel("Force (N)")
title("Displacement of Rubber Band vs Force of Liquid")

