// Clear old scripts
clc;        
close;      
clear;      

dir = "C:\Users\dinhh\Documents\University\HK261\CO2035\Labs\sci\lab4\sampleimage.jpeg";
watermark_url = "C:\Users\dinhh\Documents\University\HK261\CO2035\Labs\sci\lab4\watermark.png";

// Install module IPCV
// atomsGui();
// atomsLoad("IPCV");   

// Read Image 
img      = imread(dir);
gray_img = rgb2gray(img);

// Original Image
scf(1); clf();
imshow(img);
xtitle('Original Image');

// 3 Channel Histogram 
scf(2); clf();
subplot(3,1,1);
[red_counts, bins] = imhist(img(:,:,1), 256, 0.8, 'red');
xlabel('Intensity'); ylabel('Pixel Count'); xtitle('Red Channel Histogram');

subplot(3,1,2);
[green_counts, bins] = imhist(img(:,:,2), 256, 0.8, 'green');
xlabel('Intensity'); ylabel('Pixel Count'); xtitle('Green Channel Histogram');

subplot(3,1,3);
[blue_counts, bins] = imhist(img(:,:,3), 256, 0.8, 'blue');
xlabel('Intensity'); ylabel('Pixel Count'); xtitle('Blue Channel Histogram');

// Histogram Equalized Image
new_img  = imhistequal(gray_img);
diff_img = abs(double(new_img) - double(gray_img));
scf(3); clf();
subplot(1,3,1); imshow(gray_img);  xtitle('Original Gray Image');
subplot(1,3,2); imshow(diff_img);  xtitle('Absolute Difference');
subplot(1,3,3); imshow(new_img);   xtitle('Histogram Equalized Image');

// Blurred Image
kernel   = ones(50, 50) / 2500;
img_blur = uint8(conv2(double(gray_img), kernel, 'same'));
scf(4); clf();
subplot(1,2,1); imshow(gray_img); xtitle('Original Gray Image');
subplot(1,2,2); imshow(img_blur); xtitle('Blurred Image');

// Watermark 
watermark = rgb2gray(imread(watermark_url));
[rows, cols] = size(gray_img);
watermark = imresize(watermark, [rows, cols]);
alpha = 0.2;
img_watermarked = uint8((1 - alpha) * double(gray_img) + alpha * double(watermark));
scf(5); clf();
subplot(1,2,1); imshow(gray_img);        xtitle('Original Gray Image');
subplot(1,2,2); imshow(img_watermarked); xtitle('Watermarked Image');
