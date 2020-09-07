clc;
clear;

%%%%%% Input %%%%%%%%%
input = imread('input.jpg');
a = input;

%%%%%%% RGB to HSV %%%%%%%%%
a=rgb2hsv(a);
   h=a(:,:,1);
   s=a(:,:,2);
   v=a(:,:,3);
%colorDetectHSV('input.jpg', median(HSV), [0.05 0.5 0.50]);

% s(rand(size(s))<0.01) = 255;
% s(rand(size(s))<0.01) = 0;
% color = medfilt3(s);
s_input = s;


s_input = im2bw(s_input); 

ss=s_input;
      % Aplly Thresh
%       thresh = graythresh(s_input);
%     s_input = (s_input >= thresh * 225); 



se = strel('line',5,180);
     s_input=imerode(s_input,se);  
     
     
     ss=~s_input;
%       s_input=imerode(s_input,se);   
%       
%     s_input=imerode(s_input,se);  
    
   figure(1)
subplot(3,2,1)
imshow(input);
title('Input Image');
 subplot(3,2,2)
 imshow(a);
 title('HSV');
 subplot(3,2,3)
 imshow(h);
 title('H Component');
 subplot(3,2,4)
 imshow(s);
 title('S Component');
 subplot(3,2,5)
 imshow(v);
 title('V Component');
 subplot(3,2,6)
 imshow(s_input);
 title('Binay of S Component');
    
    S = regionprops(s_input,'BoundingBox', 'Area');
 
len = numel(S);
 
if len > 1
for i=1:len
%     S(i).Area
    if S(i).Area > 5000
    rec = [S(i).BoundingBox(1) S(i).BoundingBox(2) S(i).BoundingBox(3) S(i).BoundingBox(4)];
    figure(2)
    imshow(input); hold on
    rectangle('Position',rec,'LineWidth',2,'LineStyle','-','EdgeColor',[0 1 0]);
    crop=imcrop(ss,rec);
    figure(3)
    imshow(crop);
    end
end
 
end
    
    
    % Centroid Detection
%                  Ibw = im2bw( s_input);
%                stat = regionprops(Ibw,'BoundingBox');
%                 
%                 
%         
%                 rectangle('Position', [stat(1).BoundingBox(1) stat(1).BoundingBox(2) stat(1).BoundingBox(3) stat(1).BoundingBox(4)],'EdgeColor','g','LineWidth',1);  
%                 rect = [stat(1).BoundingBox(1) stat(1).BoundingBox(2) stat(1).BoundingBox(3) stat(1).BoundingBox(4)];
%                 I2 = imcrop(input,rect);


 


 



% II = imread('input.jpg');
% 
% G = imabsdiff(II(:,:,1), rgb2gray(II));
% 
% 
% 
% % G = rgb2gray(I);
% thresh = graythresh(G);
% B = im2bw(G,thresh);
% 
% 
% S = regionprops(B,'BoundingBox', 'Area');
% 
% len = numel(S);
% 
% if len > 1
% for i=1:len
%     S(i).Area
%     if S(i).Area > 2000
%     rec = [S(i).BoundingBox(1) S(i).BoundingBox(2) S(i).BoundingBox(3) S(i).BoundingBox(4)];
%     figure(1)
%     imshow(II); hold on
%     rectangle('Position',rec,'LineWidth',2,'LineStyle','-','EdgeColor',[0 1 0]);
%     end
% end
% 
% end
% 
% % figure(1)
% % imshow(B)


















