classdef yellowBuoyACFDetector < vision.labeler.AutomationAlgorithm

    properties(Constant)
        
        % Name: Give a name for your algorithm.
        Name = 'Yellow Buoy ACF Detector';
        
        % Description: Provide a one-line description for your algorithm.
        Description = 'Use this algorithm to automatically label Yellow Buoys for a RoboSub Dataset';
        
        % UserDirections: Provide a set of directions that are displayed
        %                 when this algorithm is invoked. The directions
        %                 are to be provided as a cell array of character
        %                 vectors, with each element of the cell array
        %                 representing a step in the list of directions.
        UserDirections = {...
            ['Automation algorithms are a way to automate manual labeling ' ...
            'tasks.'], ...
            ['ROI Selection: This algorithm will automatically annotate'...
            'images with rectuangular labels. Prior to Automation create a for'...
            'the Yellow Buoy ensure that its type is set to rectangle.'], ...
            ['Run: Press RUN to run the automation algorithm. '], ...
            ['Review and Modify: Review automated labels over the interval ', ...
            'using playback controls. Modify/delete/add ROIs that were not ' ...
            'satisfactorily automated at this stage. If the results are ' ...
            'satisfactory, click Accept to accept the automated labels.'], ...
            ['Change Settings and Rerun: If automated results are not ' ...
            'satisfactory, you can try to re-run the algorithm with ' ...
            'different settings. In order to do so, click Undo Run to undo ' ...
            'current automation run, click Settings and make changes to ' ...
            'Settings, and press Run again.'], ...
            ['Accept/Cancel: If results of automation are satisfactory, ' ...
            'click Accept to accept all automated labels and return to ' ...
            'manual labeling. If results of automation are not ' ...
            'satisfactory, click Cancel to return to manual labeling ' ...
            'without saving automated labels.']};
    end
    
    %---------------------------------------------------------------------
    % Step 2: Define properties to be used during the algorithm. These are
    % user-defined properties that can be defined to manage algorithm
    % execution.
    properties
     %SelectedLabelName Selected label name
        %   Name of selected label. Vehicles detected by the algorithm will
        %   be assigned this variable name.
        SelectedLabelName
        
        %Detector Detector
        %   Pre-trained yellowBuoy detector, an object of class
        %   acfObjectDetector.
        yellowBuoyDetector
        
        %Score Threshold
        ScoreThreshold = 65;
        
      
    end
    
    %----------------------------------------------------------------------
    % Setup
    %----------------------------------------------------------------------
    methods
        
        function flag = supportsReverseAutomation(~)            
            flag = false;
        end  
        
        function isValid = checkLabelDefinition(~, labelDef)
            
            % Only Rectangular ROI Label definitions are valid for the
            % yellowBuoy Detector.
            isValid = labelDef.Type==labelType.Rectangle;
        end
        
        function isReady = checkSetup(algObj)
            
            % Is there one selected ROI Label definition to automate.
            isReady = ~isempty(algObj.SelectedLabelDefinitions);
        end
        
        function settingsDialog(algObj)
            
            prompt = {'Set the threshold value from 1-100'};
            dlgTitle = 'Threshold';
            dims = [1 25];
            definput = {'65'};
            algObj.ScoreThreshold = str2double(inputdlg(prompt,dlgTitle,dims,definput));
  
        end
    end
   %----------------------------------------------------------------------
   % Execution
   %---------------------------------------------------------------------- 
    
    methods
        function initialize(algObj,~)
            
            % Store the name of the selected label definition. Use this
            % name to label the detected vehicles.
            algObj.SelectedLabelName = algObj.SelectedLabelDefinitions.Name;
            
            % Initialize the vehicle detector with a pre-trained model.
            
            data = load('yellowBuoyDetectorValData.mat');
            algObj.yellowBuoyDetector = data.yellowBuoyDetector;
        end
        

        function autoLabels = run(algObj, I)
            
            autoLabels = [];
                   
            % Detect vehicles using the initialized vehicle detector.
            [bboxes, scores] = detect(algObj.yellowBuoyDetector, I,...
                'SelectStrongest', true);
            
            [selectedBbox, selectedScore] = selectStrongestBbox(bboxes, scores);
            
            % Reject detections with detection score lower than
            % ScoreThreshold.
            detectionsToKeepIdx = (selectedScore > algObj.ScoreThreshold);
            selectedBbox = selectedBbox(detectionsToKeepIdx,:);
            
            if ~isempty(selectedBbox)
                % Add automated labels at bounding box locations detected
                % by the vehicle detector, of type Rectangle having name of
                % the selected label.
                autoLabels.Name     = algObj.SelectedLabelName;
                autoLabels.Type     = labelType.Rectangle;
                autoLabels.Position = selectedBbox;
            else
                autoLabels = [];
            end
        end
    end
    

end