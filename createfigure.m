function createfigure(VertexNormals1, YData1, XData1, Vertices1, Faces1, FaceVertexCData1, CData1, VertexNormals2, YData2, XData2, Vertices2, Faces2, VertexNormals3, YData3, XData3, Vertices3, Faces3, VertexNormals4, YData4, XData4, Vertices4)
%CREATEFIGURE(VERTEXNORMALS1, YDATA1, XDATA1, VERTICES1, FACES1, FACEVERTEXCDATA1, CDATA1, VERTEXNORMALS2, YDATA2, XDATA2, VERTICES2, FACES2, VERTEXNORMALS3, YDATA3, XDATA3, VERTICES3, FACES3, VERTEXNORMALS4, YDATA4, XDATA4, VERTICES4)
%  VERTEXNORMALS1:  patch vertexnormals
%  YDATA1:  patch ydata
%  XDATA1:  patch xdata
%  VERTICES1:  patch vertices
%  FACES1:  patch faces
%  FACEVERTEXCDATA1:  patch facevertexcdata
%  CDATA1:  patch cdata
%  VERTEXNORMALS2:  patch vertexnormals
%  YDATA2:  patch ydata
%  XDATA2:  patch xdata
%  VERTICES2:  patch vertices
%  FACES2:  patch faces
%  VERTEXNORMALS3:  patch vertexnormals
%  YDATA3:  patch ydata
%  XDATA3:  patch xdata
%  VERTICES3:  patch vertices
%  FACES3:  patch faces
%  VERTEXNORMALS4:  patch vertexnormals
%  YDATA4:  patch ydata
%  XDATA4:  patch xdata
%  VERTICES4:  patch vertices

%  Auto-generated by MATLAB on 28-Dec-2017 17:21:17

% Create figure
figure1 = figure('Renderer','zbuffer','InvertHardcopy','off',...
    'Color',[1 1 1]);

% Create axes
axes1 = axes('Parent',figure1,'YTickLabel',{},...
    'YTick',[0 50 100 150 200 250 300],...
    'XTickLabel',{},...
    'XTick',[0 50 100 150 200 250 300],...
    'Units','pixels',...
    'TickDir','out',...
    'TickLength',[0 0],...
    'Position',[11 13 781 779],...
    'PlotBoxAspectRatio',[300.707106781187 300.707106781187 1],...
    'Layer','top',...
    'FontSize',20.7516600265604,...
    'DataAspectRatio',[1 1 1]);
%% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[-0.353553390593274 300.353553390593]);
%% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[-0.353553390593274 300.353553390593]);
%% Uncomment the following line to preserve the Z-limits of the axes
% zlim(axes1,[-1.66533453693773e-16 1]);
view(axes1,[0 -90]);
box(axes1,'on');

% Create xlabel
xlabel('x','Visible','off','VerticalAlignment','cap',...
    'HorizontalAlignment','center',...
    'FontSize',20.7516600265604);

% Create ylabel
ylabel('y','Visible','off','VerticalAlignment','bottom','Rotation',90,...
    'HorizontalAlignment','center',...
    'FontSize',20.7516600265604);

% Create patch
patch('Parent',axes1,'VertexNormals',VertexNormals1,'YData',YData1,...
    'XData',XData1,...
    'Vertices',Vertices1,...
    'Faces',Faces1,...
    'FaceColor','flat',...
    'EdgeColor','none',...
    'FaceVertexCData',FaceVertexCData1,...
    'DisplayName','Nickel',...
    'CData',CData1);

% Create patch
patch('Parent',axes1,'VertexNormals',VertexNormals2,'YData',YData2,...
    'XData',XData2,...
    'Vertices',Vertices2,...
    'Faces',Faces2,...
    'FaceColor','none');

% Create hgtransform
hgtransform1 = hgtransform('Visible','off','Parent',axes1);

% Create patch
patch('Parent',hgtransform1,'Visible','off','VertexNormals',VertexNormals3,...
    'YData',YData3,...
    'XData',XData3,...
    'Vertices',Vertices3,...
    'LineWidth',1,...
    'Faces',Faces3,...
    'FaceAlpha',0.6,...
    'EdgeColor','none');

% Create text
text('Parent',hgtransform1,'Visible','off','VerticalAlignment','baseline',...
    'Interpreter','latex',...
    'String','100 $\mu$m',...
    'Position',[54.7867390330168 290.072968543373 0],...
    'HorizontalAlignment','center',...
    'FontSize',20.7516600265604,...
    'Color',[1 1 1]);

% Create patch
patch('Parent',hgtransform1,'Visible','off','VertexNormals',VertexNormals4,...
    'YData',YData4,...
    'XData',XData4,...
    'Vertices',Vertices4,...
    'Faces',Faces3,...
    'FaceColor',[1 1 1]);

% Create legend
legend1 = legend(axes1,'show');
set(legend1,'Location','NorthEast');

