function [eff]=rankine_cycle_reheat(t1,p1,p2,p3)
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

h3=XSteam('h_pT',p3,t1);
s3=XSteam('s_pT',p3,t1);
t3=t1;

s4=s3;
hf4=XSteam('hL_p',p3);
sf4=XSteam('sL_p',p3);
hg4=XSteam('hV_p',p3);
sg4=XSteam('sV_p',p3);
sfg=sg4-sf4;                    
hfg= hg4-hf4;
if s4<sg4
    x4=(s4-sf4)/sfg;
    h4=hf4+x4*hfg;
else
    x4=1;
    h4 = x4*hg4;
end    

tsat4=XSteam('Tsat_p',p3);
t4=XSteam('T_hs',h4,s4);

h5=XSteam('hL_p',p3);
s5=XSteam('sL_p',p3);
t5=t4;


s6=s5;
p6=p1;
t6=XSteam('T_ps',p6,s6);
h6=XSteam('h_pS',p6,s6);
sg1=XSteam('sV_p',p1);
hg1=XSteam('hV_p',p1);
sf1=XSteam('sL_p',p1);
hf1=XSteam('hL_p',p1);
tsat1=XSteam('Tsat_p',p1);

hold on

plot([s1 s2],[t1 t2],'linewidth',2)
plot([s2 s3],[t2 t3],'linewidth',2)
plot([s3 s4],[t3 t4],'linewidth',2)
plot([s4 sg4],[t4 tsat4],'linewidth',2)
plot([sg4 s5],[tsat4 t5],'linewidth',2)
plot([s5 s6],[t5 t6],'linewidth',2)
plot([s6 sf1],[t6 tsat1],'linewidth',2)
plot([sf1 sg1],[tsat1 tsat1],'linewidth',2)
plot([sg1 s1],[tsat1 t1],'linewidth',2)
xlabel({'Specific Entropy [S] ','(kJ/kg K)'},'FontWeight','bold')
ylabel({'Temperature [T] ','(Deg C)'},'FontWeight','bold')

figure(2)
hold on

plot([s1 s2],[h1 h2],'linewidth',2)
plot([s2 s3],[h2 h3],'linewidth',2)
plot([s3 s4],[h3 h4],'linewidth',2)
plot([s4 s5],[h4 h5],'linewidth',2)
plot([s5 s6],[h5 h6],'linewidth',2)
plot([s6 sf1],[h6 hf1],'linewidth',2)
plot([sf1 sg1],[hf1 hg1],'linewidth',2)
plot([sg1 s1],[hg1 h1],'linewidth',2)
plot([sl sv],[hl hv],'--r','linewidth',1)
xlabel({'Specific Entropy [S] ','(kJ/kg K)'},'FontWeight','bold')
ylabel({'Specific Enthalpy [H] ' ,'(kJ/kg)'},'FontWeight','bold')


Wp = h6 - h5;
Wt = h1 - h2 + h3 - h4;
qin = h1 - h6 + h3 - h2;
eff = (Wt - Wp)*100/qin;
bwr=Wp/Wt;




end