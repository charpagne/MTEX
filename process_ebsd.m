function [grains,ebsd] = process_ebsd(fname,ci_t,gb_t,r_crit)

    %% load EBSD from ang file
    % crystal symmetry
    CS = {...
    'notIndexed',...
    crystalSymmetry('m-3m','mineral','Nickel','color','light blue')};
    fprintf('CS digested \n');

    % plotting convention
    setMTEXpref('xAxisDirection','east');
    setMTEXpref('zAxisDirection','outOfPlane');
    fprintf('plotting convention \n');
    % create an EBSD variable containing the data
    ebsd = loadEBSD_ang(fname,'convertEuler2SpatialReferenceFrame');
    % CS = {'notIndexed',crystalSymmetry('m-3m','mineral','Nickel')};
    % ebsd = loadEBSD_ang(fname,'convertEuler2SpatialReferenceFrame', 'CS', CS, 'ColumnNames', {'Euler1' 'Euler2' 'Euler3' 'x' 'y','meh','ci'},'Bunge','RADIANS');
    % ebsd = loadEBSD_generic(fname,CS,'convertEuler2SpatialReferenceFrame','ColumnNames',...
            % {'Euler1' 'Euler2' 'Euler3' 'x' 'y','meh','ci'},'Bunge','RADIANS');
    fprintf('file loaded \n');
    % make consistent with TSL
    % uncomment that if you need to flip image
    ebsd_ori = ebsd.rotations;
    ebsd = flipud(ebsd);
    ebsd.rotations = ebsd_ori;
    fprintf('flipped upside down \n');
    % num_px = size(ebsd,1);
    % fprintf('EBSD size %d pixels', num_px);

    %% clean up EBSD 
    % rm low-CI pixels
    ebsd_ok = ebsd(ebsd.ci > ci_t);
    % interpolate missing areas / data smoothing
    F = medianFilter;
    F.numNeighbours = 1;
    ebsd_s = smooth(ebsd_ok, F, 'fill');
    
    % segment grains
    [grains,ebsd_s.grainId,ebsd_s.mis2mean] = calcGrains(ebsd_s,'angle',gb_t*degree);
    fprintf('grains segmented \n');
    %% twin analysis
    % all boundaries
    gB = grains.boundary;
    gB_NiNi = gB('Nickel','Nickel');
    % definition of twin boundaries
    twb_rot = rotation('axis',Miller(1,1,1,ebsd.CS),'angle',60.0*degree);
    twb_id = angle(gB_NiNi.misorientation,twb_rot) < 5*degree;
    
    % segment twin boundaries and their vertices
    twb = gB_NiNi(twb_id);
    fprintf('twins defined \n');
    % merge twin boundaries
    [gr_ntw,parentId] = merge(grains,twb);
    fprintf('twins merged \n');
    % map new grain IDs after merging
    gr_id = grains.id;
    id_grid = ebsd_s.grainId;
    for i = 1:numel(gr_id)
        ind = ebsd_s.grainId == gr_id(i);
        id_grid(ind) = parentId(i);
    end
    ebsd_s.prop.grainId = id_grid;
    
    %% ppt analysis 
    % segment ppt as small grains
    ppt_id = gr_ntw.equivalentRadius <= r_crit;
    ppt = gr_ntw(ppt_id);

    %% Create figure
% figure1 = figure('Renderer','zbuffer','Color','none');

%% Fill figure
    plot(ppt, 'micronbar', 'off');
    set(gcf,'color','w');
    fig = gcf;
    fig.PaperPositionMode = 'auto';
    fprintf('plot ready for saving \n');


 