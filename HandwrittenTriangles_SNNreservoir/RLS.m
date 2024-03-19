classdef RLS < handle
    properties
        P
        numrows
        dtstep
        alpha
        rPr
        wout
        i
    end
    
    methods
        function obj=RLS(numrows,dtstep,w,alpha)
            obj.numrows=numrows;
            obj.dtstep=dtstep;
            obj.alpha=alpha;
            obj.P=eye(numrows)*obj.alpha;
            obj.wout=w;
            obj.i=1;
        end
        
        function out=Update(obj,r,teach,update)
            out=(obj.wout'*r)';
            
            Pr=obj.P*r;
            obj.rPr=r'*Pr;

            if(update==1)
                err=out-teach;

                denominator=(1+obj.rPr);
                Prdenom=Pr./denominator;
                numerator=Pr*Prdenom';

                DeltaP=numerator;
                obj.P=obj.P-DeltaP;
                dw=Prdenom*err;

                obj.wout=obj.wout-dw;
            end
            
            obj.i=obj.i+1;
        end
    end
end

