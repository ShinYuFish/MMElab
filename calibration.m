function calibration(height,pressure)
    figure;
    p = polyfit(height,pressure,1);
    x1 = linspace(30,70);
    y1 = polyval(p,x1);
    plot(x1,y1);
    title('1127 Static Calibration');
    xlabel('water height (mm)');
    ylabel('voltage(mV)');
    hold on
    grid on

    for i = 1:length(height)
        plot(height(i),pressure(i),'ro');
        hold on
    end

    %get correlation coefficient
    p_data(1:3) = polyval(p,height(1:3));
    R = corrcoef(p_data(1:3),pressure(1:3));
    t1  =text (35,0.5, {['y =',num2str(p(1)),'x ',num2str(p(2))],['R = ',num2str(R(1,2))]});
    set(t1,'fontsize',14);


    p2 = polyfit(pressure,height,1);
    x2 = linspace(0.3,0.7);
    y2 = polyval(p2,x2);
    figure
    plot(x2,y2);
    title('1127 Static Calibration');
    xlabel('voltage(mV)');
    ylabel('water height(mm)');
    hold on
    grid on

    for i = 1:length(height)
        plot(pressure(i),height(i),'ro');
        hold on
    end

    %get correlation coefficient
    p2_data(1:3) = polyval(p2,pressure(1:3));
    R2 = corrcoef(p2_data(1:3),height(1:3));
    t2  =text (0.4,65, {['y =',num2str(p2(1)),'x +',num2str(p2(2))],['R = ',num2str(R2(1,2))]});
    set(t2,'fontsize',14);


end