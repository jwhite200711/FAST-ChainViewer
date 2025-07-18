function L2chainsMatTotAll = addFileChains(ChGroup, fnames)

% NOTE: ENSURE NUMBERING IS CONSISTENT WITH linksMatrix

% Add chains from a file that has been passed over by algorithm light. Note
% that this function will NOT update linksMatrix (so no automatic
% connections). Only L2chainsMatTot will be updated. If the last file has
% also not been done, add the last file FIRST 
% (addLastFileChains.m) before you run this function.
% Note that this function will not add L2 spikes to the background chains. For that
% you have to run redoBackground.m

% fnames is a cell array of left-out file names

L2chainsMatTotAll = [];

addpath([pwd '/automaticStep/']);
addpath([pwd '/toolsFunctions/']);

% pathwayBs = ['H:/Clustering/Dhanashri/'];
% pathwayData = 'U:/Data/Dhanashri/';

pathwayBs = 'C:/SW233/';
pathwayData = 'X:/SW233/';

pathwayLS = [pathwayBs 'ChGroup_' num2str(ChGroup) '/'];

load([pathwayBs 'ChGroup_' num2str(ChGroup) '/L2chainsMatTotAll.mat']);
L2Background = L2chainsMatTotAll(end);
L2chainsMatTotAll = L2chainsMatTotAll(1:end-1);

% Get principal components, energy, peak-valley diff etc for L2 chains
allL2wv = double(cat(1, L2chainsMatTotAll.wv))*1.95e-7; 
PCs = zeros(size(allL2wv,2), size(allL2wv,3), size(allL2wv,3));
for ch = 1 : size(allL2wv,2)
    PCs(ch,:,:) = pca(squeeze(allL2wv(:,ch,:)));
end

% Get the firstFile to calculate tOffset
[filesTrue, ~] = filesIdentifier(pathwayData, ChGroup);
firstFile = filesTrue(1).name; 

colors = [
    0.00  0.00  1.00
    0.00  0.50  0.00
    1.00  0.00  0.00
    0.00  0.75  0.75
    0.75  0.00  0.75
    0.75  0.75  0.00
    0.25  0.25  0.25
    0.75  0.25  0.25
    0.95  0.95  0.00
    0.25  0.25  0.75
    0.00  1.00  0.00
    0.76  0.57  0.17
    0.54  0.63  0.22
    0.34  0.57  0.92
    1.00  0.10  0.60
    0.88  0.75  0.73
    0.10  0.49  0.47
    0.66  0.34  0.65
    0.99  0.41  0.23
    ];


for f = 1 : length(fnames)
    lastnum = L2chainsMatTotAll(end).num;
    
    fname = fnames{f};
    fpath = [pathwayData fname];
    chains = getAllMergedChains(fpath, ChGroup, 1, 1);
    
    if ~isempty(chains(1).num) %SW
        
        
    L2chains = getSomeLevel2Spikes(fpath, ChGroup, cellfun(@num2str, num2cell([chains.num]), 'UniformOutput', false), 1);
    
    % Only extract chains that meet the amplitude criteria
    [~, extractInd] = chainsExtractionAlgo(chains);
        
    % Calc offset @ 30 kHz from firstFile
    tOffset = double(str2num(['uint64(' fname ')'])) - double(str2num(['uint64(' firstFile ')']));
    tOffset = (tOffset * 1e-7) * 30000;
    
    count = 1;
    chainsMatTotTmp = struct;

    metrix = []; %SW
    metrix = [metrix; getChainMetrix(chains, L2chains, ChGroup, pathwayData, fname, fname)']; %SW

    % Chain by chain
    for c = 1 : length(chains)
        % First check if chain is already there in L2chainsMatTotAll
        allfn = cellfun(@(x,y) strcat(x, y), [L2chainsMatTotAll.names], {L2chainsMatTotAll.trueNumber}, 'UniformOutput', false);
        chainfn = strcat(fname, num2str(chains(c).num));
        
        if ~any(strcmp(chainfn, allfn))
            % New chain num
            chainsMatTotTmp(count).num = lastnum + chains(c).num + 1;
            
            % Times in hours from firstFile            
            L2Times = double(L2chains(c).times) + tOffset;
            chainsMatTotTmp(count).times =  L2Times/(30000 * 3600); % convert from 30000 Hz to hours
            
            chainsMatTotTmp(count).amps = L2chains(c).amps;
            chainsMatTotTmp(count).wv = L2chains(c).wv;
            chainsMatTotTmp(count).channel = ChGroup;
            chainsMatTotTmp(count).trueNumber = L2chains(c).num;
            chainsMatTotTmp(count).timeBegin = (double(chains(c).times(1)) + tOffset)/(30000 * 3600);
            chainsMatTotTmp(count).names = {fname};
            chainsMatTotTmp(count).color = colors(randi(size(colors, 1)), :);
            chainsMatTotTmp(count).numSpikes = length(chains(c).times); %SW
            chainsMatTotTmp(count).firstFile = {fname}; %SW
            chainsMatTotTmp(count).isi = metrix(c).isi; %SW
            
            % Get features
            L2wv = L2chains(c).wv;
            chainsMatTotTmp(count).features.energy = getEnergy(L2wv);
            chainsMatTotTmp(count).features.valley = getValley(L2wv, 32);
            chainsMatTotTmp(count).features.width = getSpikeWidth(L2wv, 32);
            [chainsMatTotTmp(count).features.pc1, chainsMatTotTmp(count).features.pc2] = getPCs(double(L2wv)*1.95e-7, PCs);  

            count = count + 1;
        end
    end
    chainsMatTotTmp = chainsMatTotTmp(extractInd);
    L2chainsMatTotAll = [L2chainsMatTotAll; chainsMatTotTmp(:)];
    end %SW
end

L2chainsMatTotAll = [L2chainsMatTotAll; L2Background];
    
   

