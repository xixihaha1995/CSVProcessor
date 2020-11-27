clear all; close all; clc;

%% Folder, csvFilesList
directory = '\\dellnas\lwu4\Folders\Documents\MATLAB\';
cd(directory);
csvFilesList = dir('*Table.csv');
%%Output File Name
outPut = strcat(directory,'out.csv');
outFile = fopen(outPut,'a');
fprintf(outFile,'FileName, HeatElec, HeatGas, CoolElec\n');
%% process each csv file
for k = 1:length(csvFilesList)
    currentCSVName = csvFilesList(k).name;
    fullFileName = fullfile(directory, currentCSVName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    
    % get three data
    heatElec = csvread(currentCSVName,  49, 2,[49,2,49,2]);
    heatGas = csvread(currentCSVName,  49, 3,[49,3,49,3]);
    coolElec = csvread(currentCSVName,  50, 2,[50,2,50,2]);
    
    %store data into csv
%     numFromFileName = sscanf(currentCSVName,'%f');
%     col = 1+ 5*(10*numFromFileName(1)-1)/2;
%     row = 1+ (10*numFromFileName(2) -1)/2;
%     heatElecRC = [row, col];
%     heatGasRC = [row, col + 1];
%     coolElecRC = [row, col + 2];
%     
%     csvwrite(outPut, heatElec, heatElecRC);
%     close();
%     csvwrite(outPut, heatGas, heatGasRC);
%     close();
%     csvwrite(outPut, coolElec, coolElecRC);
%     close();
    
    outFile = fopen(outPut,'a');
    fprintf(outFile,'%s,',[currentCSVName]);
    fprintf(outFile,'%d, %d, %d\n',[heatElec;heatGas;coolElec]);
    fclose(outFile);
end