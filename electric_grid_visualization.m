
clear 
close all
addpath funcs

LineObjects = import_line_data;
NodeObjects = import_node_data;
%% Graph
sources = [];
targets = [];
redund_line_s = [];
redund_line_t = [];

for line = 1:numel(LineObjects)
    sources = [sources, LineObjects{line}.Node_A];
    targets = [targets, LineObjects{line}.Node_B];
    if strfind(LineObjects{line}.name{1}, '-')
        LineObjects{line}.redundant = 1;  %disconnected side is reffered to Node_B
        redund_line_s = [redund_line_s, LineObjects{line}.Node_A];
        redund_line_t = [redund_line_t, LineObjects{line}.Node_B];
    else 
        LineObjects{line}.redundant = 0;
    end   
end

% Graph model of the electrical grid
graph_object = graph(sources, targets);

figure('name', 'Physical Network Structure', 'Color',[1 1 1],'NumberTitle','off');
hold on, axis off
set(gcf,'units','normalized','outerposition',[0 0 0.75 1])

graph_plot_object = plot(graph_object,'Layout','layered');
graph_plot_object.LineWidth = 1.25;
graph_plot_object.EdgeAlpha = 1;

for i = 1:height(graph_object.Nodes)
    for j = 1:numel(NodeObjects)
        if isequal(graph_object.Nodes.Name{i,:} , NodeObjects{j}.name{1})
            graph_plot_object.XData(1,i) = NodeObjects{j}.X;
            graph_plot_object.YData(1,i) = NodeObjects{j}.Y;
        end            
    end
end
set(gca,'YDir','Reverse')
%% Add second layer; redundant lines
second_layer(graph_plot_object, LineObjects);

%% set nodes' color according to their switch control property

node_colors = graphic_set(graph_object, graph_plot_object, NodeObjects);

graph_plot_object.NodeLabel = repmat({''}, 1, size(graph_plot_object.XData,2));
graph_plot_object.MarkerSize = 4;
graph_plot_object.NodeColor = node_colors;

%% Add nodes' name in last layer, to prevent being covered by other layers
gp = plot(graph_object,'Layout','layered');
%---
labels = gp.NodeLabel;
gp.NodeLabel = [];
gp.XData = graph_plot_object.XData;
gp.YData = graph_plot_object.YData;
gp.LineStyle = 'none';gp.Marker = 'none';

label_custom_color = [0.85 0.5 0];
font = 'Arial';
for i=1:length(labels)
   text(gp.XData(i)+2, gp.YData(i)+5,labels(i),...
       'fontsize', 8,'FontName', font, 'Color',label_custom_color, ...
       'FontSmoothing', 'on', 'FontWeight', 'bold');
end
%% set figure margine
ax = gca;
outerpos = ax.OuterPosition;
ti = ax.TightInset; 
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3);
ax_height = outerpos(4) - ti(2) - ti(4);
ax.Position = [left bottom ax_width ax_height];

%% save graph as a pdf
%print('Study case grid','-dpdf','-fillpage')
print('output\Study case grid','-dpdf')


