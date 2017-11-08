function  second_layer( g_p_object, l_objects)
% this function puts dashed lined on the redundant lines, in second layer
% of plot.


%% Second layer; redundant lines

redundant_layer_sources = []; 
    redundant_layer_targets = [];
    source_index = [];
    target_index = [];
    Index = [];
    for ln = 1:numel(l_objects)
        if (l_objects{ln}.redundant == 1)
            index = find(contains(g_p_object.NodeLabel, l_objects{ln}.Node_A{1}));
            source_index = [source_index, index];
            Index = [Index, index];
            index = find(contains(g_p_object.NodeLabel, l_objects{ln}.Node_B{1}));
            target_index = [target_index, index];
            Index = [Index, index];
            redundant_layer_sources = [redundant_layer_sources, l_objects{ln}.Node_A]; 
            redundant_layer_targets = [redundant_layer_targets, l_objects{ln}.Node_B];
        end  
    end
% --------------------------------------------------------------
    if ~isempty(Index)
        secnd_graph_object = graph(redundant_layer_sources, redundant_layer_targets);
        secnd_graph_plot_object = plot(secnd_graph_object);

        secnd_x_data = g_p_object.XData(Index);
        secnd_y_data = g_p_object.YData(Index);

        secnd_graph_plot_object.XData = secnd_x_data;
        secnd_graph_plot_object.YData = secnd_y_data;

        even_index = 1:2:length(secnd_graph_plot_object.XData);
        odd_index  = 2:2:length(secnd_graph_plot_object.XData);
        new_X = (secnd_graph_plot_object.XData(even_index) + secnd_graph_plot_object.XData(odd_index))/2;
        secnd_graph_plot_object.XData(even_index) = new_X;
        new_Y = (secnd_graph_plot_object.YData(even_index) + secnd_graph_plot_object.YData(odd_index))/2;
        secnd_graph_plot_object.YData(even_index) = new_Y;
    % --------------------------------------------------------------
        secnd_graph_plot_object.Marker = 'none';
        secnd_graph_plot_object.EdgeColor = 'w';
        secnd_graph_plot_object.EdgeAlpha = 1;   
        secnd_graph_plot_object.LineStyle = ':';
        secnd_graph_plot_object.NodeLabel = repmat({''}, 1, size(secnd_graph_plot_object.XData,2));
        secnd_graph_plot_object.LineWidth = 2;
    end
end

