classdef LIF < handle
    properties
        N
        u
        dt
        
        trefac
        tneuron
        vreset
        vrest
        vthr
        vpeak
        
        Rm     % Membrene resistance
        
        t
        spiketime
        spikeindex
    end
    
    methods
        function obj=LIF(N,dtstep,trefac,tneuron,vreset,vrest,vthr,vpeak)
            obj.Rm=1;
            obj.N=N;
            obj.dt=dtstep;
            obj.trefac=trefac;
            obj.tneuron=tneuron;
            obj.vreset=vreset;
            obj.vrest=vrest;
            obj.vthr=vthr;
            obj.vpeak=vpeak;
            obj.u=ones(N,1)*vrest;
            obj.t=0;
            obj.spiketime=-ones(N,1)*obj.trefac;
            obj.randomize();
        end
        
        function randomize(obj)
            obj.u=obj.vreset+rand(obj.N,1)*(obj.vpeak-obj.vreset);
        end
        
        function [v,spikeindex]=Update(obj,current)
            obj.u(obj.spikeindex)=obj.vreset;
            
            obj.spikeindex=obj.u>=obj.vthr;
            obj.spiketime(obj.spikeindex)=obj.t;
            obj.u(obj.spikeindex)=obj.vpeak;
            
            activeneurons=obj.t-obj.spiketime>=obj.trefac;
            
            dv=((obj.u-obj.vrest)-obj.Rm*current)/obj.tneuron;
            obj.u(activeneurons)=obj.u(activeneurons)-dv(activeneurons)*obj.dt;
            
            obj.t=obj.t+obj.dt;
            
            v=obj.u;
            spikeindex=obj.spikeindex;
        end
    end
end
