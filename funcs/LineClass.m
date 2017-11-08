classdef LineClass
    %Line class is created and will be updated for load flow and other
    %analyses.
    
    properties (Access = public)
        name
        Node_A
        Node_B
        R_tot
    end

    properties (Access = public)
        redundant
    end
    
    properties (Access = private)
        %R_tot
        X_tot
        B_tot
        lung
        I_max
    end
    
    methods
        function object = LineClass(n, a, b, r)
            object.name = n;
            object.Node_A = a;
            object.Node_B = b;
            object.R_tot = r;
        end
            
    end
    
end

