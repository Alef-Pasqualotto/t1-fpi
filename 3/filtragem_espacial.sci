// Contaminando as imagens
cartas = imread('C:\Users\AlefPasqualotto\Desktop\Escola\UFRGS\Sem5\FPI\Trabalho\3\cards.png');
pessoas = imread('C:\Users\AlefPasqualotto\Desktop\Escola\UFRGS\Sem5\FPI\Trabalho\3\people.jpg');
display(cartas, "Original");
display(pessoas, "Original");

// a)

for percentage_gauss_noise = 0.1:0.3:0.7
    percentage_salt_noise = percentage_gauss_noise;

    // Aplica o ruido
    cartas_ruidoso = noisefier(cartas, percentage_gauss_noise, percentage_salt_noise);
    pessoas_ruidoso = noisefier(pessoas, percentage_gauss_noise, percentage_salt_noise);
          
    display(pessoas_ruidoso, "Ruidoso gauss e salt = " + string(percentage_gauss_noise));
    display(cartas_ruidoso, "Ruidoso gauss e salt = " + string(percentage_gauss_noise));
    for alpha = 0.09:0.2:0.49
        for tam_janela_filtro = 3:2:5
            // Aplicando o alpha-trimmed filter
            cartas_filtrado = alpha_trimmed_mean_filter(cartas_ruidoso, tam_janela_filtro, alpha);
            pessoas_filtrado = alpha_trimmed_mean_filter(pessoas_ruidoso, tam_janela_filtro, alpha);
            display_fidelity(cartas, cartas_filtrado, "Recuperado: alpha = " + string(alpha) + " janela = " + string (tam_janela_filtro) + " ruido = " + string(percentage_gauss_noise));
            display_fidelity(pessoas, pessoas_filtrado, "Recuperado: alpha = " + string(alpha) + " janela = " + string (tam_janela_filtro) + " ruido = " + string(percentage_gauss_noise));
        end
    end
end

// b)

display(cartas, "Original");
display(pessoas, "Original");
for lambda = 0.0:1:5

    // Fazendo o unsharp masking
    cartas_sharp = unsharp_masking(cartas, lambda);
    pessoas_sharp = unsharp_masking(pessoas, lambda);
    
    display(cartas_sharp, "Detalhada", "Lambda "+ string(lambda));
    display(pessoas_sharp, "Detalhada", "Lambda = " + string(lambda));
end