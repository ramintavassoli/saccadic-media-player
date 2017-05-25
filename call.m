function [M,x] = call(src,event)
min10 = 0;
max10 = 0;
min30 = 0;
max30 = 0;
min50 = 0;
max50 = 0;
minn10 = 0;
maxx10 = 0;
minn30 = 0;
maxx30 = 0;
minn50 = 0;
maxx50 = 0;
    A = event.data(1);
    M = zeros(20,1);
    x = 0;
    count = 1; 
    while (count<21)
        for i = 1:1:100;
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
            elseif (A(i,1) > minn10 && A(i,1) <maxx10)
                if (count == 1 || M(count-1,1) == 4)
                    M(count,1) = -1;
                    count = count+1;
                else
                    count = 1;
                    M = zeros(20,1);
                    M(1,1) = -1;
                    count = count+1;
                end
             elseif (A(i,1) > minn30 && A(i,1) <maxx30)
                if (count == 1 || M(count-1,1) == 5)
                    M(count,1) = -2;
                    count = count+1;
                else
                    count = 1;
                    M = zeros(20,1);
                    M(1,1) = -2;
                    count = count+1;
                end
             elseif (A(i,1) > minn50 && A(i,1) <maxx50)
                if (count == 1 || M(count-1,1) == 6)
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
         end
    end
    x=M(20,1);
  %====================================================================

    
        