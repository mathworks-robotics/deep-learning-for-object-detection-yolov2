function [detector] = ACFDetectorTraining(gTruth,labelName)

% Copyright 2019 The MathWorks, Inc
% Inputs: 
%   gTruth: Ground Truth Data Object
%   labelName: name of the label as a string
%
%
% Outputs:
%   detector: ACF Object Detector data object
%---------------------------------------------------------------------------------

gTruthSpecificLabel = selectLabels(gTruth,labelName);

if ~isfolder(fullfile('TrainingData'))
    mkdir TrainingData
end 

trainingData = objectDetectorTrainingData(gTruthSpecificLabel,'SamplingFactor',1,...
'WriteLocation','TrainingData');

detector = trainACFObjectDetector(trainingData,'NumStages',5);
end

