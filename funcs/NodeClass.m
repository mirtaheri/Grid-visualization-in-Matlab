classdef NodeClass
    
%Node class is created and will be updated for load flow and other
%analyses.

    properties (Access = public)
        layer
        name
        X
        Y
        P
        W
        Type
    end
    
    properties (Access = private)
        Pc
        Qc
        Qrif
        TIPO
        Ig_max
        Penf
        AIEst
        Icc_max
        Category
    end
    methods
        function object = NodeClass(n, t, x, y, p, type, w)
            object.name = n;
            object.layer = t;
            object.X = x;
            object.Y = y;
            object.P = p;
            object.W = w;
            object.Type = type;
        end
            
    end
    
end

