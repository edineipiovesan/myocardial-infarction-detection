% This function posterizes an rgb image with specified no. of levels for
%     each r,g,b components.

function output_data=posterize(img_data,no_of_level_red,no_of_level_green,no_of_level_blue)

[m n r]=size(img_data);
img_data=double(img_data);
no_of_level=[no_of_level_red no_of_level_green no_of_level_blue];
for(i=1:m)
    for(j=1:n)
        for(k=1:3)
%         img_data(i,j,k)
            img_data(i,j,k)=(round(img_data(i,j,k)/255*no_of_level(k))*255/no_of_level(k));
%         img_data(i,j,k)
        end
    end
end
output_data=uint8(img_data);