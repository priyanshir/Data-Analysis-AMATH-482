%% Recorder version of MHLL pt.2
[y,Fs] = audioread('music2.wav');
tr_rec=length(y)/Fs;  % record time in seconds
v = y.';
L = tr_rec; n=length(v);
t2 = linspace(0,L,n+1);
t = t2(1:n);
k=(1/L)*[0:n/2-1 -n/2:-1];%for odd number of frequencies/convert to hertz
ks=fftshift(k);

a = 100;
tslide = 0:0.1:L;
vector_Cf = zeros();
width = .00009;
centerFreq = 900;%based on initial spectrogram
recorder_spec = zeros(length(tslide),n);
for j = 1:length(tslide)
    g = exp(-a.*((t-tslide(j)).^2)); %the gabor transform
    filtered = g.*y.';
    filtered_fft = abs(fft(filtered));
    gaussian = exp(-width*((k-centerFreq).^2));
    filtered_fft = filtered_fft.*gaussian;
   
    recorder_spec(j,:) = fftshift(abs(filtered_fft));
end
pcolor(tslide,ks,recorder_spec.'),
shading interp
title('Recorder Spectrogram','Fontsize',16)
set(gca,'Fontsize',16)
colorbar
colormap(hot)
xlabel('Time')
ylabel('Frequency (Hertz)')
ylim([700, 1100])
%plot((1:length(y))/Fs,y);
%xlabel('Time [sec]'); ylabel('Amplitude');
%title('Mary had a little lamb (recorder)');
%p8 = audioplayer(y,Fs); playblocking(p8);
