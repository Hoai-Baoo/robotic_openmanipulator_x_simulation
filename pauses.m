function pauses(delay,t0)
%PAUSES is a modified pause function that provides more accurate time delays than PAUSE.
% Syntax:
%   pauses(delay)
%   pauses(delay, tref)
% Parameters:
%   delay       a time duration in seconds.
%   tref        an optional point in time from which the delay should be counted.
% Examples:
%   t0=tic; pauses(0.022,t0); toc(t0)
%
%   % Test the accuracy try this one-liner:
%   pauses(0); ii=1:300; d=ii/12345; for i=ii; t0=tic; pauses(d(i),t0); t(i)=toc(t0); end; fprintf('3 sigma accuracy = %.6f ms\n',std(t-d)*3000);
%
% ASK 2016/03/03

persistent sys_delay;

if nargin<2
   t0=tic;
end

if isempty(sys_delay)
   %%
   sys_delay = 0;
   % Use this function itself to calibrate system delays on its first call   
   N=66; delay=0.002+0.002*rand(1,N); % use approx. 0.2 sec on first call
   %N=333; delay=0.002+0.002*rand(1,N); % use approx. 1 sec on first call
   dt=zeros(1,N);
   pauses(0); % JIT initialization
   for k=1:N
      t1=tic; pauses(delay(k),t1); dt(k)=toc(t1);
   end
   dt = (dt-delay);   
   sys_delay = mean(dt);
end

if 0 % enable to use pause() instead of java.lang.Thread.sleep()
   sys_step = 0.015; % ~ 3 sigma accuracy of pause()
   if delay - toc(t0) > 3*sys_step
      pause(delay - toc(t0) - 2*sys_step); % this will realy stop Matlab
   end
else
   sys_step = 0.002; % ~ 6 sigma accuracy of java.lang.Thread.sleep()
   if delay - toc(t0) > 3*sys_step
      java.lang.Thread.sleep((delay - toc(t0) - 2*sys_step)*1000); % this will realy stop Matlab
   end
end
while delay - toc(t0) > sys_delay
   % Do nothing...
end
return
end
