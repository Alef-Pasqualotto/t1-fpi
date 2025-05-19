function display(imagem, titulo, descricao)
    // Caso não sejam informados todos os parâmetros
    if argn(2) < 2 then
        titulo = " ";
    end
    if argn(2) < 3 then
        descricao = " ";
    end
    
    figure;
    imshow(uint8(imagem));
    title(titulo);
    xlabel(descricao);
endfunction