clear; close all; clc;load Testdata
L=15; %spatial domain
n=64; %Fourier modes
x2=linspace(-L,L,n+1);
x=x2(1:n);y=x; z=x;
k=(2*pi/(2*L))*[0:(n/2-1) -n/2:-1]; ks=fftshift(k);
[X,Y,Z]=meshgrid(x,y,z); %for time signal
[Kx,Ky,Kz]=meshgrid(ks,ks,ks); %for frequency
%  for j=1:20
%     Un(:,:,:)=reshape(Undata(j,:),n,n,n);
%     %close all, isosurface(X,Y,Z,abs(Un),0.4)
%     %axis([-20 20 -20 20 -20 20]), grid on, drawnow
%     %pause(1)
%  end

%PART 1:
%creating an average of the spectrums:
ave = zeros(1,n);
for jj = 1:20
    Un(:,:,:)=reshape(Undata(jj,:),n,n,n);
    utn = fftn(Un);%take the fftn of each time signal->frequency signal
    ave = ave + utn;%sum up frequencies
end
ave = abs(ave)/20; %because there are 20 measurements (take avg. of freqs.)
%use fftshift so that the values align on the plot
ave_norm = ave./ max(ave,[],'all'); %scale it->normally using max of 3d array
%plot the average frequency, we know the isovalue because we scaled all
%values to be between 0-1
isosurface(Kx, Ky, Kz, fftshift(ave_norm), .99999)
hold on
set(gca, 'Fontsize', 16)
xlabel('Frequency of dimension x of ultrasound')
ylabel('Frequency of dimension y of ultrasound')
zlabel('Frequency of dimension z of ultrasound')
title('Average frequency signal')

%%
%Part 2/3:
%find the largest point/center frequency
max_avg = max(ave,[],'all');
[kx_index, ky_index, kz_index] = ind2sub(size(ave),find(ave == max_avg));%finding the indices of the max value of our avg freq signal

%filter the data around the center frequency signature(center frequency)
tau = 20;
kx0 = Kx(kx_index, ky_index, kz_index);%the frequency at that each index found
ky0 = Ky(kx_index, ky_index, kz_index);
kz0 = Kz(kx_index, ky_index, kz_index);
filter = exp(-tau.*((Kx-kx0).^2+(Ky-ky0).^2+(Kz-kz0).^2));%3d gaussian filter
path = zeros(20,3);
for i = 1:20
    Un(:,:,:)=reshape(Undata(i,:),n,n,n);
    unft = filter.*(fftn(Un));%take the fttn of each time signal->frequency
    Unf = ifftn(fftshift(unft));%applying the inverse of each filtered frequency signal->time signal
    isosurface(X, Y, Z, (abs(Unf)/max(abs(Unf),[],'all')),.99)%plotting each filtered time-signal
    [index1, index2, index3] = ind2sub(size(Unf),find(abs(Unf) == max(abs(Unf),[],'all')));%finding the indices of the centroid of each marble
    path(i,1) = X(index1, index2, index3);%saving the X dimension of the centroid of the marble at each time
    path(i,2) = Y(index1, index2, index3);%saving the Y dim
    path(i,3) = Z(index1, index2, index3);%saving the Z dim
    grid on;
    hold on
end
plot3(path(:,1), path(:,2), path(:,3)) %plot the X,Y, and Z paths of the centroid of marble at each time
set(gca, 'Fontsize', 16)
xlabel('X dimension')
ylabel('Y dimension')
zlabel('Z dimension')
title('Path of marble over time')

