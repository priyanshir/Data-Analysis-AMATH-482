%% Part 1:
load handel
v = y';
L=10; n=length(v);
t2 = linspace(0,L,n+1);
t = t2(1:n);
k=(2*pi/(2*L))*[0:((n-1)/2) (-(n-1))/2:-1];%for odd number of frequencies
ks=fftshift(k);
%amplitude over time
%plot((1:length(v))/Fs,v);
%xlabel('Time [sec]');
%ylabel('Amplitude');
%title('Signal of Interest, v(n)');

%% Look at different window sizes: a = 5, 2, 10
% Gabor Transform
windowSizes = [0.3 1 5 100]; %so a = large so it is narrow->meaning good frequency, low time if small = wide less frequency and more time
tslide = 0:2:L; %experimented and found 2 to be the best value between width and frequency 
Vgt_spec = zeros(length(tslide), n);
for i = 1:length(windowSizes)
    a = windowSizes(i); %width changes
    Sgt_spec = zeros(length(tslide),n);
    for j = 1:length(tslide)
        g = exp(-a.*((t-tslide(j)).^2)); %the gabor transform
        Vg = g.*v;
        Vgt = fft(Vg);
        Vgt_spec(j,:) = fftshift(abs(Vgt));
    end
    subplot(4,1,i)
    pcolor(tslide,ks,Vgt_spec.'),
    shading interp
    title(['Messiahs Spectrogram w/a = ',num2str(a)],'Fontsize',16)
    set(gca,'Fontsize',16)
    colorbar
    colormap(hot)
    ylabel('Frequency')
    xlabel('Time')
end

%% Mexican Hat Wavelet
m_hatVt_spec = zeros(length(tslide), n);
a = .5;
for j = 1:length(tslide)
    m_hat = (1-a*(t-tslide(j)).^2).*exp(-(a*(t-tslide(j))).^2/2);
    m_hatV = m_hat.*v;
    m_hatVt = fft(m_hatV);
    m_hatVt_spec(j,:) = fftshift(abs(m_hatVt));
    pcolor(tslide,ks,m_hatVt_spec.'),
    shading interp
    title('Mexican Hat Wavelet','Fontsize',16)
    xlabel('Time (Seconds)');
    ylabel('Frequency');
    set(gca,'Fontsize',16)
    colorbar
    colormap(hot)
end
%p8 = audioplayer(v,Fs);
%playblocking(p8);

%% Part 2 - Mary Had a Little Lamb (piano/recorder)
[y,Fs] = audioread('music1.wav');
tr_piano=length(y)/Fs; 
v = y.';
L = tr_piano; n=length(v);
t2 = linspace(0,L,n+1);
t = t2(1:n);
k=(1/L)*[0:n/2-1 -n/2:-1];%for odd number of frequencies/convert to hertz
ks=fftshift(k);
%record time in seconds1
plot((1:length(y))/Fs,y);
a = 100;
tslide = 0:0.1:L;
width = 0.00009;
centerFreq = 300;
for j = 1:length(tslide)
    g = exp(-a.*((t-tslide(j)).^2)); %the gabor transform
    filtered = g.*y.';
    filtered_fft = abs(fft(filtered));
    
    gaussian = exp(-width*((k-centerFreq).^2)); %using gaussian filter to filter out overtones
    filtered_fft = filtered_fft.*gaussian;
    piano_spec(j,:) = fftshift(abs(filtered_fft));
end
pcolor(tslide,ks,piano_spec.'),
shading interp
title('Piano Spectrogram','Fontsize',16)
set(gca,'Fontsize',16)
colorbar
colormap(hot)
xlabel('Time')
ylabel('Frequency (Hertz)')
ylim([0, 600])

% xlabel('Time [sec]'); ylabel('Amplitude');
% title('Mary had a little lamb (piano)');
 p8 = audioplayer(y,Fs); playblocking(p8);
