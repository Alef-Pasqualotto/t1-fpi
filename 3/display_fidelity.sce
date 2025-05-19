function display_fidelity(image_original, image_final, effect)
    image_original = double(image_original);
    image_final = double(image_final);

    // Vetoriza as imagens
    orig_vec = image_original(:);
    diff_vec = image_original(:) - image_final(:);

    // Calculo desvio padrão
    std_orig = stdev(orig_vec);
    std_diff = stdev(diff_vec);

    // SNR
    SNR = 10 * log10((std_orig^2) / (std_diff^2 + 0.00001));

    // PSNR
    im_max = max(orig_vec);
    im_min = min(orig_vec);
    A = im_max - im_min;
    PSNR = 10 * log10((A^2) / (std_diff^2 + 0.0001));

    display(uint8(image_final), effect, "SNR = " + string(SNR) + ", PSNR = " + string(PSNR));
endfunction
