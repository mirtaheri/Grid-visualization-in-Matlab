
function patchHndl = plotCustMark(xData,yData,markerDataX,markerDataY,markerSize, lineThick, face_color)

% this function uses codes from: https://it.mathworks.com/matlabcentral/fileexchange/39487-custom-marker-plot

xData = reshape(xData,length(xData),1) ;
yData = reshape(yData,length(yData),1) ;
markerDataX = markerSize * reshape(markerDataX,1,length(markerDataX)) ;
markerDataY = markerSize * reshape(markerDataY,1,length(markerDataY)) ;

%% prepare and plot the patches
markerEdgeColor = [0 0 0] ;
markerFaceColor = face_color ;
% ------
vertX = repmat(markerDataX,length(xData),1) ; vertX = vertX(:) ;
vertY = repmat(markerDataY,length(yData),1) ; vertY = vertY(:) ;
% ------
vertX = repmat(xData,length(markerDataX),1) + vertX ;
vertY = repmat(yData,length(markerDataY),1) + vertY ;
% ------
faces = 0:length(xData):length(xData)*(length(markerDataY)-1) ;
faces = repmat(faces,length(xData),1) ;
faces = repmat((1:length(xData))',1,length(markerDataY)) + faces ;
% ------
patchHndl = patch('Faces',faces,'Vertices',[vertX vertY]);
set(patchHndl,'FaceColor',markerFaceColor,'LineWidth', lineThick, 'EdgeColor',markerEdgeColor) ;
hold on
% -------------------------------------------------------------

