classdef Synapse < handle
    properties
        N
        r
        h
        t
        t1      % td
        t2      % tr
        dt
    end
    
    methods
        function obj=Synapse(N,dtstep,tsynapse1,tsynapse2)
            obj.N=N;
            obj.dt=dtstep;
            obj.t=0;
            obj.t1=tsynapse1;
            obj.t2=tsynapse2;
            obj.r=zeros(N,1);
            obj.h=zeros(N,1);
        end
        
        function res=Update(obj,spikeindex)
            obj.r=(1-obj.dt/obj.t1)*obj.r+obj.h*obj.dt;
            obj.h=(1-obj.dt/obj.t2)*obj.h;
            obj.h(spikeindex)=obj.h(spikeindex)+1/(obj.t1*obj.t2);
            obj.t=obj.t+obj.dt;
            res=obj.r;
        end
    end
end
