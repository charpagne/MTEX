clear all; close all;

% settings
gb_t = 10;
ci_t = 0.05;
r_cut = 301;
r_crit = 3.0;

%% Fetch files
% path to files
ang_dir = 'C:\Users\SteveJobs\Documents\MATLAB\toolbox\mtex-4.5.2\mtex-4.5.2\Ang_dir';

% files to fetch
get_files = fullfile('./Ang_dir','*.ang');
files = dir(get_files);

num_samples = length(files);

%%

for i = 1:num_samples
    fname = files(i).name;
    [grains,ebsd] = process_ebsd(fname,ci_t,gb_t,r_crit);
    iptsetpref('ImshowBorder','tight');
    set(gca,'box','off');
    set(gca,'xcolor','w','ycolor','w','xtick',[],'ytick',[]);
    axis off;
    set(gcf, 'PaperPositionMode', 'auto');
    saveas(gcf,['Slice_' num2str(i-1) '.tiff']);
end