close all
clear all
%creating new sesh
EOGin = daq.createSession('ni');
%200 data pt/sec as discussed.
EOGin.Rate = 10;
EOGin.DurationInSeconds = 20;
% h=actxserver('WScript.Shell');
% h.AppActivate('chrome');
% pause(1);
% h.SendKeys('https://www.youtube.com/watch?v=sOnqjkJTMaA');
% pause(1);
% h.SendKeys('{enter}');
% pause(10);
% h.SendKeys('3');
% pause(1);
% h.SendKeys('{RIGHT 7} ');
% pause(1);
% h.SendKeys(' ');
%64-bit MATLAB code:
addAnalogInputChannel(EOGin,'Dev1',0,'voltage');
%channel ai0 is now ready to collect.
in=input('Type g to collect data: ','s');
while(strcmp(in,'g'));
    [data,time] = EOGin.startForeground;
    data2=zeros(EOGin.DurationInSeconds*EOGin.Rate,1);
    for i=1:1:EOGin.DurationInSeconds*EOGin.Rate;
        data2(i)=data(i)-data(1);
    end
    plot(time,data2)
    min10 = 0.001;
    max10 = 0.05;
    min30 = 0.07;
    max30 = 0.14;
    min50 = 0.15;
    max50 = 0.20;
    minn10 = -0.001;
    maxx10 = -0.05;
    minn30 = -0.07;
    maxx30 = -0.14;
    minn50 = -0.15;
    maxx50 = -0.2;
    A=data2;
    M = zeros(20,1);
    count = 1;
    i=1;
    while (count<21)
             if (A(i,1) > min10 && A(i,1) < max10)    
                if (count == 1 || M(count-1,1) == 1)
                    M(count,1) = 1;
                    count = count+1;
                else 
                    count = 1;
                    M = zeros(20,1);
                    M(1,1) = 1;
                    count = count+1;
                end
            elseif (A(i,1) > min30 && A(i,1) <max30)
                if (count == 1 || M(count-1,1) == 2)
                    M(count,1) = 2;
                    count = count+1;
                else 
                    count = 1;
                    M = zeros(20,1);
                    M(1,1) = 2;
                    count = count+1;
                end
            elseif (A(i,1) > min50 && A(i,1) <max50)
                if (count == 1 || M(count-1,1) == 3)
                    M(count,1) = 3;
                    count = count+1;
                else
                    count = 1;
                    M = zeros(20,1);
                    M(1,1) = 3;
                    count = count+1;
                end
            elseif (A(i,1) < minn10 && A(i,1) >maxx10)
                if (count == 1 || M(count-1,1) == -1)
                    M(count,1) = -1;
                    count = count+1;
                else
                    count = 1;
                    M = zeros(20,1);
                    M(1,1) = -1;
                    count = count+1;
                end
             elseif (A(i,1) < minn30 && A(i,1) >maxx30)
                if (count == 1 || M(count-1,1) == -2)
                    M(count,1) = -2;
                    count = count+1;
                else
                    count = 1;
                    M = zeros(20,1);
                    M(1,1) = -2;
                    count = count+1;
                end
             elseif (A(i,1) < minn50 && A(i,1) >maxx50)
                if (count == 1 || M(count-1,1) == -3)
                    M(count,1) = -3;
                    count = count+1;
                else
                    count = 1;
                    M = zeros(20,1);
                    M(1,1) = -3;
                    count = count+1;
                end
             else
               M = zeros(20,1);
               count = 1; 
             end
        if i==EOGin.DurationInSeconds*EOGin.Rate;
            count=21;
            M=zeros(20,1);
        end
        i=i+1;
    end
%     n=M(20,1);
%     h.AppActivate('notepad');
%     if n==1
%         h.SendKeys('f');
%     elseif n==-1
%         h.SendKeys('{ESC}');
%     elseif n==2
%         h.SendKeys('+>');
%     elseif n==-2
%        h.SendKeys('+<');
%     elseif n==3
%         h.SendKeys('{UP 20}');
%     elseif n==-3
%         h.SendKeys('{DOWN 20}');
% %     elseif n==0
% %         h.SendKeys('0');
%     else
% %         h.SendKeys('problem');
%     end
%     in=input('Type g to continue collecting data: ','s');
end;