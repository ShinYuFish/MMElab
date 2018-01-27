clc;
clear ;
close all;
%% load data
fid = fopen('.txt','r');
data_8= fscanf(fid,'%f',[2,inf]);
fclose(fid);

fid = fopen('.txt','r');
data_6= fscanf(fid,'%f',[2,inf]);
fclose(fid);

%% static calibration
height = ['user input'];
pressure = [mean(data_40(2,:)),mean(data_55(2,:)),mean(data_66(2,:))];

calibration(height,pressure);
%% FFT
count_ob = ['user input']; %count
p = 60; %sec
freq_ob = count_ob/p; %observation frequency
maxfreq2_8 = FFT(data_8,freq_ob(1),fs,8);
maxfreq2_6 = FFT(data_6,freq_ob(2),fs,6);