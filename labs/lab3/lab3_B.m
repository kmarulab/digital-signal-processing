[y, Fs] = audioread("BeeMoved.flac");

y_filt = zeros(size(y,1), 8, size(y,2)); 
% % FIR Filters - Equiripple
% All filters designed using filterDesigner and exported to workspace as
% variable
y_filt(:,1,:) = filtfilt(bp_0_3 , 1 , y);
y_filt(:,2,:) = filtfilt(bp_3_6 , 1 , y);
y_filt(:,3,:) = filtfilt(bp_6_9 , 1 , y);
y_filt(:,4,:) = filtfilt(bp_9_12, 1 , y);
y_filt(:,5,:) = filtfilt(bp_12_15,1 , y);
y_filt(:,6,:) = filtfilt(bp_15_18,1 , y);
y_filt(:,7,:) = filtfilt(bp_18_21,1 , y);
y_filt(:,8,:) = filtfilt(bp_21_24,1 , y);

weights = [1.4 1.2 1.0 0.9 0.8 0.7 0.8 1.2].';  

y_sum = reshape(y_filt,[],8) * weights;          
y_sum = reshape(y_sum,[],size(y,2));            

y_sum = y_sum ./ max(abs(y_sum),[],'all');
% soundsc(y_sum, Fs);  

%IIR Filters - Chebyshev
y_filt_iir = zeros(size(y,1), 5, size(y,2)); 
y_filt_iir(:,1,:) = sosfilt(sos_0_5 , y);  
y_filt_iir(:,2,:) = sosfilt(sos_5_10 , y);   
y_filt_iir(:,3,:) = sosfilt(sos_10_15 , y);
y_filt_iir(:,4,:) = sosfilt(sos_15_20 , y);
y_filt_iir(:,5,:) = sosfilt(sos_20_25 , y); 
weights = [1.4 1.2 1.0 0.9 0.8].';

ysum = reshape(y_filt_iir,[],5) * weights;
ysum = reshape(ysum,[],size(y,2));
ysum = ysum ./ max(abs(ysum),[],'all'); 
soundsc(ysum,Fs);