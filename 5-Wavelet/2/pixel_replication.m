function output = pixel_replication(img)
[height,width] = size(img);
%make sure output is 2* the size of the input
output = zeros(2*height,2*width);
for x = 1:height 
    for y = 1:width
        %first we find the top-left, and then find others in respect to it
        j = 2*(x-1) + 1; 
        i = 2*(y-1) + 1;         
        output(j,i) = img(x,y); %// Top-left
        output(j+1,i) = img(x,y); %// Bottom-left
        output(j,i+1) = img(x,y); %// Top-right
        output(j+1,i+1) = img(x,y); %// Bottom-right
    end
end