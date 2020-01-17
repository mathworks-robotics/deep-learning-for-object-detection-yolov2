Copyright 2019 The MathWorks, Inc.


### dataPreProcessing.mlx 

##### Pre-Requisites:
1. Add appropriate folders and files in this repository to the path, run `addFilesToPath.m` to do this
2. Dowload the data set from this shared google drive : https://drive.google.com/open?id=1bhohhPoZy03ffbM_rl8ZUPSvJ5py8rM-

##### About
This code file is discussed in the video - Data Pre-Processing for Deep Leanring 

This script will pre process data, to prepare for deep learning training. Run this script before running any other script as this will load the appropriate data.

### designandtrain.mlx

##### Pre-Requisites:
1. Add appropriate folders and files in this repository to the path, run `addFilesToPath.m` to do this
2. Run `dataPreProcessing.mlx`

##### About
This code file is discussed in the video - Design and Train a YOLOv2 Network in MATLAB

This file contains code and other information to design a YOLOv2 network layer by layer in MATLAB

### importPreTrainedNetwork.mlx

##### Pre-Requisites:
1. Add appropriate folders and files in this repository to the path, run `addFilesToPath.m` to do this
2. Run `dataPreProcessing.mlx`

##### About
This code file is discussed in the video - Import Pre-Trained Deep Learning Networks in MATLAB 

This script details about the process of importing the trained tiny yolo v2 onnx model and importing in MATLAB. It further shows the process of retrianing the network on custom objects.

### deployToNVIDIAJetson.mlx

##### Pre-Requisites:
1. Add appropriate folders and files in this repository to the path, run `addFilesToPath.m` to do this

##### About
This code file is discussed in the video - Deploy YOLOv2 to an NVIDIA Jetson with GPU Coder.

This script covers the steps and additional libraries needed to deploy MATLAB code - `roboSubPredict.mlx` on NVIDIA Jetson using GPU coder.

### roboSubPredict.mlx 

##### About
This function will be converted to CUDA code and deployed to the Jetson and it gets called in `deploytoNVIDIAJetson.mlx`. It loads an inference model of the YOLOv2 object detction network trained with `designAndTrain.mlx`.


### AnchorBoxes.m

##### Pre-Requisites:
1. Add appropriate folders and files in this repository to the path, run `addFilesToPath.m` to do this
2. Run `dataPreProcessing.mlx`

##### About
This script computes anchor boxes used in designing the networks in this example. 
Modify appropriates and run if anchor boxes need to be recomputed for a different data set or differnet sized images.
