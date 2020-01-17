function gTruth2XML(gTruthObject, outputFileName, datasetName)


docNode = com.mathworks.xml.XMLUtils.createDocument('dataset');

docRootNode = docNode.getDocumentElement;

nameNode = docNode.createElement('name');
nameNode.appendChild(docNode.createTextNode(datasetName));
docRootNode.appendChild(nameNode);


imagesSuperNode = docNode.createElement('images');
docRootNode.appendChild(imagesSuperNode);

for j = 1:numel(gTruthObject.LabelDefinitions.Name)
    
    for i = 1:numel(gTruthObject.LabelData.Time)
        
        if ~isempty(cell2mat(gTruthObject.LabelData{i,j}))
            
            imageNode = docNode.createElement('image');
            imageName = gTruthObject.DataSource.Source{i};
            imageNode.setAttribute('file',imageName);
            imagesSuperNode.appendChild(imageNode);
            
            boxNode = docNode.createElement('box');
            bbox = cell2mat(gTruthObject.LabelData{i,j});
            left = bbox(1,1); top = bbox(1,2);
            height = bbox(1,3); width = bbox(1,4);
            boxNode.setAttribute('top', string(top));
            boxNode.setAttribute('left', string(left));
            boxNode.setAttribute('width', string(width));
            boxNode.setAttribute('height', string(height));
            
            imageNode.appendChild(boxNode);
            labelNode = docNode.createElement('label');
            labelName = gTruthObject.LabelDefinitions{j,1};
            labelNode.appendChild(docNode.createTextNode(labelName));
            boxNode.appendChild(labelNode);
            
        end
        
        
    end
    
    xmlwrite(outputFileName, docNode);
end

