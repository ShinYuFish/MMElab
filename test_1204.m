clc;
clear ;
%sampling rate setting:10kHz
%% Read pressure data from files
fid = fopen('C:\Users\user\Desktop\2017.12.04\8leaf_130per60s.txt','r');
data_8= fscanf(fid,'%f',[2,inf]);
fclose(fid);

fid = fopen('C:\Users\user\Desktop\2017.12.04\6leaf_105per60s.txt','r');
data_6= fscanf(fid,'%f',[2,inf]);
fclose(fid);

%% observation data for comparison with pressure guage
count_ob = [130 105]; %count
p = 60; %sec
freq_ob = count_ob/p; %observation frequency

%% adjust sampling number and FFT section by changing data length  
% data_8 = data_8(:,1:171:171*500); %170.76=fs/oscillation high frequency
% data_6 = data_6(:,1:171:171*500);
data_8 = data_8(:,1:50000);
data_6 = data_6(:,1:50000);
fs = size(data_8,2)/(data_8(1,end)-data_8(1,1)); %sampling rate

%% FFT
maxfreq2_8 = FFT(data_8,freq_ob(1),fs,8);
maxfreq2_6 = FFT(data_6,freq_ob(2),fs,6);
