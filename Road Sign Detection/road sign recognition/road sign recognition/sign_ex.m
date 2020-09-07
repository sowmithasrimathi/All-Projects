clc;
clear;

%%%%%% Input %%%%%%%%%
input = imread('input.jpg');
original_image = input;

%%%%%% To save HOG FEature Values 
i=1;
mypath_hog = ['.\feature\' num2str(i) '.txt'];


%%%%%%% RGB to HSV %%%%%%%%%
HSV_image=rgb2hsv(original_image);
   h_image=HSV_image(:,:,1);
   s_image=HSV_image(:,:,2);
   v_image=HSV_image(:,:,3);
   
   s_input = s_image;
   
%colorDetectHSV('input.jpg', median(HSV), [0.05 0.5 0.50]);

% s(rand(size(s))<0.01) = 255;
% s(rand(size(s))<0.01) = 0;
% color = medfilt3(s);

%%% Convert into Binary Image
s_input = im2bw(s_input);           

  %%%% Apply Morphological Erosion 
se = strel('line',5,180);
     s_input=imerode(s_input,se);           
     ss=~s_input;

    %%%%%%%%% Display All REsults In one Window
   figure(1)
subplot(3,2,1)
imshow(input); title('Input Image');
 subplot(3,2,2)
 imshow(HSV_image);  title('HSV Image');
 subplot(3,2,3)
 imshow(h_image);  title('H Component');
 subplot(3,2,4)
 imshow(s_image);  title('S Component');
 subplot(3,2,5)
 imshow(v_image);  title('V Component');
 subplot(3,2,6)
 imshow(s_input);   title('Binay of S Component');
 
 %%%%%%% Extract Road Sign Image using Bounding Box Method
    
    S = regionprops(s_input,'BoundingBox', 'Area');
 
len = numel(S);
 
if len > 1
for i=1:len
%     S(i).Area
    if S(i).Area > 5000
    rec = [S(i).BoundingBox(1) S(i).BoundingBox(2) S(i).BoundingBox(3) S(i).BoundingBox(4)];
    
    %%%% Show Detected road sign Image
    figure(2)
    imshow(input); hold on
    rectangle('Position',rec,'LineWidth',2,'LineStyle','-','EdgeColor',[0 1 0]);
    
    %%%%%% Extract Road Sign Area only for feature Extraction Procedure
    sign_extract=imcrop(ss,rec);
%     figure(3)
    imshow(crop);
    imshowsign_extract
    
    end
end
 
end

%%%%%%%% Applying Canny Edge Operation 

   sign_extract = edge(sign_extract,'canny');
%  figure(4)
%     imshow(crop); 
    
%%% Function HOG Feature Extraction Method
    Im=sign_extract;
 
   m2=HOG(Im); 
   
   %%%% Display HOG Feature Values
   fprintf('%2.3f \n',m2);
 
  
dlmwrite(mypath_hog, m2', 'precision','%3.3f ', 'delimiter' , ' ' ,'-append');

   
    

 


 


%%%%%%%%%%%%%%%%%%%%%%% Red component detection method%%%%%%%%%%%%%%%%%%%%%
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


















