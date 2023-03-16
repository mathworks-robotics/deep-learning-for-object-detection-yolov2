function imageToVideo(imageFolderPath)

% Copyright 2023 The MathWorks, Inc
% 
% Converts a folder of images to a video that can be used in a Simulink
% model
%
% Requires that you have already downloaded the raw data from here:
% https://drive.google.com/drive/u/1/folders/1bhohhPoZy03ffbM_rl8ZUPSvJ5py8rM-
%
% Inputs: 
%   imageFolderPath: the full path to the 'testResized' folder of
%   'RoboSubFootage' passed as a char array
% ex: 'C:\Users\name\Desktop\RoboSubFootage\testResized'
%
%--------------------------------------------------------------------------
    allFilesStruct = dir(fullfile(imageFolderPath, '2*.jpeg'));
    imageNames = {allFilesStruct.name};

    outputVideo = VideoWriter('testDataRoboSub.avi');
    open(outputVideo);

    for i = 1:length(imageNames)
       img = imread(fullfile(imageFolderPath,imageNames{i}));
       writeVideo(outputVideo,img);
    end

    close(outputVideo);
end