function y = unsharp_masking(image, lambda)
    // Laplaciano
    h = [0 -1 0; -1 4 -1; 0 -1 0]/4;

    // Dimensoes da imagem
    s = size(image);
    is_color = length(s) == 3;
    image = double(image);

    // Trata a image de acordo
    if is_color then
        y = zeros(s(1), s(2), s(3));
        for c = 1:3
            channel = image(:,:,c);
            dg = filter2(channel, h);
            y(:,:,c) = channel + (lambda * dg);
        end
    else
        dg = filter2(image, h);
        y = image + lambda * dg;
    end

    y = uint8(min(max(y, 0), 255));
endfunction
