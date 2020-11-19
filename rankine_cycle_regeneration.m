function [eff]=rankine_cycle_regeneration(t1,p1,p2,p3)
t= linspace(1,t1,5000);

figure(1)
hold on
sl=zeros;
sv=zeros;
hl=zeros;
hv=zeros;
for i=1:length(t)
    sl(i)=XSteam('sL_T',t(i));
    sv(i)=XSteam('sV_T',t(i));
    hl(i)=XSteam('hL_T',t(i));
    hv(i)=XSteam('hV_T',t(i));
   
end 
plot(sl,t,'--r','linewidth',1)
plot(sv,t,'--r','linewidth',1)

h1 = XSteam('h_pT',p1,t1);
s1 = XSteam('s_pT',p1,t1);


s2=s1;
h2=XSteam('h_pS',p2,s2);
t2=XSteam('T_hs',h2,s2);

tsat3=XSteam('Tsat_p',p3);

hf3=XSteam('hL_p',p3);
sf3=XSteam('sL_p',p3);
hg3=XSteam('hV_p',p3);
sg3=XSteam('sV_p',p3);
sfg=sg3-sf3;                    %entropy of wet region
hfg= hg3-hf3;
if s2 < sg3                     % Checks to see if Point 2 is within the vapor dome
     x2=(s2-sf3)/sfg;           % calculates the new quality at this point
     h3=hf3+x2*hfg;             % calculates the new enthalpy     
else
     x2 = 1;                    % Quality is max 1
     h3 = x2*hg3;               % calculates the new enthalpy
end

s3=s2;


s4=XSteam('sL_p',p3);
hf4=XSteam('hL_p',p3);
sf4=XSteam('sL_p',p3);
hg4=XSteam('hV_p',p3);
sg4=XSteam('sV_p',p3);
sfg=sg4-sf4; 

h4= hf4;

tsat4=XSteam('Tsat_p',p3);
t4=XSteam('T_hs',h4,s4);

v4=XSteam('vL_p',p3);
p4=p3;
p5=p2;
h5=h4+v4*((p5-p4)*100);


s5=s4;
t5=t4;


s6=XSteam('sL_p',p2);
s7=s6;

p6=p1;
t6=XSteam('T_ps',p6,s6);
h6=XSteam('h_pS',p6,s6);
sg1=XSteam('sV_p',p1);
hg1=XSteam('hV_p',p1);
sf1=XSteam('sL_p',p1);
hf1=XSteam('hL_p',p1);
tsat1=XSteam('Tsat_p',p1);


tsat2=XSteam('Tsat_p',p2);
t6=tsat2;
sg2=XSteam('sV_p',p2);
hg2=XSteam('hV_p',p2);
sf2=XSteam('sL_p',p2);
hf2=XSteam('hL_p',p2);

t7=XSteam('T_ps',p1,sf2);
t5=XSteam('T_ps',p3,s5);


v7=XSteam('vL_p',p1);
h7=h6+v7*((p1-p2)*100);


m=(h6-h5)/(h2-h5);

hold on

plot([s1 s2],[t1 t2],'linewidth',2)
plot([s2 sg2],[t2 tsat2],'linewidth',2)
plot([sg2 sf2],[tsat2 tsat2],'linewidth',2)
plot([sf2 sf2],[t6 t7],'linewidth',2)
plot([s2 s3],[t2 tsat3],'linewidth',2)
plot([s3 s4],[tsat3 tsat3],'linewidth',2)
plot([s4 s5],[tsat3 t5],'linewidth',2)
plot([s5 s6],[t5 tsat2],'linewidth',2)
plot([s6 s7],[t6 t7],'linewidth',2)
plot([s7 sf1],[t7 tsat1],'linewidth',2)
plot([sf1 sg1],[tsat1 tsat1],'linewidth',2)
plot([sg1 s1],[tsat1 t1],'linewidth',2)
xlabel({'Specific Entropy [S] ','(kJ/kg K)'},'FontWeight','bold')
ylabel({'Temperature [T] ','(Deg C)'},'FontWeight','bold')

figure(2)
hold on

plot([s1 s2],[h1 h2],'linewidth',2)
plot([s2 sg2],[h2 hg2],'linewidth',2)
plot([sg2 sf2],[hg2 hf2],'linewidth',2)
plot([sf2 sf2],[h6 h7],'linewidth',2)
plot([s2 s3],[h2 h3],'linewidth',2)
plot([s3 s4],[h3 h4],'linewidth',2)
plot([s4 s5],[h4 h5],'linewidth',2)
plot([s5 s6],[h5 h6],'linewidth',2)
plot([s6 s7],[h6 h7],'linewidth',2)
plot([s7 sf1],[h7 hf1],'linewidth',2)
plot([sf1 sg1],[hf1 hg1],'linewidth',2)
plot([sg1 s1],[hg1 h1],'linewidth',2)
plot([sl sv],[hl hv],'--r','linewidth',1)
xlabel({'Specific Entropy [S] ','(kJ/kg K)'},'FontWeight','bold')
ylabel({'Specific Enthalpy [H] ' ,'(kJ/kg)'},'FontWeight','bold')


Wp = (1-m)*(h5-h4)+(h7-h6);
Wt = (h1-h2)+(1-m)*(h2-h3);
qin = h1-h7;
qout=(1-m)*h3-h4;
W=Wt-Wp;
eff = (W/qin);
bwr=Wp/Wt;


end