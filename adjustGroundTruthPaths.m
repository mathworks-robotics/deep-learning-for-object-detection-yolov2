%% Run this script to adjust the paths for all the gTruth Data Objects
clc
clear



load('gTruthResizedVald.mat');

% original datasource path, do not edit
oldPathDataSource = convertCharsToStrings(gTruthResizedVal.DataSource);

% new datasource path, edit with the appropriate location
newPathDataSource = "C:\Users\abshanka\Documents\Matlab\dl-objectDetection\dataset\valResized";

alterPaths = {[oldPathDataSource newPathDataSource]};
unresolvedPaths = changeFilePaths(gTruthResizedVal,alterPaths);

cd Utilities
save('gTruthResizedVald.mat', 'gTruthResizedVal');
clear gTruthResizedVal
cd ..
%%


load('gTruthResizedTest.mat');

% original datasource path, do not edit
oldPathDataSource = "C:\Users\abshanka\Documents\Matlab\dl-objectDetection\dataset\testResized";
% new datasource path
newPathDataSource = "C:\Users\abshanka\Documents\Matlab\dl-objectDetection\dataset\testResized";
alterPaths = {[oldPathDataSource newPathDataSource]};
unresolvedPaths = changeFilePaths(gTruthResizedTest,alterPaths);

cd Utilities
save('gTruthResizedTest.mat', 'gTruthResizedTest');
clear gTruthResizedTest
cd ..
%%

load('gTruthResizedTrain.mat');

% your original datasource path
oldPathDataSource = convertCharsToStrings(gTruthResizedTrain.DataSource);
% new datasource path
newPathDataSource = "C:\Users\abshanka\Documents\Matlab\dl-objectDetection\dataset\trainResized";

alterPaths = {[oldPathDataSource newPathDataSource]};
unresolvedPaths = changeFilePaths(gTruthResizedTrain,alterPaths);

cd Utilities
save('gTruthResizedTrain.mat', 'gTruthResizedTrain');
clear gTruthResizedTrain
cd ..
