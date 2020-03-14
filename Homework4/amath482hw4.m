%Test 1:
songs = {'adorn.wav','sureThing.wav', 'miguel3.wav','miguel4.wav','miguel5.wav',...
    'miguel6.wav','miguel7.wav','miguel8.wav','miguel9.wav','miguel10.wav',...
    'miguel11.wav','miguel12.wav','miguel13.wav','miguel14.wav','miguel15.wav',...
    'fur_elise.wav','beethoven2.wav','beethoven3.wav','beethoven4.wav','beethoven5.wav',...
    'beethoven6.wav','beethoven7.wav','beethoven8.wav','beethoven9.wav','beethoven10.wav',...
    'beethoven11.wav','beethoven12.wav','beethoven13.wav','beethoven14.wav','beethoven15.wav',...
    'ransom.wav','loveMe.wav','lilTecca3.wav','lilTecca4.wav','lilTecca5.wav','lilTecca6.wav',...
    'lilTecca7.wav','lilTecca8.wav','lilTecca9.wav','lilTecca10.wav','lilTecca11.wav',...
    'lilTecca12.wav','lilTecca13.wav','lilTecca14.wav','lilTecca15.wav'};
test1Matrix = zeros(5622750,length(songs));
for k = 1:length(songs)
    [y,Fs] = audioread(songs{k});
    Fs = Fs/2;
    y = y(1:2:length(y));
    [spectrogramMatrix] = makeSpectrogram(y,Fs);
    spectrogramMatrix = reshape(spectrogramMatrix,5622750,1);
    test1Matrix(:,k) = spectrogramMatrix(:,1);
end
[U1,S1,V1,miguel,beethoven,lilTecca,sortedMiguel,sortedBeethoven,...
    sortedLilTecca,w] = trainer(test1Matrix,30,songs);
%calcuating thresholds basedo on the order of the projections
threshold1 = sortedMiguel(2); %based on plot
threshold2 = sortedMiguel(t2-1);
xline(threshold1)
xline(threshold2)
hold on
%Testing: feeding in new 6 different clips per artist
testSongs = {'testMiguel1.wav','testMiguel2.wav','testMiguel3.wav','testMiguel4.wav','testMiguel5.wav',...
    'testMiguel6.wav','testBeethoven1.wav','testBeethoven2.wav','testBeethoven3.wav','testBeethoven4.wav'...
    'testBeethoven5.wav','testBeethoven6.wav','testLilTecca1.wav','testLilTecca2.wav','testLilTecca3.wav',...
    'testLilTecca4.wav','testLilTecca5.wav','testLilTecca6.wav'};
for k = 1:length(testSongs)
    [y,Fs] = audioread(testSongs{k});
    Fs = Fs/2;
    y = y(1:2:length(y));
    [spectrogramMatrix] = makeSpectrogram(y,Fs);
    spectrogramMatrix = reshape(spectrogramMatrix,5622750,1);
    testSong = U1'*spectrogramMatrix;
    projTestSong = w'*testSong;
    disp(k)
    if ((projTestSong <= threshold2) && (projTestSong>=threshold1))
        disp('Miguel')
    elseif (projTestSong> threshold2)
        disp('Beethoven')
    else
        disp('LilTecca')
    end
    if k <=6 %checking the Miguel test songs
       %plot(projTestSong, 0, 'dm','Linewidth', 9)%blue for Miguel
    elseif k>6 && k<=12
       %plot(projTestSong, 1,'dm','Linewidth', 9)%red for Beethoven
    else 
       %plot(projTestSong, .5, 'dm','Linewidth', 9)%lilTecca green
    end
end
ylim([0 1.5])
title('Plotting Artists/Genres projections, Miguel(RnB) Tests (Test 1)')
legend('mean(Miguel(RnB))','mean(Beethoven(Orchestra))','mean(Lil Tecca(Rap))','Genre1:RnB (Miguel)','Genre2:Orchestra(Beethoven)','Genre3:Rap(Lil Tecca)','Miguel(RnB) Tests','','','')
%% Test 2:
songs = {'adorn.wav','sureThing.wav', 'miguel3.wav','miguel4.wav','miguel5.wav',...
    'miguel6.wav','miguel7.wav','miguel8.wav','miguel9.wav','miguel10.wav',...
    'weeknd1.wav','weeknd2.wav','weeknd3.wav','weeknd4.wav','weeknd5.wav',...
    'weeknd6.wav','weeknd7.wav','weeknd8.wav','weeknd9.wav','weeknd10.wav',...
    'ocean1.wav','ocean2.wav','ocean3.wav','ocean4.wav','ocean5.wav','ocean6.wav'...
    'ocean7.wav','ocean8.wav','ocean9.wav','ocean10.wav'};
test2Matrix = zeros(5622750,length(songs));
for k = 1:length(songs)
    [y,Fs] = audioread(songs{k});
    Fs = Fs/2;
    y = y(1:2:length(y));
    [spectrogramMatrix] = makeSpectrogram(y,Fs);
    spectrogramMatrix = reshape(spectrogramMatrix,5622750,1);
    test2Matrix(:,k) = spectrogramMatrix(:,1);
end
[U2,S2,V2,miguel2,weeknd,ocean,sortMiguel2,sortWeeknd,sortOcean,w] = trainer(test2Matrix,25,songs);
%calculating thresholds, looked at projection plot for the ordering
t1 = 1;
t2 = length(sortOcean);
t3 = 1;
t4 = length(sortMiguel2);
while t1<length(sortWeeknd) && sortWeeknd(t1)<sortOcean(t2)
    t1 = t1+1;
    t2 = t2-1;
end
while (sortOcean(t3)<sortMiguel2(t4))
    t3 = t3+1;
    t4 = t4-1;
end
thr1 = (sortWeeknd(t1)+sortOcean(t2))/2;
thr2 = (sortOcean(t3)+sortMiguel2(t4))/2;
xline(thr1)
hold on
xline(thr2)
ylim([0 1.5])
title('Genre projections, Weeknd Tests (Test 2)')
legend({'mean(Miguel)','mean(Weeknd)','mean(Frank Ocean)','Miguel','Weeknd','Frank Ocean','Weeknd Songs Proj values'})
hold on
%Tests:
% testSongs2 = {'test2Miguel1.wav','test2Miguel2.wav','test2Miguel3.wav'};
testSongs2 = {'test2Miguel1.wav','test2Miguel2.wav','test2Miguel3.wav','test2Miguel4.wav',...
    'test2Miguel5.wav','test2Miguel6.wav','test2Weeknd1.wav','test2Weeknd2.wav','test2Weeknd3.wav',....
    'test2Weeknd4.wav','test2Weeknd5.wav','test2Weeknd6.wav','test2Ocean1.wav','test2Ocean2.wav',...
    'test2Ocean3.wav','test2Ocean4.wav','test2Ocean5.wav','test2Ocean6.wav'};
for k = 1:length(testSongs2)
    [y,Fs] = audioread(testSongs2{k});
    Fs = Fs/2;
    y = y(1:2:length(y));
    [spectrogramMatrix] = makeSpectrogram(y,Fs);
    spectrogramMatrix = reshape(spectrogramMatrix,5622750,1);
    testSong = U2'*spectrogramMatrix;
    projTestSong = w'*testSong;
%     if ((projTestSong <= thr2) && (projTestSong>=thr1))%anything between the thresholds
%         disp('Frank Ocean')
%     elseif (projTestSong<thr1)
%         disp('Weeknd')
%     elseif (projTestSong>thr2)
%         disp('Miguel')
%     end
    if k <=6 %checking the Miguel test songs
        %plot(projTestSong, 0, 'dm','Linewidth', 9)%blue for Miguel
    elseif k>6 && k<=12
        plot(projTestSong, .5,'dm','Linewidth', 9)%red for Weeknd
    else 
        %plot(projTestSong, 1, 'dm','Linewidth', 9)%Frank Ocean
    end
end
%% Test 3:
songs3 = {'test3Rnb1.wav','test3Rnb2.wav','test3Rnb3.wav','test3Rnb4.wav',...
    'test3Rnb5.wav','test3Rnb6.wav','test3Rnb7.wav','test3Rnb8.wav','test3Rnb9.wav',...
    'test3Rnb10.wav','test3Rnb11.wav','test3Rnb12.wav','test3Rnb13.wav','test3Rnb14.wav',...
    'test3Rnb15.wav','test3Rap1.wav','test3Rap2.wav','test3Rap3.wav','test3Rap4.wav',...
    'test3Rap5.wav','test3Rap6.wav','test3Rap7.wav','test3Rap8.wav','test3Rap9.wav',...
    'test3Rap10.wav','test3Rap11.wav','test3Rap12.wav','test3Rap13.wav','test3Rap14.wav',...
    'test3Rap15.wav','test3Edm1.wav','test3Edm2.wav','test3Edm3.wav','test3Edm4.wav',...
    'test3Edm5.wav','test3Edm6.wav','test3Edm7.wav','test3Edm8.wav','test3Edm9.wav',...
    'test3Edm10.wav','test3Edm11.wav','test3Edm12.wav','test3Edm13.wav','test3Edm14.wav',...
    'test3Edm15.wav',};
test3Matrix = zeros(5622750,length(songs3));
for k = 1:length(songs3)
    [y,Fs] = audioread(songs3{k});
    Fs = Fs/2;
    y = y(1:2:length(y));
    [spectrogramMatrix] = makeSpectrogram(y,Fs);
    spectrogramMatrix = reshape(spectrogramMatrix,5622750,1);
    test3Matrix(:,k) = spectrogramMatrix(:,1);
end
[U3,S3,V3,rnb,rap,edm,sortRnB,sortRap,sortEdm,w] = trainer(test3Matrix,28,songs3);
%calculating thresholds, looked at projection plot for the ordering
thr1 = sortRap(length(sortRap)-2);
thr2 = sortRnB(4);
xline(thr1)
hold on
xline(thr2)
ylim([0 1.5])
title('Genre projections, with Tests for EDM (Test 3)')
legend({'mean(RnB)','mean(Rap)','mean(EDM)','RnB','Rap','EDM','EDM test songs proj. values'})
hold on
testSongs3 = {'rnbTest1.wav','rnbTest2.wav','rnbTest3.wav','rnbTest4.wav','rnbTest5.wav',...
    'rapTest1.wav','rapTest2.wav','rapTest3.wav','rapTest4.wav','rapTest5.wav',...
    'edmTest1.wav','edmTest2.wav','edmTest3.wav','edmTest4.wav','edmTest5.wav'};
for k = 1:length(testSongs3)
    [y,Fs] = audioread(testSongs3{k});
    Fs = Fs/2;
    y = y(1:2:length(y));
    [spectrogramMatrix] = makeSpectrogram(y,Fs);
    spectrogramMatrix = reshape(spectrogramMatrix,5622750,1);
    testSong = U3'*spectrogramMatrix;
    projTestSong = w'*testSong;
    if ((projTestSong <= thr2) && (projTestSong>=thr1))%anything between the thresholds
        disp('EDM')
    elseif (projTestSong<thr1)
        disp('Rap')
    elseif (projTestSong>thr2)
        disp('RnB')
    end
    if k <=5 %checking the RnB test songs
        %plot(projTestSong, 0, 'dm','Linewidth', 9)%blue for RnB
    elseif k>5 && k<=10
        %plot(projTestSong, .5,'dm','Linewidth', 9)%red for Rap
    else 
        %plot(projTestSong, 1, 'dm','Linewidth', 9)%green for EDM
    end
end
function [specMatrix] = makeSpectrogram(y, Fs)
   v = y.';
   v = (v(1,:) + v(2,:))./2;%averaging of v
   L = 5;
    n = (Fs)*L; %change the frequency scale
    k=(1/L)*[0:(n/2)-1 (-n)/2:-1];
    a = 1;
    t2 = linspace(0,L,n+1);
    t = t2(1:n);
    tslide = 0:0.1:L;
   specMatrix = zeros(length(tslide), n);
        for j = 1:length(tslide)
            g = exp(-a.*((t-tslide(j)).^2)); %the gabor transform
            Vg = g.*v;
            Vgt = fft(Vg);
            specMatrix(j,:) = fftshift(abs(Vgt));
        end
end

function [U,S,V,artist1,artist2,artist3,sortArtist1,...
    sortArtist2,sortArtist3,w] = trainer(testMatrix,features,songs)
    [U,S,V] = svd(testMatrix, 'econ');
    artists = S*V'; %projection onto V (the principal components)
    n1 = length(songs)/3;n2 = length(songs)/3;n3 = length(songs)/3;
    U = U(:, 1:features);
    artist1 = artists(1:features, 1:n1);
    artist2 = artists(1:features,(n1+1):(n1+n2));
    artist3 = artists(1:features, (n1+n2+1):(n1+n2+n3));
    mArtist1 = mean(artist1,2);
    mArtist2 = mean(artist2,2);
    mArtist3 = mean(artist3,2);
    mTotal = mean(artists(1:features,:),2);
    
    Sw = 0; %formula to calculate the variance within each group
    for k = 1:n1
        Sw = Sw + (artist1(:,k)-mArtist1)*(artist1(:,k)-mArtist1)';
    end
    for k = 1:n2
        Sw = Sw + (artist2(:,k)-mArtist2)*(artist2(:,k)-mArtist2)';
    end
    for k = 1:n3
        Sw = Sw + (artist3(:,k)-mArtist3)*(artist3(:,k)-mArtist3)';
    end
     SbArtist1 = (mArtist1-mTotal)*(mArtist1-mTotal)';
     SbArtist2 = (mArtist2-mTotal)*(mArtist2-mTotal)';
     SbArtist3 = (mArtist3-mTotal)*(mArtist3-mTotal)';
     Sb = SbArtist1+SbArtist2+SbArtist3;

%finding the eigenvector corresponding to the largest eigenvalue
    [V2, D] = eig(Sb, Sw);
    [~,ind] = max(abs(diag(D)));
    w = V2(:,ind); w = w/norm(w,2);
    %projecting onto 1st eigenvector (w/largest e-value)
    vArtist1 = w'*artist1;
    vArtist2 = w'*artist2;
    vArtist3 = w'*artist3;
    sortArtist1 = sort(vArtist1);
    sortArtist2 = sort(vArtist2);
    sortArtist3 = sort(vArtist3);
    plot(mean(vArtist1), 0, '*k','Linewidth',8)
    hold on
    plot(mean(vArtist2), .5, '*k','Linewidth',8)
    hold on
    plot(mean(vArtist3), 1, '*k','Linewidth',8)
    hold on
     plot(vArtist1, zeros(n1),'ob','Linewidth',2)%RnB
     hold on
     plot(vArtist2,0.5*ones(n2),'or','Linewidth',2)%Rap
     hold on
     plot(vArtist3,ones(n3),'og','Linewidth',2)%Edm
     hold on
     ylabel('Projection values')
     xlabel('each data point')
     ylim([0,2])
end