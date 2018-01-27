function maxfreq2 = FFT(data,freq_ob,fs,ln)
    y = data(2,:)';
    N = size(y, 1); %number of samples
    freqStep = fs/N; % freq resolution in spectrum
    time = (0:N-1)/fs; % time resolution in time-domain
    y = y - mean (y); 
    Y = fft(y); % Spectrum
    Y = fftshift(Y);

    freq = freqStep*(-N/2:N/2-1);  
    %freq2 = freq(freq>=0);
    %Y2 = abs(Y(freq>=0));
    %use the following code for filtering low frequecies 
    freq2 = freq(freq>=0.8);
    Y2 = abs(Y(freq>=0.8));
    maxY2 = max(Y2);
    maxfreq2 = freq2(Y2==maxY2);
    
    % Plot data in time domain 
    figure;
    subplot(2,1,1); 
    plot(time, y, '.-');hold on;
    x = linspace(0,time(size(time,2)));
    plot(x,0*x);
    %title(['testJTS ',num2str(ln),' leaf-FFT']); 
    title(['sampling rate:',num2str(fs)]);
    xlabel('Time (seconds)'); 
    ylabel('Amplitude (V)'); 
    axis tight 
    hold off

    %plot FFT spectrum
    subplot(2,1,2); 
    plot(freq2, Y2, '.-b'); grid on;hold on;
    plot(maxfreq2,maxY2,'ro','LineWidth',1.5); %label max freq
    T1 = text(maxfreq2,maxY2-0.02,['FFT frequency:',num2str(maxfreq2),'Hz']);
    T2 = text(0,0,['observed frequency:',num2str(freq_ob),'Hz']);
    set(T1,'fontsize',14,'Color','k');
    set(T2,'fontsize',14,'Color','k');
    xlabel('Frequency (Hz)'); 
    ylabel('Magnitude (dB)'); 
    hold off;
end