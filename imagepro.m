i = imread('images.jpg');
I = rgb2gray(i);
BW1 = edge(I,'prewitt');
BW2= edge(I,'sobel');
BW3= edge(I,'roberts');
figure(1)

% subplot (1,1,1);
% imshow(I);
% title('original');
subplot(1,1,1); 
imshow(BW1);
title('Prewitt');
% subplot(2,2,3);
% imshow(BW2);
% title('Sobel');
% subplot(2,2,4);
% imshow(BW3); 
% title('Roberts'); 
% 
% title('Debris Image')