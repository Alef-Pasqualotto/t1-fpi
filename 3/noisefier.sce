function image_noisy = noisefier(image, percentage_gauss_noise, percentage_salt_noise)
    image_gauss = imnoise(image, 'gaussian', percentage_gauss_noise);
    image_noisy = imnoise(image_gauss, 'salt & pepper', percentage_salt_noise);
endfunction