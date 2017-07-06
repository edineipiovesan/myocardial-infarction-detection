function [ out ] = histogram_rgb( image )
%HISTOGRAM_RGB Summary of this function goes here
%   Detailed explanation goes here
    %Split into RGB Channels
    Red = image(:,:,1);
    Green = image(:,:,2);
    Blue = image(:,:,3);

    %Get histValues for each channel
    [yRed, ~] = imhist(Red);
    [yGreen, ~] = imhist(Green);
    [yBlue, x] = imhist(Blue);
    
%     ir = (yRed~=0);
%     ig = (yGreen~=0);
%     ib = (yBlue~=0);
    %Plot them together in one plot
%     out = plot(x(ir), yRed(ir), 'Red s', x(ig), yGreen(ig), 'Green o', x(ib), yBlue(ib), 'Blue *','MarkerSize',12);
    out = plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');
    
    axis([-10 265 0 inf]);
    title('Histograma');
    xlabel('Intensidade');
    ylabel('Quantidade de pixel');
    lgd = legend('Vermelho','Verde','Azul','Location','best');
    title(lgd,'Componente de cor');
    grid on
    grid minor
end

