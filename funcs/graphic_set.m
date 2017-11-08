function node_colors = graphic_set(g_object, g_p_object, N_bjects )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    node_colors = zeros(size(g_object.Nodes,1),3);
    for i = 1:numel(g_p_object.NodeLabel)
        for j = 1:numel(N_bjects)
            if isequal(g_object.Nodes.Name{i,:} , N_bjects{j}.name{1})
                if N_bjects{j}.P == 1
                    node_colors(i,:) = [0 0 1];
                elseif N_bjects{j}.P == 2
                    node_colors(i,:) = [0 1 0];
                elseif N_bjects{j}.P == 3
                    node_colors(i,:) = [0 1 1];  
                elseif N_bjects{j}.P == 4
                    node_colors(i,:) = [1 0 0];                  
                end
                if N_bjects{j}.Type{1} == 'AC'
                    weight = 10; % just to verify, then in final version will be scaled to nominal power accordingly
                    weight = N_bjects{j}.W * weight;
                    custom_marker(N_bjects{j}.Type{1}, N_bjects{j}.X, N_bjects{j}.Y, weight) % 10 just to prove
                elseif N_bjects{j}.Type{1} == 'WT'
                    weight = 10;
                    weight = N_bjects{j}.W * weight;
                    custom_marker(N_bjects{j}.Type{1}, N_bjects{j}.X, N_bjects{j}.Y-(weight*2.7), weight) 
                elseif N_bjects{j}.Type{1} == 'Ld'
                    weight = 3;
                    weight = N_bjects{j}.W * weight;
                    custom_marker(N_bjects{j}.Type{1}, N_bjects{j}.X, N_bjects{j}.Y+(weight*3.5), weight);
                elseif N_bjects{j}.Type{1} == 'PV'
                    weight = 10;
                    weight = N_bjects{j}.W * weight;
                    custom_marker(N_bjects{j}.Type{1}, N_bjects{j}.X-(weight*0.5), N_bjects{j}.Y-(weight*0.5), weight);
                end 
            end  
        end
    end
end

