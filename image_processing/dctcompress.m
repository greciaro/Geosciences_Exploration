function [ imgrecon, rerr ] = dctcompress(img, pzero)
%DCTCOMPRESS Image compression using DCT
%imgrecon = dctcompress(img, pzero)
%img: input image
%pzero: percent of coefficients set to zero in the DCT of the image
%      
%imgrecon: reconstructed image
%rerr: relative mean squared error between original and reconstructed image
%e.g. dctcompress(img, 90) 
%will zero out all DCT coefficients below 90 percentile of the log(abs)
%value of the coefficients.
%Without output arguments, plots images and DCTs

% T. Mukerji, 2009

imgdct = dct2(img);
imgidct = idct2(imgdct);

imgdct_labs = log(abs(imgdct));
p = prctile(imgdct_labs(:), pzero);

imgdctcompress = imgdct;
imgdctcompress(imgdct_labs < p) = 0;

imgrecon = idct2(imgdctcompress);

rerr = norm(imgidct(:) - imgrecon(:))./norm(imgidct(:));

    if nargout == 0

    figure
    subplot(1,3,1)
    imagesc(imgidct); axis image off; colormap gray;
    title('Original')
    subplot(1,3,2)
    imagesc(imgrecon); axis image off; colormap gray
    title('Reconstructed')
    subplot(1,3,3)
    imagesc(imgidct - imgrecon); axis image off; colormap gray
    title(['Rel. error = ' num2str(rerr)]);
    figure
    subplot(1,2,1)
    imagesc(imgdct_labs); 
    axis image off; colormap jet; colorbar;
    title('DCT'); 
    cax = caxis;
    subplot(1,2,2)
    imagesc(log(abs(imgdctcompress))); 
    axis image off; colormap jet; colorbar
    title(['Compressed ' num2str(pzero) '%'])
    caxis(cax)
    
    end

end

