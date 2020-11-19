classdef rankine_app_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                       matlab.ui.Figure
        RankineCycleSimulatorLabel     matlab.ui.control.Label
        PressureatTurbineInletEditFieldLabel  matlab.ui.control.Label
        PressureatTurbineInletEditField  matlab.ui.control.NumericEditField
        TemperatureatTurbineInletEditFieldLabel  matlab.ui.control.Label
        TemperatureatTurbineInletEditField  matlab.ui.control.NumericEditField
        PressureatCondenserInletEditFieldLabel  matlab.ui.control.Label
        PressureatCondenserInletEditField  matlab.ui.control.NumericEditField
        StateVariablesPanel            matlab.ui.container.Panel
        GridLayout                     matlab.ui.container.GridLayout
        P1EditFieldLabel               matlab.ui.control.Label
        P1                             matlab.ui.control.NumericEditField
        P2EditFieldLabel               matlab.ui.control.Label
        P2                             matlab.ui.control.NumericEditField
        P3EditFieldLabel               matlab.ui.control.Label
        P3                             matlab.ui.control.NumericEditField
        P4EditFieldLabel               matlab.ui.control.Label
        P4                             matlab.ui.control.NumericEditField
        P5EditFieldLabel               matlab.ui.control.Label
        P5                             matlab.ui.control.NumericEditField
        P6EditFieldLabel               matlab.ui.control.Label
        P6                             matlab.ui.control.NumericEditField
        P7EditFieldLabel               matlab.ui.control.Label
        P7                             matlab.ui.control.NumericEditField
        T1Label                        matlab.ui.control.Label
        T1                             matlab.ui.control.NumericEditField
        T2Label                        matlab.ui.control.Label
        T2                             matlab.ui.control.NumericEditField
        T3Label                        matlab.ui.control.Label
        T3                             matlab.ui.control.NumericEditField
        T4Label                        matlab.ui.control.Label
        T4                             matlab.ui.control.NumericEditField
        T5Label                        matlab.ui.control.Label
        T5                             matlab.ui.control.NumericEditField
        T6Label                        matlab.ui.control.Label
        T6                             matlab.ui.control.NumericEditField
        T7Label                        matlab.ui.control.Label
        T7                             matlab.ui.control.NumericEditField
        H1EditFieldLabel               matlab.ui.control.Label
        H1                             matlab.ui.control.NumericEditField
        H2EditFieldLabel               matlab.ui.control.Label
        H2                             matlab.ui.control.NumericEditField
        H3EditFieldLabel               matlab.ui.control.Label
        H3                             matlab.ui.control.NumericEditField
        H4EditFieldLabel               matlab.ui.control.Label
        H4                             matlab.ui.control.NumericEditField
        H5EditFieldLabel               matlab.ui.control.Label
        H5                             matlab.ui.control.NumericEditField
        H6EditFieldLabel               matlab.ui.control.Label
        H6                             matlab.ui.control.NumericEditField
        H7EditFieldLabel               matlab.ui.control.Label
        H7                             matlab.ui.control.NumericEditField
        S1EditFieldLabel               matlab.ui.control.Label
        S1                             matlab.ui.control.NumericEditField
        S2EditFieldLabel               matlab.ui.control.Label
        S2                             matlab.ui.control.NumericEditField
        S3EditFieldLabel               matlab.ui.control.Label
        S3                             matlab.ui.control.NumericEditField
        S4EditFieldLabel               matlab.ui.control.Label
        S4                             matlab.ui.control.NumericEditField
        S5EditFieldLabel               matlab.ui.control.Label
        S5                             matlab.ui.control.NumericEditField
        S6EditFieldLabel               matlab.ui.control.Label
        S6                             matlab.ui.control.NumericEditField
        S7EditFieldLabel               matlab.ui.control.Label
        S7                             matlab.ui.control.NumericEditField
        UIAxes                         matlab.ui.control.UIAxes
        UIAxes_2                       matlab.ui.control.UIAxes
        SimulateButton                 matlab.ui.control.Button
        EfficiencyandWorkPanel         matlab.ui.container.Panel
        HeatInputEditFieldLabel        matlab.ui.control.Label
        HeatInputEditField             matlab.ui.control.NumericEditField
        HeatRejectionEditFieldLabel    matlab.ui.control.Label
        HeatRejectionEditField         matlab.ui.control.NumericEditField
        PumpWorkEditFieldLabel         matlab.ui.control.Label
        PumpWorkEditField              matlab.ui.control.NumericEditField
        TurbineWorkEditFieldLabel      matlab.ui.control.Label
        TurbineWorkEditField           matlab.ui.control.NumericEditField
        NetWorkEditFieldLabel          matlab.ui.control.Label
        NetWorkEditField               matlab.ui.control.NumericEditField
        EfficiencyEditFieldLabel       matlab.ui.control.Label
        EfficiencyEditField            matlab.ui.control.NumericEditField
        BackWorkRatioEditFieldLabel    matlab.ui.control.Label
        BackWorkRatioEditField         matlab.ui.control.NumericEditField
        DrynessFractionEditFieldLabel  matlab.ui.control.Label
        DrynessFractionEditField       matlab.ui.control.NumericEditField
        PressureinbarLabel             matlab.ui.control.Label
        TemperatureindegCLabel         matlab.ui.control.Label
        EnthalpyinkJkgLabel            matlab.ui.control.Label
        EntropyinkJkgKLabel            matlab.ui.control.Label
        HeatinkJkgLabel                matlab.ui.control.Label
        WorkinkJkgLabel                matlab.ui.control.Label
        Label                          matlab.ui.control.Label
        SelectTypeDropDownLabel        matlab.ui.control.Label
        rankinedropdown                matlab.ui.control.DropDown
        PressureatReheatFeedwaterInletEditFieldLabel  matlab.ui.control.Label
        PressureatReheatFeedwaterInletEditField  matlab.ui.control.NumericEditField
        ResetAllButton                 matlab.ui.control.Button
    end

    
    methods (Access = private)
        
    end
    
    methods (Access = public)
        
        
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: SimulateButton
        function SimulateButtonPushed(app, event)
           
            if strcmp(app.rankinedropdown.Value,'Simple Ideal Rankine Cycle')
                
                p1=app.PressureatTurbineInletEditField.Value;
                t1=app.TemperatureatTurbineInletEditField.Value;
                p2=app.PressureatCondenserInletEditField.Value;
                
               
                h1=XSteam('h_pT',p1,t1); 
                s1=XSteam('s_pT',p1,t1);
                tsat1=XSteam('Tsat_p',p1);    
                hg1=XSteam('hV_p',p1);
                hf1=XSteam('hL_p',p1);
                sg1=XSteam('sV_p',p1);
                sf1=XSteam('sL_p',p1);
    
                s2=s1;
                hf2=XSteam('hL_p',p2);
                sf3=XSteam('sL_p',p2);
                hg2=XSteam('hV_p',p2);
                sg2=XSteam('sV_p',p2);
                sfg=sg2-sf3;                    
                hfg= hg2-hf2;
                if s2 < sg2                  
                     x2=(s2-sf3)/sfg;           
                     h2=hf2+x2*hfg;                  
                else
                     x2 = 1;                    
                     h2 = x2*hg2;               
                end
                t2=XSteam('T_ps',p2,s2);
                tsat2=XSteam('Tsat_p',p2);      
    
                p3=p2;
                s3=sf3;
                h3=hf2;
    
                s4=s3;
                t3=tsat2;
    
                p4=p1;
                h4=XSteam('h_ps',p4,s4);
                t4=XSteam('T_ps',p4,s4);
                
                t= linspace(1,t1,5000);
    
    
              
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
                
                hold(app.UIAxes,'on')
                plot([s1 s2],[t1 t2],'linewidth',2,'color','k','Parent',app.UIAxes)
                plot([s2 sg2],[t2 tsat2],'linewidth',2,'color','k','Parent',app.UIAxes)
                plot([sg2 s3],[tsat2 t3],'linewidth',2,'color','k','Parent',app.UIAxes)
                plot([s3 s4],[t3 t4],'linewidth',2,'color','k','Parent',app.UIAxes)
                plot([s4 sf1],[t4 tsat1],'linewidth',2,'color','k','Parent',app.UIAxes)
                plot([sf1 sg1],[tsat1 tsat1],'linewidth',2,'color','k','Parent',app.UIAxes)
                plot([sg1 s1],[tsat1 t1],'linewidth',2,'color','k','Parent',app.UIAxes)
                plot(sl,t,'--r','linewidth',1,'Parent',app.UIAxes)
                plot(sv,t,'--r','linewidth',1,'Parent',app.UIAxes)
                
                
               
                hold(app.UIAxes_2,'on')
                plot([s1 s2],[h1 h2],'linewidth',2,'color','k','Parent',app.UIAxes_2)
                plot([s2 sg2],[h2 hg2],'linewidth',2,'color','k','Parent',app.UIAxes_2)
                plot([sg2 s3],[hg2 h3],'linewidth',2,'color','k','Parent',app.UIAxes_2)
                plot([s3 s4],[h3 h4],'linewidth',2,'color','k','Parent',app.UIAxes_2)
                plot([s4 sf1],[h4 hf1],'linewidth',2,'color','k','Parent',app.UIAxes_2)
                plot([sf1 sg1],[hf1 hg1],'linewidth',2,'color','k','Parent',app.UIAxes_2)
                plot([sg1 s1],[hg1 h1],'linewidth',2,'color','k','Parent',app.UIAxes_2)
                plot([sl sv],[hl hv],'--r','linewidth',1,'Parent',app.UIAxes_2)
                
                
                Wt=h1-h2;
                Wp=h4-h3;
                W=Wt-Wp;
                qin=h1-h4;
                qout=h2-h3;
                eff=W*100/qin;
                bwr=qin/qout;
                
                app.BackWorkRatioEditField.Value=bwr;
                app.HeatInputEditField.Value=qin;
                app.HeatRejectionEditField.Value=qout;
                app.EfficiencyEditField.Value=eff;
                app.TurbineWorkEditField.Value=Wt;
                app.PumpWorkEditField.Value=Wp;
                app.DrynessFractionEditField.Value=x2;
                app.NetWorkEditField.Value=W;
                
                app.P1.Value=p1;
                app.P2.Value=p2;
                app.P3.Value=p3;
                app.P4.Value=p4;
                
                app.T1.Value=t1;
                app.T2.Value=t2;
                app.T3.Value=t3;
                app.T4.Value=t4;
                
                app.H1.Value=h1;
                app.H2.Value=h2;
                app.H3.Value=h3;
                app.H4.Value=h4;
                
                app.S1.Value=s1;
                app.S2.Value=s2;
                app.S3.Value=s3;
                app.S4.Value=s4;
                
               
                
            elseif strcmp(app.rankinedropdown.Value,'Ideal Rankine Cycle with Regeneration')
                p1=app.PressureatTurbineInletEditField.Value;
                t1=app.TemperatureatTurbineInletEditField.Value;
                p3=app.PressureatCondenserInletEditField.Value;
                p2=app.PressureatReheatFeedwaterInletEditField.Value;
                t= linspace(1,t1,5000);
    
               
            
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
                hold(app.UIAxes,'on')
                plot(sl,t,'--r','linewidth',1,'Parent',app.UIAxes)
                plot(sv,t,'--r','linewidth',1,'Parent',app.UIAxes)
                
                h1 = XSteam('h_pT',p1,t1);
                s1 = XSteam('s_pT',p1,t1);
                
                
                s2=s1;
                h2=XSteam('h_pS',p2,s2);
                t2=XSteam('T_hs',h2,s2);
                t3=XSteam('T_ps',p3,s2);
                
                app.S2.Value=s2;
                app.H2.Value=h2;
                app.T2.Value=t2;
                
                tsat3=XSteam('Tsat_p',p3);
                
                hf3=XSteam('hL_p',p3);
                sf3=XSteam('sL_p',p3);
                hg3=XSteam('hV_p',p3);
                sg3=XSteam('sV_p',p3);
                sfg=sg3-sf3;                   
                hfg= hg3-hf3;
                if s2 < sg3                     
                     x2=(s2-sf3)/sfg;          
                     h3=hf3+x2*hfg;                  
                else
                     x2 = 1;                    
                     h3 = x2*hg3;               
                end
                
                s3=s2;
                app.S3.Value=s3;
                
                
                s4=XSteam('sL_p',p3);
                hf4=XSteam('hL_p',p3);
                sf4=XSteam('sL_p',p3);
                hg4=XSteam('hV_p',p3);
                sg4=XSteam('sV_p',p3);
                sfg=sg4-sf4; 
                h4= hf4;
                tsat4=XSteam('Tsat_p',p3);
                t4=XSteam('T_hs',h4,s4);
                
                app.S4.Value=s4;
                app.H4.Value=h4;
                app.T4.Value=t4;
                
                v4=XSteam('vL_p',p3);
                p4=p3;
                p5=p2;
                h5=h4+v4*((p5-p4)*100);
                app.H5.Value=h5;
                app.P4.Value=p4;
                app.P5.Value=p5;
                app.H5.Value=h5;
                
                
                s5=s4;
                t5=t4;
                app.S5.Value=s5;
                app.T5.Value=t5;
                
                
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
                app.S6.Value=s6;
                app.S7.Value=s7;
                app.S6.Value=s6;
                app.T6.Value=t6;
                app.H6.Value=h6;
              
                
                
                tsat2=XSteam('Tsat_p',p2);
                t6=tsat2;
                sg2=XSteam('sV_p',p2);
                hg2=XSteam('hV_p',p2);
                sf2=XSteam('sL_p',p2);
                hf2=XSteam('hL_p',p2);
                
                t7=XSteam('T_ps',p1,sf2);
                app.T7.Value=t7;
               
                t5=XSteam('T_ps',p3,s5);
                
                
                v7=XSteam('vL_p',p1);
                h7=h6+v7*((p1-p2)*100);
                p7=XSteam('p_hs',h7,sf2);
            
                
                m=(h6-h5)/(h2-h5);
                
                hold(app.UIAxes,'on')
                plot([s1 s2],[t1 t2],'linewidth',2,'Parent',app.UIAxes,'color','k')
                plot([s2 sg2],[t2 tsat2],'linewidth',2,'Parent',app.UIAxes,'color','k')
                plot([sg2 sf2],[tsat2 tsat2],'linewidth',2,'Parent',app.UIAxes,'color','k')
                plot([sf2 sf2],[t6 t7],'linewidth',2,'Parent',app.UIAxes,'color','k')
                plot([s2 s3],[t2 tsat3],'linewidth',2,'Parent',app.UIAxes,'color','k')
                plot([s3 s4],[tsat3 tsat3],'linewidth',2,'Parent',app.UIAxes,'color','k')
                plot([s4 s5],[tsat3 t5],'linewidth',2,'Parent',app.UIAxes,'color','k')
                plot([s5 s6],[t5 tsat2],'linewidth',2,'Parent',app.UIAxes,'color','k')
                plot([s6 s7],[t6 t7],'linewidth',2,'Parent',app.UIAxes,'color','k')
                plot([s7 sf1],[t7 tsat1],'linewidth',2,'Parent',app.UIAxes,'color','k')
                plot([sf1 sg1],[tsat1 tsat1],'linewidth',2,'Parent',app.UIAxes,'color','k')
                plot([sg1 s1],[tsat1 t1],'linewidth',2,'Parent',app.UIAxes,'color','k')
               
                
                
                hold(app.UIAxes_2,'on')
                
                plot([s1 s2],[h1 h2],'linewidth',2,'Parent',app.UIAxes_2,'color','k')
                plot([s2 sg2],[h2 hg2],'linewidth',2,'Parent',app.UIAxes_2,'color','k')
                plot([sg2 sf2],[hg2 hf2],'linewidth',2,'Parent',app.UIAxes_2,'color','k')
                plot([sf2 sf2],[h6 h7],'linewidth',2,'Parent',app.UIAxes_2,'color','k')
                plot([s2 s3],[h2 h3],'linewidth',2,'Parent',app.UIAxes_2,'color','k')
                plot([s3 s4],[h3 h4],'linewidth',2,'Parent',app.UIAxes_2,'color','k')
                plot([s4 s5],[h4 h5],'linewidth',2,'Parent',app.UIAxes_2,'color','k')
                plot([s5 s6],[h5 h6],'linewidth',2,'Parent',app.UIAxes_2,'color','k')
                plot([s6 s7],[h6 h7],'linewidth',2,'Parent',app.UIAxes_2,'color','k')
                plot([s7 sf1],[h7 hf1],'linewidth',2,'Parent',app.UIAxes_2,'color','k')
                plot([sf1 sg1],[hf1 hg1],'linewidth',2,'Parent',app.UIAxes_2,'color','k')
                plot([sg1 s1],[hg1 h1],'linewidth',2,'Parent',app.UIAxes_2,'color','k')
                plot([sl sv],[hl hv],'--r','linewidth',1,'Parent',app.UIAxes_2)
                
                Wp = (1-m)*(h5-h4)+(h7-h6);
                Wt = (h1-h2)+(1-m)*(h2-h3);
                qin = h1-h7;
                qout=(1-m)*h3-h4;
                W=Wt-Wp;
                eff = (W/qin)*100;
                bwr=Wp/Wt;
                
                app.BackWorkRatioEditField.Value=bwr;
                app.HeatInputEditField.Value=qin;
                app.HeatRejectionEditField.Value=qout;
                app.EfficiencyEditField.Value=eff;
                app.TurbineWorkEditField.Value=Wt;
                app.PumpWorkEditField.Value=Wp;
                app.DrynessFractionEditField.Value=x2;
                app.NetWorkEditField.Value=W;
              
                
               
                
                app.P1.Value=p1;
                app.T1.Value=t1;
                app.H1.Value=h1;
                app.S1.Value=s1;
                app.P2.Value=p2;
                app.T2.Value=t2;
                app.H2.Value=h2;
                app.S2.Value=s2;
                app.P3.Value=p3;
                app.T3.Value=t3;
                app.H3.Value=h3;
                app.S3.Value=s3;
                app.P4.Value=p4;
                app.T4.Value=t4;
                app.H4.Value=h4;
                app.S4.Value=s4;
                app.P5.Value=p5;
                app.T5.Value=t5;
                app.H5.Value=h5;
                app.S5.Value=s5;
                app.P6.Value=p6;
                app.T6.Value=t6;
                app.H6.Value=h6; 
                app.S6.Value=s6;
                app.P7.Value=p7;
                
                app.H7.Value=h7;
                app.S7.Value=s7;
                
               
                             
                
                
               
               
              
               
                
                
                
                
                
                
             
                
                
                
                
                
                
              
                
                
                
            elseif strcmp(app.rankinedropdown.Value,'Ideal Rankine Cycle with Reheat')
                p1=app.PressureatTurbineInletEditField.Value;
                t1=app.TemperatureatTurbineInletEditField.Value;
                p3=app.PressureatCondenserInletEditField.Value;
                p2=app.PressureatReheatFeedwaterInletEditField.Value;
                t= linspace(1,t1,5000);
                
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
                
                hold(app.UIAxes,'on')
                plot(sl,t,'--r','linewidth',1,'Parent',app.UIAxes)
                plot(sv,t,'--r','linewidth',1,'Parent',app.UIAxes)
                
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
                s7=sf1;
                t7= tsat1;
                
                hold(app.UIAxes,'on')
                plot([s1 s2],[t1 t2],'linewidth',2,'Parent',app.UIAxes,'color','k')
                plot([s2 s3],[t2 t3],'linewidth',2,'Parent',app.UIAxes,'color','k')
                plot([s3 s4],[t3 t4],'linewidth',2,'Parent',app.UIAxes,'color','k')
                plot([s4 sg4],[t4 tsat4],'linewidth',2,'Parent',app.UIAxes,'color','k')
                plot([sg4 s5],[tsat4 t5],'linewidth',2,'Parent',app.UIAxes,'color','k')
                plot([s5 s6],[t5 t6],'linewidth',2,'Parent',app.UIAxes,'color','k')
                plot([s6 sf1],[t6 tsat1],'linewidth',2,'Parent',app.UIAxes,'color','k')
                plot([sf1 sg1],[tsat1 tsat1],'linewidth',2,'Parent',app.UIAxes,'color','k')
                plot([sg1 s1],[tsat1 t1],'linewidth',2,'Parent',app.UIAxes,'color','k')
                
                hold(app.UIAxes_2,'on')
                plot([s1 s2],[h1 h2],'linewidth',2,'Parent',app.UIAxes_2,'color','k')
                plot([s2 s3],[h2 h3],'linewidth',2,'Parent',app.UIAxes_2,'color','k')
                plot([s3 s4],[h3 h4],'linewidth',2,'Parent',app.UIAxes_2,'color','k')
                plot([s4 s5],[h4 h5],'linewidth',2,'Parent',app.UIAxes_2,'color','k')
                plot([s5 s6],[h5 h6],'linewidth',2,'Parent',app.UIAxes_2,'color','k')
                plot([s6 sf1],[h6 hf1],'linewidth',2,'Parent',app.UIAxes_2,'color','k')
                plot([sf1 sg1],[hf1 hg1],'linewidth',2,'Parent',app.UIAxes_2,'color','k')
                plot([sg1 s1],[hg1 h1],'linewidth',2,'Parent',app.UIAxes_2,'color','k')
                plot([sl sv],[hl hv],'--r','linewidth',1,'Parent',app.UIAxes_2)
                
                % Efficiency Calculations
                Wp = h6 - h5;
                Wt = h1 - h2 + h3 - h4;
                qin = h1 - h6 + h3 - h2;
                qout=h4-h5;
                W=Wt-Wp;
                eff = (Wt - Wp)*100/qin;
                bwr=Wp/Wt;
                
                app.BackWorkRatioEditField.Value=bwr;
                app.HeatInputEditField.Value=qin;
                app.HeatRejectionEditField.Value=qout;
                app.EfficiencyEditField.Value=eff;
                app.TurbineWorkEditField.Value=Wt;
                app.PumpWorkEditField.Value=Wp;
                app.DrynessFractionEditField.Value=x4;
                app.NetWorkEditField.Value=W;
                
                app.P1.Value=p1;
                app.P2.Value=p2;
                app.P3.Value=p3;
                app.P4.Value=p3;
                app.P5.Value=p3;
                app.P6.Value=p6;
                
                             
                app.T1.Value=t1;
                app.T2.Value=t2;
                app.T3.Value=t3;
                app.T4.Value=t4;
                app.T5.Value=t5;
                app.T6.Value=t6;
              
                
                app.H1.Value=h1;
                app.H2.Value=h2;
                app.H3.Value=h3;
                app.H4.Value=h4;
                app.H5.Value=h5;
                app.H6.Value=h6;
             
                
                app.S1.Value=s1;
                app.S2.Value=s2;
                app.S3.Value=s3;
                app.S4.Value=s4;
                app.S5.Value=s5;
                app.S6.Value=s6;
                



                
                
            end
            
           

        end

        % Button pushed function: ResetAllButton
        function ResetAllButtonPushed(app, event)
            app.UIFigure.Visible='off';          
            rankine_app();  
            close(app.UIFigure)
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 975 743];
            app.UIFigure.Name = 'MATLAB App';

            % Create RankineCycleSimulatorLabel
            app.RankineCycleSimulatorLabel = uilabel(app.UIFigure);
            app.RankineCycleSimulatorLabel.BackgroundColor = [0 0 0];
            app.RankineCycleSimulatorLabel.HorizontalAlignment = 'center';
            app.RankineCycleSimulatorLabel.FontSize = 22;
            app.RankineCycleSimulatorLabel.FontWeight = 'bold';
            app.RankineCycleSimulatorLabel.FontColor = [1 1 1];
            app.RankineCycleSimulatorLabel.Position = [2 717 975 27];
            app.RankineCycleSimulatorLabel.Text = 'Rankine Cycle Simulator';

            % Create PressureatTurbineInletEditFieldLabel
            app.PressureatTurbineInletEditFieldLabel = uilabel(app.UIFigure);
            app.PressureatTurbineInletEditFieldLabel.HorizontalAlignment = 'right';
            app.PressureatTurbineInletEditFieldLabel.Position = [144 593 136 22];
            app.PressureatTurbineInletEditFieldLabel.Text = 'Pressure at Turbine Inlet';

            % Create PressureatTurbineInletEditField
            app.PressureatTurbineInletEditField = uieditfield(app.UIFigure, 'numeric');
            app.PressureatTurbineInletEditField.Position = [295 593 104 22];

            % Create TemperatureatTurbineInletEditFieldLabel
            app.TemperatureatTurbineInletEditFieldLabel = uilabel(app.UIFigure);
            app.TemperatureatTurbineInletEditFieldLabel.HorizontalAlignment = 'right';
            app.TemperatureatTurbineInletEditFieldLabel.Position = [121 563 159 22];
            app.TemperatureatTurbineInletEditFieldLabel.Text = 'Temperature at Turbine Inlet ';

            % Create TemperatureatTurbineInletEditField
            app.TemperatureatTurbineInletEditField = uieditfield(app.UIFigure, 'numeric');
            app.TemperatureatTurbineInletEditField.Position = [295 563 104 22];

            % Create PressureatCondenserInletEditFieldLabel
            app.PressureatCondenserInletEditFieldLabel = uilabel(app.UIFigure);
            app.PressureatCondenserInletEditFieldLabel.HorizontalAlignment = 'right';
            app.PressureatCondenserInletEditFieldLabel.Position = [125 533 155 22];
            app.PressureatCondenserInletEditFieldLabel.Text = 'Pressure at Condenser Inlet';

            % Create PressureatCondenserInletEditField
            app.PressureatCondenserInletEditField = uieditfield(app.UIFigure, 'numeric');
            app.PressureatCondenserInletEditField.Position = [295 533 104 22];

            % Create StateVariablesPanel
            app.StateVariablesPanel = uipanel(app.UIFigure);
            app.StateVariablesPanel.TitlePosition = 'centertop';
            app.StateVariablesPanel.Title = 'State Variables';
            app.StateVariablesPanel.Position = [24 27 284 414];

            % Create GridLayout
            app.GridLayout = uigridlayout(app.StateVariablesPanel);
            app.GridLayout.ColumnWidth = {25, '3.33x', 25, '3.33x'};
            app.GridLayout.RowHeight = {22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22};
            app.GridLayout.RowSpacing = 5.42989145914714;
            app.GridLayout.Padding = [10 5.42989145914714 10 5.42989145914714];

            % Create P1EditFieldLabel
            app.P1EditFieldLabel = uilabel(app.GridLayout);
            app.P1EditFieldLabel.HorizontalAlignment = 'right';
            app.P1EditFieldLabel.Layout.Row = 1;
            app.P1EditFieldLabel.Layout.Column = 1;
            app.P1EditFieldLabel.Text = 'P1';

            % Create P1
            app.P1 = uieditfield(app.GridLayout, 'numeric');
            app.P1.Layout.Row = 1;
            app.P1.Layout.Column = 2;

            % Create P2EditFieldLabel
            app.P2EditFieldLabel = uilabel(app.GridLayout);
            app.P2EditFieldLabel.HorizontalAlignment = 'right';
            app.P2EditFieldLabel.Layout.Row = 2;
            app.P2EditFieldLabel.Layout.Column = 1;
            app.P2EditFieldLabel.Text = 'P2';

            % Create P2
            app.P2 = uieditfield(app.GridLayout, 'numeric');
            app.P2.Layout.Row = 2;
            app.P2.Layout.Column = 2;

            % Create P3EditFieldLabel
            app.P3EditFieldLabel = uilabel(app.GridLayout);
            app.P3EditFieldLabel.HorizontalAlignment = 'right';
            app.P3EditFieldLabel.Layout.Row = 3;
            app.P3EditFieldLabel.Layout.Column = 1;
            app.P3EditFieldLabel.Text = 'P3';

            % Create P3
            app.P3 = uieditfield(app.GridLayout, 'numeric');
            app.P3.Layout.Row = 3;
            app.P3.Layout.Column = 2;

            % Create P4EditFieldLabel
            app.P4EditFieldLabel = uilabel(app.GridLayout);
            app.P4EditFieldLabel.HorizontalAlignment = 'right';
            app.P4EditFieldLabel.Layout.Row = 4;
            app.P4EditFieldLabel.Layout.Column = 1;
            app.P4EditFieldLabel.Text = 'P4';

            % Create P4
            app.P4 = uieditfield(app.GridLayout, 'numeric');
            app.P4.Layout.Row = 4;
            app.P4.Layout.Column = 2;

            % Create P5EditFieldLabel
            app.P5EditFieldLabel = uilabel(app.GridLayout);
            app.P5EditFieldLabel.HorizontalAlignment = 'right';
            app.P5EditFieldLabel.Layout.Row = 5;
            app.P5EditFieldLabel.Layout.Column = 1;
            app.P5EditFieldLabel.Text = 'P5';

            % Create P5
            app.P5 = uieditfield(app.GridLayout, 'numeric');
            app.P5.Layout.Row = 5;
            app.P5.Layout.Column = 2;

            % Create P6EditFieldLabel
            app.P6EditFieldLabel = uilabel(app.GridLayout);
            app.P6EditFieldLabel.HorizontalAlignment = 'right';
            app.P6EditFieldLabel.Layout.Row = 6;
            app.P6EditFieldLabel.Layout.Column = 1;
            app.P6EditFieldLabel.Text = 'P6';

            % Create P6
            app.P6 = uieditfield(app.GridLayout, 'numeric');
            app.P6.Layout.Row = 6;
            app.P6.Layout.Column = 2;

            % Create P7EditFieldLabel
            app.P7EditFieldLabel = uilabel(app.GridLayout);
            app.P7EditFieldLabel.HorizontalAlignment = 'right';
            app.P7EditFieldLabel.Layout.Row = 7;
            app.P7EditFieldLabel.Layout.Column = 1;
            app.P7EditFieldLabel.Text = 'P7';

            % Create P7
            app.P7 = uieditfield(app.GridLayout, 'numeric');
            app.P7.Layout.Row = 7;
            app.P7.Layout.Column = 2;

            % Create T1Label
            app.T1Label = uilabel(app.GridLayout);
            app.T1Label.HorizontalAlignment = 'right';
            app.T1Label.Layout.Row = 1;
            app.T1Label.Layout.Column = 3;
            app.T1Label.Text = 'T1';

            % Create T1
            app.T1 = uieditfield(app.GridLayout, 'numeric');
            app.T1.Layout.Row = 1;
            app.T1.Layout.Column = 4;

            % Create T2Label
            app.T2Label = uilabel(app.GridLayout);
            app.T2Label.HorizontalAlignment = 'right';
            app.T2Label.Layout.Row = 2;
            app.T2Label.Layout.Column = 3;
            app.T2Label.Text = 'T2';

            % Create T2
            app.T2 = uieditfield(app.GridLayout, 'numeric');
            app.T2.Layout.Row = 2;
            app.T2.Layout.Column = 4;

            % Create T3Label
            app.T3Label = uilabel(app.GridLayout);
            app.T3Label.HorizontalAlignment = 'right';
            app.T3Label.Layout.Row = 3;
            app.T3Label.Layout.Column = 3;
            app.T3Label.Text = 'T3';

            % Create T3
            app.T3 = uieditfield(app.GridLayout, 'numeric');
            app.T3.Layout.Row = 3;
            app.T3.Layout.Column = 4;

            % Create T4Label
            app.T4Label = uilabel(app.GridLayout);
            app.T4Label.HorizontalAlignment = 'right';
            app.T4Label.Layout.Row = 4;
            app.T4Label.Layout.Column = 3;
            app.T4Label.Text = 'T4';

            % Create T4
            app.T4 = uieditfield(app.GridLayout, 'numeric');
            app.T4.Layout.Row = 4;
            app.T4.Layout.Column = 4;

            % Create T5Label
            app.T5Label = uilabel(app.GridLayout);
            app.T5Label.HorizontalAlignment = 'right';
            app.T5Label.Layout.Row = 5;
            app.T5Label.Layout.Column = 3;
            app.T5Label.Text = 'T5';

            % Create T5
            app.T5 = uieditfield(app.GridLayout, 'numeric');
            app.T5.Layout.Row = 5;
            app.T5.Layout.Column = 4;

            % Create T6Label
            app.T6Label = uilabel(app.GridLayout);
            app.T6Label.HorizontalAlignment = 'right';
            app.T6Label.Layout.Row = 6;
            app.T6Label.Layout.Column = 3;
            app.T6Label.Text = 'T6';

            % Create T6
            app.T6 = uieditfield(app.GridLayout, 'numeric');
            app.T6.Layout.Row = 6;
            app.T6.Layout.Column = 4;

            % Create T7Label
            app.T7Label = uilabel(app.GridLayout);
            app.T7Label.HorizontalAlignment = 'right';
            app.T7Label.Layout.Row = 7;
            app.T7Label.Layout.Column = 3;
            app.T7Label.Text = 'T7';

            % Create T7
            app.T7 = uieditfield(app.GridLayout, 'numeric');
            app.T7.Layout.Row = 7;
            app.T7.Layout.Column = 4;

            % Create H1EditFieldLabel
            app.H1EditFieldLabel = uilabel(app.GridLayout);
            app.H1EditFieldLabel.HorizontalAlignment = 'right';
            app.H1EditFieldLabel.Layout.Row = 8;
            app.H1EditFieldLabel.Layout.Column = 1;
            app.H1EditFieldLabel.Text = 'H1';

            % Create H1
            app.H1 = uieditfield(app.GridLayout, 'numeric');
            app.H1.Layout.Row = 8;
            app.H1.Layout.Column = 2;

            % Create H2EditFieldLabel
            app.H2EditFieldLabel = uilabel(app.GridLayout);
            app.H2EditFieldLabel.HorizontalAlignment = 'right';
            app.H2EditFieldLabel.Layout.Row = 9;
            app.H2EditFieldLabel.Layout.Column = 1;
            app.H2EditFieldLabel.Text = 'H2';

            % Create H2
            app.H2 = uieditfield(app.GridLayout, 'numeric');
            app.H2.Layout.Row = 9;
            app.H2.Layout.Column = 2;

            % Create H3EditFieldLabel
            app.H3EditFieldLabel = uilabel(app.GridLayout);
            app.H3EditFieldLabel.HorizontalAlignment = 'right';
            app.H3EditFieldLabel.Layout.Row = 10;
            app.H3EditFieldLabel.Layout.Column = 1;
            app.H3EditFieldLabel.Text = 'H3';

            % Create H3
            app.H3 = uieditfield(app.GridLayout, 'numeric');
            app.H3.Layout.Row = 10;
            app.H3.Layout.Column = 2;

            % Create H4EditFieldLabel
            app.H4EditFieldLabel = uilabel(app.GridLayout);
            app.H4EditFieldLabel.HorizontalAlignment = 'right';
            app.H4EditFieldLabel.Layout.Row = 11;
            app.H4EditFieldLabel.Layout.Column = 1;
            app.H4EditFieldLabel.Text = 'H4';

            % Create H4
            app.H4 = uieditfield(app.GridLayout, 'numeric');
            app.H4.Layout.Row = 11;
            app.H4.Layout.Column = 2;

            % Create H5EditFieldLabel
            app.H5EditFieldLabel = uilabel(app.GridLayout);
            app.H5EditFieldLabel.HorizontalAlignment = 'right';
            app.H5EditFieldLabel.Layout.Row = 12;
            app.H5EditFieldLabel.Layout.Column = 1;
            app.H5EditFieldLabel.Text = 'H5';

            % Create H5
            app.H5 = uieditfield(app.GridLayout, 'numeric');
            app.H5.Layout.Row = 12;
            app.H5.Layout.Column = 2;

            % Create H6EditFieldLabel
            app.H6EditFieldLabel = uilabel(app.GridLayout);
            app.H6EditFieldLabel.HorizontalAlignment = 'right';
            app.H6EditFieldLabel.Layout.Row = 13;
            app.H6EditFieldLabel.Layout.Column = 1;
            app.H6EditFieldLabel.Text = 'H6';

            % Create H6
            app.H6 = uieditfield(app.GridLayout, 'numeric');
            app.H6.Layout.Row = 13;
            app.H6.Layout.Column = 2;

            % Create H7EditFieldLabel
            app.H7EditFieldLabel = uilabel(app.GridLayout);
            app.H7EditFieldLabel.HorizontalAlignment = 'right';
            app.H7EditFieldLabel.Layout.Row = 14;
            app.H7EditFieldLabel.Layout.Column = 1;
            app.H7EditFieldLabel.Text = 'H7';

            % Create H7
            app.H7 = uieditfield(app.GridLayout, 'numeric');
            app.H7.Layout.Row = 14;
            app.H7.Layout.Column = 2;

            % Create S1EditFieldLabel
            app.S1EditFieldLabel = uilabel(app.GridLayout);
            app.S1EditFieldLabel.HorizontalAlignment = 'right';
            app.S1EditFieldLabel.Layout.Row = 8;
            app.S1EditFieldLabel.Layout.Column = 3;
            app.S1EditFieldLabel.Text = 'S1';

            % Create S1
            app.S1 = uieditfield(app.GridLayout, 'numeric');
            app.S1.Layout.Row = 8;
            app.S1.Layout.Column = 4;

            % Create S2EditFieldLabel
            app.S2EditFieldLabel = uilabel(app.GridLayout);
            app.S2EditFieldLabel.HorizontalAlignment = 'right';
            app.S2EditFieldLabel.Layout.Row = 9;
            app.S2EditFieldLabel.Layout.Column = 3;
            app.S2EditFieldLabel.Text = 'S2';

            % Create S2
            app.S2 = uieditfield(app.GridLayout, 'numeric');
            app.S2.Layout.Row = 9;
            app.S2.Layout.Column = 4;

            % Create S3EditFieldLabel
            app.S3EditFieldLabel = uilabel(app.GridLayout);
            app.S3EditFieldLabel.HorizontalAlignment = 'right';
            app.S3EditFieldLabel.Layout.Row = 10;
            app.S3EditFieldLabel.Layout.Column = 3;
            app.S3EditFieldLabel.Text = 'S3';

            % Create S3
            app.S3 = uieditfield(app.GridLayout, 'numeric');
            app.S3.Layout.Row = 10;
            app.S3.Layout.Column = 4;

            % Create S4EditFieldLabel
            app.S4EditFieldLabel = uilabel(app.GridLayout);
            app.S4EditFieldLabel.HorizontalAlignment = 'right';
            app.S4EditFieldLabel.Layout.Row = 11;
            app.S4EditFieldLabel.Layout.Column = 3;
            app.S4EditFieldLabel.Text = 'S4';

            % Create S4
            app.S4 = uieditfield(app.GridLayout, 'numeric');
            app.S4.Layout.Row = 11;
            app.S4.Layout.Column = 4;

            % Create S5EditFieldLabel
            app.S5EditFieldLabel = uilabel(app.GridLayout);
            app.S5EditFieldLabel.HorizontalAlignment = 'right';
            app.S5EditFieldLabel.Layout.Row = 12;
            app.S5EditFieldLabel.Layout.Column = 3;
            app.S5EditFieldLabel.Text = 'S5';

            % Create S5
            app.S5 = uieditfield(app.GridLayout, 'numeric');
            app.S5.Layout.Row = 12;
            app.S5.Layout.Column = 4;

            % Create S6EditFieldLabel
            app.S6EditFieldLabel = uilabel(app.GridLayout);
            app.S6EditFieldLabel.HorizontalAlignment = 'right';
            app.S6EditFieldLabel.Layout.Row = 13;
            app.S6EditFieldLabel.Layout.Column = 3;
            app.S6EditFieldLabel.Text = 'S6';

            % Create S6
            app.S6 = uieditfield(app.GridLayout, 'numeric');
            app.S6.Layout.Row = 13;
            app.S6.Layout.Column = 4;

            % Create S7EditFieldLabel
            app.S7EditFieldLabel = uilabel(app.GridLayout);
            app.S7EditFieldLabel.HorizontalAlignment = 'right';
            app.S7EditFieldLabel.Layout.Row = 14;
            app.S7EditFieldLabel.Layout.Column = 3;
            app.S7EditFieldLabel.Text = 'S7';

            % Create S7
            app.S7 = uieditfield(app.GridLayout, 'numeric');
            app.S7.Layout.Row = 14;
            app.S7.Layout.Column = 4;

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'T-S Diagram')
            xlabel(app.UIAxes, 'Specific Entropy(kJ/kg K)')
            ylabel(app.UIAxes, 'Temperature (Deg C)')
            app.UIAxes.PlotBoxAspectRatio = [2.00478468899522 1 1];
            app.UIAxes.Position = [566 355 383 223];

            % Create UIAxes_2
            app.UIAxes_2 = uiaxes(app.UIFigure);
            title(app.UIAxes_2, 'H-S Diagram')
            xlabel(app.UIAxes_2, 'Specific Entropy(kJ/kg K)')
            ylabel(app.UIAxes_2, 'Specific Enthalpy (kJ/kg)')
            app.UIAxes_2.PlotBoxAspectRatio = [1.94977168949772 1 1];
            app.UIAxes_2.Position = [566 93 389 231];

            % Create SimulateButton
            app.SimulateButton = uibutton(app.UIFigure, 'push');
            app.SimulateButton.ButtonPushedFcn = createCallbackFcn(app, @SimulateButtonPushed, true);
            app.SimulateButton.BackgroundColor = [0.8 0.8 0.8];
            app.SimulateButton.Position = [218 454 100 22];
            app.SimulateButton.Text = 'Simulate';

            % Create EfficiencyandWorkPanel
            app.EfficiencyandWorkPanel = uipanel(app.UIFigure);
            app.EfficiencyandWorkPanel.TitlePosition = 'centertop';
            app.EfficiencyandWorkPanel.Title = 'Efficiency and Work';
            app.EfficiencyandWorkPanel.FontWeight = 'bold';
            app.EfficiencyandWorkPanel.Position = [321 113 224 266];

            % Create HeatInputEditFieldLabel
            app.HeatInputEditFieldLabel = uilabel(app.EfficiencyandWorkPanel);
            app.HeatInputEditFieldLabel.HorizontalAlignment = 'right';
            app.HeatInputEditFieldLabel.FontWeight = 'bold';
            app.HeatInputEditFieldLabel.Position = [59 218 68 22];
            app.HeatInputEditFieldLabel.Text = 'Heat Input ';

            % Create HeatInputEditField
            app.HeatInputEditField = uieditfield(app.EfficiencyandWorkPanel, 'numeric');
            app.HeatInputEditField.FontWeight = 'bold';
            app.HeatInputEditField.Position = [134 218 70 22];

            % Create HeatRejectionEditFieldLabel
            app.HeatRejectionEditFieldLabel = uilabel(app.EfficiencyandWorkPanel);
            app.HeatRejectionEditFieldLabel.HorizontalAlignment = 'right';
            app.HeatRejectionEditFieldLabel.FontWeight = 'bold';
            app.HeatRejectionEditFieldLabel.Position = [36 189 92 22];
            app.HeatRejectionEditFieldLabel.Text = 'Heat Rejection ';

            % Create HeatRejectionEditField
            app.HeatRejectionEditField = uieditfield(app.EfficiencyandWorkPanel, 'numeric');
            app.HeatRejectionEditField.FontWeight = 'bold';
            app.HeatRejectionEditField.Position = [134 189 70 22];

            % Create PumpWorkEditFieldLabel
            app.PumpWorkEditFieldLabel = uilabel(app.EfficiencyandWorkPanel);
            app.PumpWorkEditFieldLabel.HorizontalAlignment = 'right';
            app.PumpWorkEditFieldLabel.FontWeight = 'bold';
            app.PumpWorkEditFieldLabel.Position = [55 160 72 22];
            app.PumpWorkEditFieldLabel.Text = 'Pump Work';

            % Create PumpWorkEditField
            app.PumpWorkEditField = uieditfield(app.EfficiencyandWorkPanel, 'numeric');
            app.PumpWorkEditField.FontWeight = 'bold';
            app.PumpWorkEditField.Position = [134 160 70 22];

            % Create TurbineWorkEditFieldLabel
            app.TurbineWorkEditFieldLabel = uilabel(app.EfficiencyandWorkPanel);
            app.TurbineWorkEditFieldLabel.HorizontalAlignment = 'right';
            app.TurbineWorkEditFieldLabel.FontWeight = 'bold';
            app.TurbineWorkEditFieldLabel.Position = [47 132 81 22];
            app.TurbineWorkEditFieldLabel.Text = 'Turbine Work';

            % Create TurbineWorkEditField
            app.TurbineWorkEditField = uieditfield(app.EfficiencyandWorkPanel, 'numeric');
            app.TurbineWorkEditField.FontWeight = 'bold';
            app.TurbineWorkEditField.Position = [135 132 70 22];

            % Create NetWorkEditFieldLabel
            app.NetWorkEditFieldLabel = uilabel(app.EfficiencyandWorkPanel);
            app.NetWorkEditFieldLabel.HorizontalAlignment = 'right';
            app.NetWorkEditFieldLabel.FontWeight = 'bold';
            app.NetWorkEditFieldLabel.Position = [65 102 61 22];
            app.NetWorkEditFieldLabel.Text = 'Net Work ';

            % Create NetWorkEditField
            app.NetWorkEditField = uieditfield(app.EfficiencyandWorkPanel, 'numeric');
            app.NetWorkEditField.FontWeight = 'bold';
            app.NetWorkEditField.Position = [133 102 70 22];

            % Create EfficiencyEditFieldLabel
            app.EfficiencyEditFieldLabel = uilabel(app.EfficiencyandWorkPanel);
            app.EfficiencyEditFieldLabel.HorizontalAlignment = 'right';
            app.EfficiencyEditFieldLabel.FontWeight = 'bold';
            app.EfficiencyEditFieldLabel.Position = [64 74 62 22];
            app.EfficiencyEditFieldLabel.Text = 'Efficiency';

            % Create EfficiencyEditField
            app.EfficiencyEditField = uieditfield(app.EfficiencyandWorkPanel, 'numeric');
            app.EfficiencyEditField.FontWeight = 'bold';
            app.EfficiencyEditField.Position = [133 74 70 22];

            % Create BackWorkRatioEditFieldLabel
            app.BackWorkRatioEditFieldLabel = uilabel(app.EfficiencyandWorkPanel);
            app.BackWorkRatioEditFieldLabel.HorizontalAlignment = 'right';
            app.BackWorkRatioEditFieldLabel.FontWeight = 'bold';
            app.BackWorkRatioEditFieldLabel.Position = [24 45 101 22];
            app.BackWorkRatioEditFieldLabel.Text = 'Back Work Ratio';

            % Create BackWorkRatioEditField
            app.BackWorkRatioEditField = uieditfield(app.EfficiencyandWorkPanel, 'numeric');
            app.BackWorkRatioEditField.FontWeight = 'bold';
            app.BackWorkRatioEditField.Position = [132 45 70 22];

            % Create DrynessFractionEditFieldLabel
            app.DrynessFractionEditFieldLabel = uilabel(app.EfficiencyandWorkPanel);
            app.DrynessFractionEditFieldLabel.HorizontalAlignment = 'right';
            app.DrynessFractionEditFieldLabel.FontWeight = 'bold';
            app.DrynessFractionEditFieldLabel.Position = [22 16 103 22];
            app.DrynessFractionEditFieldLabel.Text = 'Dryness Fraction';

            % Create DrynessFractionEditField
            app.DrynessFractionEditField = uieditfield(app.EfficiencyandWorkPanel, 'numeric');
            app.DrynessFractionEditField.FontWeight = 'bold';
            app.DrynessFractionEditField.Position = [132 16 70 22];

            % Create PressureinbarLabel
            app.PressureinbarLabel = uilabel(app.UIFigure);
            app.PressureinbarLabel.FontSize = 8;
            app.PressureinbarLabel.FontWeight = 'bold';
            app.PressureinbarLabel.Position = [80 3 64 22];
            app.PressureinbarLabel.Text = 'Pressure in bar';

            % Create TemperatureindegCLabel
            app.TemperatureindegCLabel = uilabel(app.UIFigure);
            app.TemperatureindegCLabel.FontSize = 8;
            app.TemperatureindegCLabel.FontWeight = 'bold';
            app.TemperatureindegCLabel.Position = [143 3 87 22];
            app.TemperatureindegCLabel.Text = 'Temperature in deg C';

            % Create EnthalpyinkJkgLabel
            app.EnthalpyinkJkgLabel = uilabel(app.UIFigure);
            app.EnthalpyinkJkgLabel.FontSize = 8;
            app.EnthalpyinkJkgLabel.FontWeight = 'bold';
            app.EnthalpyinkJkgLabel.Position = [231 3 72 22];
            app.EnthalpyinkJkgLabel.Text = 'Enthalpy in kJ/kg';

            % Create EntropyinkJkgKLabel
            app.EntropyinkJkgKLabel = uilabel(app.UIFigure);
            app.EntropyinkJkgKLabel.FontSize = 8;
            app.EntropyinkJkgKLabel.FontWeight = 'bold';
            app.EntropyinkJkgKLabel.Position = [306 3 76 22];
            app.EntropyinkJkgKLabel.Text = 'Entropy in kJ/kg K';

            % Create HeatinkJkgLabel
            app.HeatinkJkgLabel = uilabel(app.UIFigure);
            app.HeatinkJkgLabel.FontSize = 8;
            app.HeatinkJkgLabel.FontWeight = 'bold';
            app.HeatinkJkgLabel.Position = [381 3 57 22];
            app.HeatinkJkgLabel.Text = 'Heat in kJ/kg ';

            % Create WorkinkJkgLabel
            app.WorkinkJkgLabel = uilabel(app.UIFigure);
            app.WorkinkJkgLabel.FontSize = 8;
            app.WorkinkJkgLabel.FontWeight = 'bold';
            app.WorkinkJkgLabel.Position = [437 3 60 22];
            app.WorkinkJkgLabel.Text = 'Work in kJ/kg ';

            % Create Label
            app.Label = uilabel(app.UIFigure);
            app.Label.FontSize = 15;
            app.Label.FontWeight = 'bold';
            app.Label.Position = [68 1 25 22];
            app.Label.Text = '*';

            % Create SelectTypeDropDownLabel
            app.SelectTypeDropDownLabel = uilabel(app.UIFigure);
            app.SelectTypeDropDownLabel.HorizontalAlignment = 'right';
            app.SelectTypeDropDownLabel.Position = [80 642 68 22];
            app.SelectTypeDropDownLabel.Text = 'Select Type';

            % Create rankinedropdown
            app.rankinedropdown = uidropdown(app.UIFigure);
            app.rankinedropdown.Items = {'Simple Ideal Rankine Cycle', 'Ideal Rankine Cycle with Reheat', 'Ideal Rankine Cycle with Regeneration'};
            app.rankinedropdown.Position = [163 642 230 22];
            app.rankinedropdown.Value = 'Simple Ideal Rankine Cycle';

            % Create PressureatReheatFeedwaterInletEditFieldLabel
            app.PressureatReheatFeedwaterInletEditFieldLabel = uilabel(app.UIFigure);
            app.PressureatReheatFeedwaterInletEditFieldLabel.HorizontalAlignment = 'right';
            app.PressureatReheatFeedwaterInletEditFieldLabel.Position = [80 498 199 22];
            app.PressureatReheatFeedwaterInletEditFieldLabel.Text = 'Pressure at Reheat /Feedwater Inlet';

            % Create PressureatReheatFeedwaterInletEditField
            app.PressureatReheatFeedwaterInletEditField = uieditfield(app.UIFigure, 'numeric');
            app.PressureatReheatFeedwaterInletEditField.Position = [294 498 104 22];

            % Create ResetAllButton
            app.ResetAllButton = uibutton(app.UIFigure, 'push');
            app.ResetAllButton.ButtonPushedFcn = createCallbackFcn(app, @ResetAllButtonPushed, true);
            app.ResetAllButton.BackgroundColor = [0.8 0.8 0.8];
            app.ResetAllButton.FontName = 'Book Antiqua';
            app.ResetAllButton.FontSize = 16;
            app.ResetAllButton.FontWeight = 'bold';
            app.ResetAllButton.Position = [731 20 161 34];
            app.ResetAllButton.Text = 'Reset All';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = rankine_app_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end