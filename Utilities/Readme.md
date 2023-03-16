# 

###### customAutomationClasses
This folder contains the class files for the 4 custom detectors, files form this folder will get copied over to the +vision/+labeler folder when dataPreProcessing.mlx is run


###### detectorsForCustomAutomation
This folder contains trained ACF object detectors for each of the 4 custom automation algorithms



`ACFDetectorTraining.m` : Helper function to train an ACF detector, inputs are the groundTruth object and a labelName as a string

`detectorTinyYolo2.mat` : tiny yolov2 onnx model retrained on the custom objects

`detectorYoloV2.mat` : trained yolo v2 network, designed in MATLAB

`gTruth2XML.m` : Optional MATLAB code file to convert groundTruth object data to an xml file

`gTruthResizedTest.mat` : ground truth exported from the labeler app for the resized images of test data

`gTruthResizedTrain.mat` : ground truth exported from the labeler app for the resized images of train data

`gTruthResizedVald.mat` : ground truth exported from the labeler app for the resized images of validation data

`groundTruthLabelingSessionRoboSubResizedTrain.mat` : Labeled ground truth session for all the data in the trainResized folder to be downloaded from : https://drive.google.com/open?id=1bhohhPoZy03ffbM_rl8ZUPSvJ5py8rM- 

`imageToVideo.m` : Helper function to convert image data to a video that can be used in Simulink

`importedTinyYoloLayers.mat` : tinyYOLO network exported from the deep network designer app after redesigning it according to the new image size and objects

`model.onnx` : tinyYOLOV2 onnx model downloaded from onnx model zoo : https://github.com/onnx/models 



 