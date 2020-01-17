function addFilestoPath

% Get the current course folder
rootDir = fileparts(mfilename('fullpath'));

% Add folders to the path
addpath(genpath(rootDir));
% rmpath(fullfile('Utilities','customAutomationClasses'));
