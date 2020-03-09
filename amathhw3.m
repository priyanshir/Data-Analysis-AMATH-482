%% CAMERA 1 (camera 1 test 1) cam1_1 DONEE
load('cam1_1.mat')
pointTracker = vision.PointTracker;
numFrames = size(vidFrames1_1,4);
points = [319,228];
initialize(pointTracker, points, vidFrames1_1(:,:,:,1));
test1cam1 = zeros(2,numFrames);
for j = 1:numFrames
    X = vidFrames1_1(:,:,:,j);
    test1cam1(:,j) = step(pointTracker, X);
%     imshow(X);
%     hold on
%     plot(test1cam1(1,j), test1cam1(2,j), 'ro')
%     pause(0.1)
end
time11 = [34:194]; %trimmed length of 160
trimmed1test1 = test1cam1(:,time11);
trimmed1test1(1,:) = trimmed1test1(1,:) - mean(trimmed1test1(1,:));
trimmed1test1(2,:) = trimmed1test1(2,:) - mean(trimmed1test1(2,:));

%% CAMERA 2 Test 1 cam2_1 DONEE
load('cam2_1.mat')
pointTracker = vision.PointTracker;
numFrames = size(vidFrames2_1,4);
points = [309,288]; %based on ginput(1) after imshow for cam2_1
initialize(pointTracker, points, vidFrames2_1(:,:,:,1));
test1cam2 = zeros(2,numFrames);
for j = 1:numFrames
    X = vidFrames2_1(:,:,:,j);
    test1cam2(:,j) = step(pointTracker, X);
%     imshow(X);
%     hold on
%     plot(test1cam2(1,j), test1cam2(2,j), 'ro')
%     pause(0.1)
end
time21 = [3:163];
trimmed2test1 = test1cam2(:,time21);
trimmed2test1(1,:) = trimmed2test1(1,:) - mean(trimmed2test1(1,:));
trimmed2test1(2,:) = trimmed2test1(2,:) - mean(trimmed2test1(2,:));

%% CAMERA 3 test 1 cam3_1 DONEE
load('cam3_1.mat')
pointTracker = vision.PointTracker;
numFrames = size(vidFrames3_1,4);
points = [335,280]; %based on ginput(1) after imshow for cam2_1
initialize(pointTracker, points, vidFrames3_1(:,:,:,1));
test1cam3 = zeros(2,numFrames);
for j = 1:numFrames
    X = vidFrames3_1(:,:,:,j);
    test1cam3(:,j) = step(pointTracker, X);
%     imshow(X);
%     hold on
%     plot(test1cam3(1,j), test1cam3(2,j), 'ro')
%     pause(0.1)
end
time31 = [34:194];
trimmed3test1 = test1cam3(:,time31);
trimmed3test1(1,:) = trimmed3test1(1,:) - mean(trimmed3test1(1,:));
trimmed3test1(2,:) = trimmed3test1(2,:) - mean(trimmed3test1(2,:));

%% CAMERA 1 Test 2 cam1_2 DONEE
load('cam1_2.mat')
pointTracker = vision.PointTracker;
numFrames = size(vidFrames1_2,4);
points = [325,310]; %based on ginput(1) after imshow for cam2_1
initialize(pointTracker, points, vidFrames1_2(:,:,:,1));
test2cam1 = zeros(2,numFrames);
for j = 1:numFrames
    X = vidFrames1_2(:,:,:,j);
    test2cam1(:,j) = step(pointTracker, X);
%     imshow(X);
%     hold on
%     plot(test2cam1(1,j), test2cam1(2,j), 'ro')
%     pause(0.1)
end
time12 = [62:217]; %chosen time length: 155
trimmed1test2 = test2cam1(:,time12);
trimmed1test2(1,:) = trimmed1test2(1,:) - mean(trimmed1test2(1,:));
trimmed1test2(2,:) = trimmed1test2(2,:) - mean(trimmed1test2(2,:));

%% CAMERA 2 Test 2 cam2_2 DONEE
load('cam2_2.mat')
pointTracker = vision.PointTracker;
numFrames = size(vidFrames2_2,4);
points = [313,360]; %based on ginput(1)
initialize(pointTracker, points, vidFrames2_2(:,:,:,1));
test2cam2 = zeros(2,numFrames);
for j = 1:numFrames
    X = vidFrames2_2(:,:,:,j);
    if (j == 61)
         setPoints(pointTracker, [245,84])
    end
    if (j == 257)
        setPoints(pointTracker, [325,144])
    end
    if (j == 297)
        setPoints(pointTracker, [323,104])
    end
    test2cam2(:,j) = step(pointTracker, X);
%     imshow(X);
%     hold on
%     plot(test2cam2(1,j), test2cam2(2,j), 'ro')
%     pause(0.1)
end
time22 = [10:165];
trimmed2test2 = test2cam2(:,time22);
trimmed2test2(1,:) = trimmed2test2(1,:) - mean(trimmed2test2(1,:));
trimmed2test2(2,:) = trimmed2test2(2,:) - mean(trimmed2test2(2,:));

%% CAMERA 3 Test 2 cam3_2 DONEE
load('cam3_2.mat')
pointTracker = vision.PointTracker;
numFrames = size(vidFrames3_2,4);
points = [351,250]; %based on ginput(1)
initialize(pointTracker, points, vidFrames3_2(:,:,:,1));
test2cam3 = zeros(2,numFrames);
for j = 1:numFrames
    X = vidFrames3_2(:,:,:,j);
    if (j == 196)
        setPoints(pointTracker, [315,248])
    end
    if (j == 260)
        setPoints(pointTracker, [374,258])
    end
    test2cam3(:,j) = step(pointTracker, X);
%     imshow(X);
%     hold on
%     plot(test2cam3(1,j), test2cam3(2,j), 'ro')
%     pause(0.1)
end
time32 = [56:211];
trimmed3test2 = test2cam3(:,time32);
trimmed3test2(1,:) = trimmed3test2(1,:) - mean(trimmed3test2(1,:));
trimmed3test2(2,:) = trimmed3test2(2,:) - mean(trimmed3test2(2,:));

%% CAMERA 1 Test 3 cam1_3 DONEE
load('cam1_3.mat')
pointTracker = vision.PointTracker;
numFrames = size(vidFrames1_3,4);
points = [339,313]; %based on ginput(1) after imshow for cam2_1
initialize(pointTracker, points, vidFrames1_3(:,:,:,1));
test3cam1 = zeros(2,numFrames);
for j = 1:numFrames
    X = vidFrames1_3(:,:,:,j);
    test3cam1(:,j) = step(pointTracker, X);
%     imshow(X);
%     hold on
%     plot(test3cam1(1,j), test3cam1(2,j), 'ro')
%     pause(0.1)
end
time13 = [25:140];
trimmed1test3 = test3cam1(:,time13);
trimmed1test3(1,:) = trimmed1test3(1,:) - mean(trimmed1test3(1,:));
trimmed1test3(2,:) = trimmed1test3(2,:) - mean(trimmed1test3(2,:));

%% CAMERA 2 Test 3 cam2_3 DONEE
load('cam2_3.mat')
pointTracker = vision.PointTracker;
numFrames = size(vidFrames2_3,4);
points = [265,328]; %based on ginput(1) after imshow for cam2_1
initialize(pointTracker, points, vidFrames2_3(:,:,:,1));
test3cam2 = zeros(2,numFrames);
for j = 1:numFrames
    X = vidFrames2_3(:,:,:,j);
    test3cam2(:,j) = step(pointTracker, X);
    imshow(X);
    hold on
    plot(test3cam2(1,j), test3cam2(2,j), 'ro')
    pause(0.1)
end
time23 = [55:170];
trimmed2test3 = test3cam2(:,time23);
trimmed2test3(1,:) = trimmed2test3(1,:) - mean(trimmed2test3(1,:)); 
trimmed2test3(2,:) = trimmed2test3(2,:) - mean(trimmed2test3(2,:));

%% CAMERA 3 Test 3 cam3_3 DONEE
load('cam3_3.mat')
pointTracker = vision.PointTracker;
numFrames = size(vidFrames3_3,4);
points = [369,236]; %based on ginput(1) after imshow for cam2_1
initialize(pointTracker, points, vidFrames3_3(:,:,:,1));
test3cam3 = zeros(2,numFrames);
for j = 1:numFrames
    X = vidFrames3_3(:,:,:,j);
    test3cam3(:,j) = step(pointTracker, X);
%     imshow(X);
%     hold on
%     plot(test3cam3(1,j), test3cam3(2,j), 'ro')
%     pause(0.1)
end
time33 = [26:141];
trimmed3test3 = test3cam3(:,time33);
trimmed3test3(1,:) = trimmed3test3(1,:) - mean(trimmed3test3(1,:));
trimmed3test3(2,:) = trimmed3test3(2,:) - mean(trimmed3test3(2,:));

%% CAMERA 1 Test 4 cam1_4 DONE
load('cam1_4.mat')
pointTracker = vision.PointTracker;
numFrames = size(vidFrames1_4,4);
points = [400,268]; %based on ginput(1) after imshow for cam2_1
initialize(pointTracker, points, vidFrames1_4(:,:,:,1));
test4cam1 = zeros(2,numFrames);
time = 1:numFrames;
for j = 1:numFrames
    X = vidFrames1_4(:,:,:,j);
    if (j == 33)
        setPoints(pointTracker, [394,338])
    end
    if (j == 60)
        setPoints(pointTracker, [344,276])
    end
    if (j == 95)
        setPoints(pointTracker, [375,256])
    end
    if (j == 220)
        setPoints(pointTracker, [371,266])
    end
    if (j == 289)
        setPoints(pointTracker, [381,252])
    end
    test4cam1(:,j) = step(pointTracker, X);
%     imshow(X);
%     hold on
%     plot(test4cam1(1,j), test4cam1(2,j), 'ro')
%     pause(0.1)
end
time14 = [40:240];
trimmed1test4 = test4cam1(:,time14);
trimmed1test4(1,:) = trimmed1test4(1,:) - mean(trimmed1test4(1,:));
trimmed1test4(2,:) = trimmed1test4(2,:) - mean(trimmed1test4(2,:));

%% CAMERA 2 Test 4  cam2_4 DONE
load('cam2_4.mat')
pointTracker = vision.PointTracker;
numFrames = size(vidFrames2_4,4);
points = [247,260]; %based on ginput(1) after imshow for cam2_1
initialize(pointTracker, points, vidFrames2_4(:,:,:,1));
test4cam2 = zeros(2,numFrames);
for j = 1:numFrames
    X = vidFrames2_4(:,:,:,j);
    if (j == 10)
       setPoints(pointTracker, [305,188])
    end
    if (j == 16)
       setPoints(pointTracker, [351,148])
    end
    if (j == 35)
       setPoints(pointTracker, [369,246])
    end
    if (j == 50)
       setPoints(pointTracker, [283,194])
    end
    if (j == 65)
       setPoints(pointTracker, [265,148])
    end
    if (j == 68)
        setPoints(pointTracker, [261,170])
    end
    if (j == 70)
        setPoints(pointTracker, [269,196])
    end
    if (j == 73)
        setPoints(pointTracker, [283,220])
    end
    if (j == 80)
        setPoints(pointTracker, [291,248])
    end
    if (j == 96)
        setPoints(pointTracker, [299,150])
    end
    if (j == 176)
        setPoints(pointTracker, [295,142])
    end
    if (j == 194)
        setPoints(pointTracker, [321,206])
    end
    if (j == 214)
        setPoints(pointTracker, [303,144])
    end
    if (j == 270)
        setPoints(pointTracker, [323,186])
    end
    if (j == 290)
        setPoints(pointTracker, [307,170])
    end
    if (j == 299)
        setPoints(pointTracker, [293,112])
    end
    if (j == 320)
        setPoints(pointTracker, [277,258])
    end
    test4cam2(:,j) = step(pointTracker, X);
%   imshow(X);
%   hold on
%   plot(test4cam2(1,j), test4cam2(2,j), 'ro')
%   pause(0.1)
end
time24 = [85:285];
trimmed2test4 = test4cam2(:,time24);
trimmed2test4(1,:) = trimmed2test4(1,:) - mean(trimmed2test4(1,:));
trimmed2test4(2,:) = trimmed2test4(2,:) - mean(trimmed2test4(2,:));

%% CAMERA 3 Test 4  cam3_4 DONE
load('cam3_4.mat')
pointTracker = vision.PointTracker;
numFrames = size(vidFrames3_4,4);
points = [361,230]; %based on ginput(1) after imshow for cam2_1
initialize(pointTracker, points, vidFrames3_4(:,:,:,1));
test4cam3 = zeros(2,numFrames);
for j = 1:numFrames
    X = vidFrames3_4(:,:,:,j);
    if (j == 25)
       setPoints(pointTracker, [375,194])
    end
    if (j == 40)
       setPoints(pointTracker, [377,210])
    end
    if (j == 54)
       setPoints(pointTracker, [326,222])
    end
    if (j == 65)
       setPoints(pointTracker, [377,206])
    end
    if (j == 185)
       setPoints(pointTracker, [375,194])
    end
    if (j == 192)
       setPoints(pointTracker, [411,196])
    end
    if (j == 200)
       setPoints(pointTracker, [393,215])
    end
    if (j == 217)
       setPoints(pointTracker, [354,257])
    end
    if (j == 230)
       setPoints(pointTracker, [416,223])
    end
    if (j == 260)
       setPoints(pointTracker, [358,218])
    end
    if (j == 270)
       setPoints(pointTracker, [421,214])
    end
    if (j == 291)
       setPoints(pointTracker, [335,265])
    end
    test4cam3(:,j) = step(pointTracker, X);
%     imshow(X);
%     hold on
%     plot(test4cam3(1,j), test4cam3(2,j), 'ro')
%     pause(0.1)
end
time34 = [103:303];
trimmed3test4 = test4cam3(:,time34);
trimmed3test4(1,:) = trimmed3test4(1,:) - mean(trimmed3test4(1,:));
trimmed3test4(2,:) = trimmed3test4(2,:) - mean(trimmed3test4(2,:));

%% SVD Calculations
%Test 1 Matrix:
X1 = zeros(6,161);
X1(1:2,:) = trimmed1test1(:,:);
X1(3:4,:) = trimmed2test1(:,:);
X1(5:6,:) = trimmed3test1(:,:);
[U1,S1,V1] = svd(X1,'econ');

%Test 2 Matrix:
X2 = zeros(6,156);
X2(1:2,:) = trimmed1test2(:,:);%SUBTRACT FROM THE MEAN OF EACH INDIVIDUAL ROW to avoid different shifts affect
X2(3:4,:) = trimmed2test2(:,:);
X2(5:6,:) = trimmed3test2(:,:);
[U2,S2,V2] = svd(X2,'econ');

%Test 3 Matrix:
X3 = zeros(6,116);
X3(1:2,:) = trimmed1test3(:,:);
X3(3:4,:) = trimmed2test3(:,:);
X3(5:6,:) = trimmed3test3(:,:);
[U3,S3,V3] = svd(X3,'econ');

%Test 4 Matrix:
X4 = zeros(6,201);
X4(1:2,:) = trimmed1test4(:,:);
X4(3:4,:) = trimmed2test4(:,:);
X4(5:6,:) = trimmed3test4(:,:);
[U4,S4,V4] = svd(X4,'econ');

%plotting the singular values:
s1values = diag(S1).';
s2values = diag(S2).';
s3values = diag(S3).';
s4values = diag(S4).';

%Plotting the X values of all camera of test 1 over time:
% plot(time11, test1cam1(1,time11), '-k')
% hold on
% plot(time21, test1cam2(1,time21), '-r')
% hold on
% plot(time31, test1cam3(1,time31), '-g')
% title('X displacement over time (test 1)','FontSize', 16)
% xlabel('Time (Trimmed)','FontSize', 16)
% ylabel('X displacement','FontSize', 16)
% legend('camera 1','camera 2','camera 3','FontSize', 14)

%Plotting Y values of test 1 for all camera angles over time:
% plot(time11, test1cam1(2,time11), '--k')
% hold on
% plot(time21, test1cam2(2,time21), '--r')
% hold on
% plot(time31, test1cam3(2,time31), '--g')
% title('Y displacement over time (Test 1)','FontSize', 16)
% xlabel('Time (Trimmed)','FontSize', 16)
% ylabel('Y displacement','FontSize', 16)
% legend('cam 1', 'cam 2', 'cam 3','FontSize', 14)

%Plotting the X values of all camera of test 2 over time:
% plot(time12, test2cam1(1,time12), '-k')
% hold on
% plot(time22, test2cam2(1,time22), '-r')
% hold on
% plot(time32, test2cam3(1,time32), '-g')
% title('X displacement over time (Test 2)','FontSize', 16)
% xlabel('Time (Trimmed)','FontSize', 16)
% ylabel('X displacement','FontSize', 16)
% legend('camera 1','camera 2','camera 3','FontSize', 14)

%Plotting Y values of test 2 for all camera angles over time:
% plot(time12, test2cam1(2,time12), '--k')
% hold on
% plot(time22, test2cam2(2,time22), '--r')
% hold on
% plot(time32, test2cam3(2,time32), '--g')
% title('Y displacement over time (Test 2)','FontSize', 16)
% xlabel('Time (Trimmed)','FontSize', 16)
% ylabel('Y displacement','FontSize', 16)
% legend('cam 1', 'cam 2', 'cam 3','FontSize', 14)

%Plotting the X values of all camera of test 3 over time:
% plot(time13, test3cam1(1,time13), '-k')
% hold on
% plot(time23, test3cam2(1,time23), '-r')
% hold on
% plot(time33, test3cam3(1,time33), '-g')
% title('X displacement over time (Test 3)','FontSize', 16)
% xlabel('Time (Trimmed)','FontSize', 16)
% ylabel('X displacement','FontSize', 16)
% legend('camera 1','camera 2','camera 3','FontSize', 14)

%Plotting Y values of test 3 for all camera angles over time:
% plot(time13, test3cam1(2,time13), '--k')
% hold on
% plot(time23, test3cam2(2,time23), '--r')
% hold on
% plot(time33, test3cam3(2,time33), '--g')
% title('Y displacement over time (Test 3)','FontSize', 16)
% xlabel('Time (Trimmed)','FontSize', 16)
% ylabel('Y displacement','FontSize', 16)
% legend('cam 1', 'cam 2', 'cam 3','FontSize', 14)

%Plotting the X values of all camera of test 4 over time:
% plot(time14, test4cam1(1,time14), '-k')
% hold on
% plot(time24, test4cam2(1,time24), '-r')
% hold on
% plot(time34, test4cam3(1,time34), '-g')
% title('X displacement over time (Test 4)','FontSize', 16)
% xlabel('Time (Trimmed)','FontSize', 16)
% ylabel('X displacement','FontSize', 16)
% legend('camera 1','camera 2','camera 3','FontSize', 14)

%Plotting Y values of test 4 for all camera angles over time:
% plot(time14, test4cam1(2,time14), '--k')
% hold on
% plot(time24, test4cam2(2,time24), '--r')
% hold on
% plot(time34, test4cam3(2,time34), '--g')
% title('Y displacement over time (Test 4)','FontSize', 16)
% xlabel('Time (Trimmed)','FontSize', 16)
% ylabel('Y displacement','FontSize', 16)
% legend('cam 1', 'cam 2', 'cam 3','FontSize', 14)


%Plotting Energies:
% subplot(2,2,1)
% loglog([1:6], (s1values.^2)/(s1values(1).^2+s1values(2).^2+s1values(3).^2+s1values(4).^2+s1values(5).^2+s1values(6).^2),'ro')
% title('Test 1 Energy Graph','FontSize', 16)
% xlabel('Mode (each singular value)','FontSize', 16)
% ylabel('Energy values','FontSize', 16)
% hold on
% subplot(2,2,2)
% loglog([1:6], (s2values.^2)/(s2values(1).^2+s2values(2).^2+s2values(3).^2+s2values(4).^2+s2values(5).^2+s2values(6).^2),'ro')
% title('Test 2 Energy Graph','FontSize', 16)
% xlabel('Mode (each singular value)','FontSize', 16)
% ylabel('Energy values','FontSize', 16)
% hold on
% subplot(2,2,3)
% loglog([1:6], (s3values.^2)/(s3values(1).^2+s3values(2).^2+s3values(3).^2+s3values(4).^2+s3values(5).^2+s3values(6).^2),'ro')
% title('Test 3 Energy Graph','FontSize', 16)
% xlabel('Mode (each singular value)','FontSize', 16)
% ylabel('Energy values','FontSize', 16)
% hold on
% subplot(2,2,4)
% loglog([1:6], (s4values.^2)/(s4values(1).^2+s4values(2).^2+s4values(3).^2+s4values(4).^2+s4values(5).^2+s4values(6).^2),'ro')
% title('Test 4 Energy Graph','FontSize', 16)
% xlabel('Mode (each singular value)','FontSize', 16)
% ylabel('Energy values','FontSize', 16)