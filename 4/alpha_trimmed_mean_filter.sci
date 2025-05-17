function imagem_filtrada = alpha_trimmed_mean_filter(imagem, tamanho_janela, alpha)
    // Aplica o filtro da média aparada alfa a uma imagem para reduzir o ruído.
    //
    // imagem: A imagem de entrada (matriz numérica).
    // tamanho_janela: O tamanho da janela do filtro (um escalar ímpar, por exemplo, 3, 5, 7).
    // alpha: O parâmetro alfa (um valor entre 0 e 0.5).
    //
    // imagem_filtrada: A imagem filtrada.

    if modulo(tamanho_janela, 2) == 0 then
        error("O tamanho da janela deve ser um número ímpar.");
    end

    if alpha < 0 | alpha >= 0.5 then
        error("O valor de alfa deve estar entre 0 e 0.5 (exclusive).");
    end

    [linhas, colunas] = size(imagem);
    raio = floor(tamanho_janela / 2);
    imagem_filtrada = zeros(linhas, colunas);

    t = floor(alpha * tamanho_janela * tamanho_janela); // Número de pixels a serem descartados de cada extremidade

    for i = 1 : linhas
        for j = 1 : colunas
            // Define a janela ao redor do pixel atual
            linha_inicio = max(1, i - raio);
            linha_fim = min(linhas, i + raio);
            coluna_inicio = max(1, j - raio);
            coluna_fim = min(colunas, j + raio);

            janela = imagem(linha_inicio:linha_fim, coluna_inicio:coluna_fim);
            pixels_janela = janela(:); // Transforma a janela em um vetor coluna

            pixels_ordenados = gsort(pixels_janela, "g", "d"); // Ordena os pixels da janela (crescente por padrão)

            // Remove os valores aparados das extremidades
            pixels_aparados = pixels_ordenados(t + 1 : $ - t);

            // Calcula a média dos pixels restantes
            if ~isempty(pixels_aparados) then
                imagem_filtrada(i, j) = mean(double(pixels_aparados))
            else
                // Se todos os pixels foram aparados (o que não deve acontecer com alpha < 0.5 e janela >= 3),
                // mantemos o valor original do pixel.
                imagem_filtrada(i, j) = imagem(i, j);
            end
        end
    end
    imagem_filtrada = uint8(imagem_filtrada)
endfunction

// // Aplicando o alpha-trimmed filter
// function imagem_filtrada = alpha_trimmed_mean_filter(imagem, tamanho_janela, alpha)
//     // Aplica o filtro da média aparada alfa a uma imagem para reduzir o ruído.
//     // imagem: A imagem de entrada (matriz numérica).
//     // tamanho_janela: O tamanho da janela do filtro (um escalar ímpar, por exemplo, 3, 5, 7).
//     // alpha: O parâmetro alfa (um valor entre 0 e 0.5).
//     // imagem_filtrada: A imagem filtrada.
    
//         if (mod(tamanho_janela, 2) == 0)
//             error('O tamanho da janela deve ser um número ímpar.');
//         end
    
//         if (alpha < 0 || alpha >= 0.5)
//             error('O valor de alfa deve estar entre 0 e 0.5 (exclusive).');
//         end
    
//         [linhas, colunas] = size(imagem);
//         raio = floor(tamanho_janela / 2);
//         imagem_filtrada = zeros(linhas, colunas) //, class(imagem));
    
//         t = floor(alpha * tamanho_janela * tamanho_janela); // Número de pixels a serem descartados de cada extremidade
    
//         for i = 1 : linhas
//             for j = 1 : colunas
//                 // Define a janela ao redor do pixel atual
//                 linha_inicio = max(1, i - raio);
//                 linha_fim = min(linhas, i + raio);
//                 coluna_inicio = max(1, j - raio);
//                 coluna_fim = min(colunas, j + raio);
    
//                 janela = imagem(linha_inicio:linha_fim, coluna_inicio:coluna_fim);
//                 pixels_janela = janela(:); // Transforma a janela em um vetor coluna
    
//                 pixels_ordenados = gsort(pixels_janela); // Ordena os pixels da janela
    
//                 // Remove os valores aparados das extremidades
//                 pixels_aparados = pixels_ordenados(t + 1 : end - t);
    
//                 // Calcula a média dos pixels restantes
//                 if ~isempty(pixels_aparados)
//                     imagem_filtrada(i, j) = mean(pixels_aparados);
//                 else
//                     // Se todos os pixels foram aparados (o que não deve acontecer com alpha < 0.5 e janela >= 3),
//                     // mantemos o valor original do pixel.
//                     imagem_filtrada(i, j) = imagem(i, j);
//                 end
//             end
//         end
//     end

