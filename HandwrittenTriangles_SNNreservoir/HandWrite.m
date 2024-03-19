classdef HandWrite < handle
    properties
        N
        dtstep
        numout
        numin
        RLSevery
        
        trefac
        tneuron
        vreset
        vrest
        vthr
        vpeak
        
        tsynapse1
        tsynapse2
        BIAS
        
        alpha
        lambda
        Q
        G
        
        weights
        outweights
        inweights
        eta
        
        synapses
        neurons
        RLS

        outlog
        rPrlog
    end
    methods        
        function obj=HandWrite(numNeurons)
            obj.N=numNeurons;
            obj.dtstep=0.001;
            obj.numout=2;
            obj.numin=2;
            obj.RLSevery=10;
            
            % Neuron parameter
            obj.trefac=0.044;
            obj.tneuron=0.044;
            obj.vreset=-65;
            obj.vrest=0;
            obj.vthr=-40;
            obj.vpeak=30;
            obj.BIAS=-40;
            
            % Synapse parameter
            obj.tsynapse1=0.601;
            obj.tsynapse2=0.044;
            
            % Network parameter
            obj.alpha=100;
            obj.randomweights(1.25);
            obj.randomoutweights();
            obj.randomfeedbackfac(0.4);
            obj.randominweights(0.4);
            obj.Q=1;
            obj.G=1;
                         
            obj.neurons=LIF(obj.N,obj.dtstep,obj.trefac,obj.tneuron,obj.vreset,obj.vrest,obj.vthr,obj.vpeak);
            obj.synapses=Synapse(obj.N,obj.dtstep,obj.tsynapse1,obj.tsynapse2);
            obj.RLS=RLS(obj.N,obj.dtstep,obj.outweights,obj.alpha);
        end
        
        function randomweights(obj,g)
            list=[-2,-1,0,1,2]*g/sqrt(obj.N);
            for i=1:obj.N
               obj.weights(i,:)=randn(1,obj.N)*g/sqrt(obj.N);
               
               l=(list(1)+list(2))/2;
               obj.weights(i,obj.weights(i,:)<l)=list(1);
               for j=2:numel(list)-1
                   l=(list(j-1)+list(j))/2;
                   u=(list(j)+list(j+1))/2;
                   obj.weights(i,obj.weights(i,:)>=l & obj.weights(i,:)<u)=list(j);
               end
               u=(list(end-1)+list(end))/2;
               obj.weights(i,obj.weights(i,:)>=u)=list(end);
            end
        end
        
        function randomfeedbackfac(obj,p)
            for i=1:obj.numout
                arr=rand(obj.N,1);
                ind=arr<p;
                num=sum(ind);
                obj.eta(:,i)=zeros(obj.N,1);
                obj.eta(ind,i)=rand(num,1)*2-1;
                obj.eta(obj.eta(:,i)<0,i)=-1;
                obj.eta(obj.eta(:,i)>0,i)=1;
            end
        end
        
        function randominweights(obj,p)
            for i=1:obj.numin
                arr=rand(obj.N,1);
                ind=arr<p;
                num=sum(ind);
                obj.inweights(:,i)=zeros(obj.N,1);
                obj.inweights(ind,i)=rand(num,1)*2-1;
                obj.inweights(obj.inweights(:,i)<0,i)=-0.5;
                obj.inweights(obj.inweights(:,i)>0,i)=0.5;
            end
        end
        
        function randomoutweights(obj)
            obj.outweights=rand(obj.N,obj.numout)*2-ones(obj.N,obj.numout);
        end
        
        function evaluate(obj,traindata,testdata)
            ntrain=size(traindata,1);
            ntest=size(testdata,1);
            nsteps=ntrain+ntest;
            
            data=[traindata;testdata];
            
            obj.outlog=zeros(nsteps,obj.numout);
            obj.rPrlog=zeros(nsteps,1);
            
            t=0;
            r=zeros(obj.N,1);
            for i=1:nsteps
                
                if(i<=ntrain && mod(i,obj.RLSevery)==0)
                    out=obj.RLS.Update(r,data(i,:),1);
                    obj.outweights=obj.RLS.wout;
                    rPr=obj.RLS.rPr;
                else
                    out=obj.RLS.Update(r,data(i,:),0);
                    obj.outweights=obj.RLS.wout;
                    rPr=obj.RLS.rPr;
                end
                
                input=data(i,:)-out;

                PSC=obj.weights*r;
                PSC2=obj.eta*out';
                PSCin=obj.inweights*input';
                PSCtot=PSC*obj.G+PSC2*obj.Q+PSCin;
                [v,spikeindex]=obj.neurons.Update(PSCtot*50+obj.BIAS);
                r=obj.synapses.Update(spikeindex)/70;
                
                % logging
                obj.outlog(i,:)=out;
                obj.rPrlog(i)=rPr;
                
                t=t+obj.dtstep;
           end
           
        end
        
    end
end