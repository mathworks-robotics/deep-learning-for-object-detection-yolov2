summary(trainingData);

% Combine all the ground truth boxes into one array.
allBoxes = vertcat(gTruthResizedTrain.LabelData.navGate{:},gTruthResizedTrain.LabelData.greenBuoy{:},gTruthResizedTrain.LabelData.redBuoy{:},gTruthResizedTrain.LabelData.yellowBuoy{:});
% Plot the box area versus box aspect ratio.
aspectRatio = allBoxes(:,3) ./ allBoxes(:,4);
area = prod(allBoxes(:,3:4),2);

figure
scatter(area,aspectRatio)
xlabel("Box Area")
ylabel("Aspect Ratio (width/height)");
title("Box area vs. Aspect ratio")


% Select the number of anchor boxes.
numAnchors = 4;

% Cluster using K-Medoids.
[clusterAssignments, anchorBoxes, sumd] = kmedoids(allBoxes(:,3:4),numAnchors,'Distance',@iouDistanceMetric);

% Display estimated anchor boxes. The box format is the [width height].
anchorBoxes


% Display clustering results.
figure
gscatter(area,aspectRatio,clusterAssignments);
title("K-Mediods with "+numAnchors+" clusters")
xlabel("Box Area")
ylabel("Aspect Ratio (width/height)");
grid

% Count number of boxes per cluster. Exclude the cluster center while
% counting.
counts = accumarray(clusterAssignments, ones(length(clusterAssignments),1),[],@(x)sum(x)-1);

% Compute mean IoU.
meanIoU = mean(1 - sumd./(counts))

maxNumAnchors = 15;
for k = 1:maxNumAnchors
    
    % Estimate anchors using clustering.
    [clusterAssignments, anchorBoxes, sumd] = kmedoids(allBoxes(:,3:4),k,'Distance',@iouDistanceMetric);
    
    % Compute mean IoU.
    counts = accumarray(clusterAssignments, ones(length(clusterAssignments),1),[],@(x)sum(x)-1);
    meanIoU(k) = mean(1 - sumd./(counts));
end

figure
plot(1:maxNumAnchors, meanIoU,'-o')
ylabel("Mean IoU")
xlabel("Number of Anchors")
title("Number of Anchors vs. Mean IoU")

function dist = iouDistanceMetric(boxWidthHeight,allBoxWidthHeight)
% Return the IoU distance metric. The bboxOverlapRatio function
% is used to produce the IoU scores. The output distance is equal
% to 1 - IoU.

% Add x and y coordinates to box widths and heights so that
% bboxOverlapRatio can be used to compute IoU.
boxWidthHeight = prefixXYCoordinates(boxWidthHeight);
allBoxWidthHeight = prefixXYCoordinates(allBoxWidthHeight);

% Compute IoU distance metric.
dist = 1 - bboxOverlapRatio(allBoxWidthHeight, boxWidthHeight);
end

function boxWidthHeight = prefixXYCoordinates(boxWidthHeight)
% Add x and y coordinates to boxes.
n = size(boxWidthHeight,1);
boxWidthHeight = [ones(n,2) boxWidthHeight];
end