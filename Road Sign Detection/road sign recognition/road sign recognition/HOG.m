function [m2]=HOG(Im)
nwin_x=3;
nwin_y=3;
B=5;
[L,C]=size(Im);
H=zeros(nwin_x*nwin_y*B,1); 
m=sqrt(L/2);
if C==1 
    Im=im_recover(Im,m,2*m);
    L=2*m;
    C=m;
end
fid = fopen('ODBTEST.txt','a');
%fprintf(fid,'%d ',a1);
Im=double(Im);
step_x=floor(C/(nwin_x+1));
step_y=floor(L/(nwin_y+1));
cont=0;
hx = [-1,0,1];
hy = -hx';
grad_xr = imfilter(double(Im),hx);
grad_yu = imfilter(double(Im),hy);
angles=atan2(grad_yu,grad_xr);
magnit=((grad_yu.^2)+(grad_xr.^2)).^.5;
for n=0:nwin_y-1
    for m=0:nwin_x-1
        cont=cont+1;
        angles2=angles(n*step_y+1:(n+2)*step_y,m*step_x+1:(m+2)*step_x); 
        magnit2=magnit(n*step_y+1:(n+2)*step_y,m*step_x+1:(m+2)*step_x);
        v_angles=angles2(:);    
        v_magnit=magnit2(:);
        K=max(size(v_angles));
        bin=0;
        H2=zeros(B,1);
        for ang_lim=-pi+2*pi/B:2*pi/B:pi
            bin=bin+1;
            for k=1:K
                if v_angles(k)<ang_lim
                    v_angles(k)=100;
                    H2(bin)=H2(bin)+v_magnit(k);
                end
            end
        end
                
        H2=H2/(norm(H2)+0.01);        
        H((cont-1)*B+1:cont*B,1)=H2;
    end
end
mat1 = H ;
m2=H;
%str = 'This is the matrix: ' ;
%fName = 'output.txt';

%if fid>=0
    %fprintf(fid, '%s  ', str)
 %   fclose(fid)
%end
fprintf(fid,'%4.2f, ',mat1);
fprintf(fid,'\n');
%x=x+1;
end
%dlmwrite(fName, mat1, '-append', 'newline', 'pc', 'delimiter','\t');