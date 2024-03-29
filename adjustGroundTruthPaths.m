%% Run this script to adjust the paths for all the gTruth Data Objects
clc
clear



load('gTruthResizedVald.mat');

% original datasource path, do not edit
oldPathDataSource = fullfile("C:","Sandbox","DLODFX","deepLearningForObjectDetection","RoboSubFootage","valResized");

% new datasource path, edit with the appropriate location
newPathDataSource = fullfile("RoboSubFootage","valResized");

alterPaths = {[oldPathDataSource newPathDataSource]};
unresolvedPaths = changeFilePaths(gTruthResizedVal,alterPaths);

cd Utilities
save('gTruthResizedVald.mat', 'gTruthResizedVal');
clear gTruthResizedVal
cd ..
%%


load('gTruthResizedTest.mat');

% original datasource path, do not edit
oldPathDataSource = fullfile("C:","MYWORK","deep-learning-for-object-detection","ObjectDetectionDLFX","RoboSubFootage","testResized");
% new datasource path
newPathDataSource = fullfile("RoboSubFootage","testResized");

alterPaths = {[oldPathDataSource newPathDataSource]};
unresolvedPaths = changeFilePaths(gTruthResizedTest,alterPaths);

cd Utilities
save('gTruthResizedTest.mat', 'gTruthResizedTest');
clear gTruthResizedTest
cd ..
%%

load('gTruthResizedTrain.mat');

% your original datasource path
oldPathDataSource = fullfile("C:","MYWORK","deep-learning-for-object-detection","ObjectDetectionDLFX","RoboSubFootage","trainResized");
% new datasource path
newPathDataSource = fullfile("RoboSubFootage","trainResized");

alterPaths = {[oldPathDataSource newPathDataSource]};
unresolvedPaths = changeFilePaths(gTruthResizedTrain,alterPaths);

cd Utilities
save('gTruthResizedTrain.mat', 'gTruthResizedTrain');
clear gTruthResizedTrain
cd ..
