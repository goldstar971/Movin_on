L=.0000245; % stator inductance
R=.065; %rotor resistance
P=7; %number of magnetic pole pairs
KV=130; % motor KV rating
sf=35000; % switching frequency
PWM_EN=1;
flux_linkage=60/(sqrt(3)*P*KV*pi);