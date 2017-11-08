function NodeObjects = import_node_data()
% node data that are being imported for visulization include:
% position -> x, y
% protection type -> p
% weight; this could be considered as nominal power of connected element
% (load, generatorr, etc.) in p.u. -> w
% type here can be generator, load, wind turbine or photovoltaics or non-specified ("-") -> t

%% import Nodes data 
    nodes = importdata('excel_files\Nodes.xlsx');
    node_fields = fieldnames(nodes.textdata);
    node_cl_tot = 0;
    for m = 1:numel(node_fields)
        nodes.textdata.(node_fields{m});
        node_cl_tot = node_cl_tot + length(nodes.textdata.(node_fields{m})(:,1))-1;
    end
% --------------------------------------------------------------
    NodeObjects = cell(1,node_cl_tot);
    node_counter = 0;
    for i = 1:numel(node_fields)
        nodes.textdata.(node_fields{i});
        for j=1:length(nodes.textdata.(node_fields{i})(:,1))-1
            node_counter = node_counter + 1;
            x = nodes.data.(node_fields{i})(j,1);
            y = nodes.data.(node_fields{i})(j,2);
            p = nodes.data.(node_fields{i})(j,end-1);  
            w = nodes.data.(node_fields{i})(j,end);    
            type = nodes.textdata.(node_fields{i})(j+1,end);  
            NodeObjects{node_counter} = NodeClass(nodes.textdata.(node_fields{i})(j+1), i, x, y, p, type, w);
        end
    end
end

