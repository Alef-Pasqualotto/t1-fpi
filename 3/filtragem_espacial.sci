clear;clc
// Contaminando a imagem
baloes = imread('C:\Users\AlefPasqualotto\Desktop\Escola\UFRGS\Sem5\FPI\Trabalho\4\balloons.png');
percentagem_ruido_salt = 0.05;
percentagem_ruido_gaussian = 0.05;
baloes_salt = imnoise(baloes, 'salt & pepper', percentagem_ruido_salt);
baloes_ruidoso = imnoise(baloes_salt, 'gaussian', percentagem_ruido_gaussian);
//imshow(uint8(baloes_ruidoso));

// Aplicando o alpha-trimmed filter
baloes_filtrados = alpha_trimmed_mean_filter(baloes, 3, 0.2);

// Calculando SNR
SNR = 10*log10(double(std2(baloes)^2 / (std2(baloes - baloes_ruidoso)^2)+0.00001)),

// Calculando PSNR
im_max = double(max(max(baloes_ruidoso)));
im_min = double(min(min(baloes_ruidoso)));
A = (im_max - im_min);
PSNR = 10*log10(double((A^2)/(std2(baloes_ruidoso - baloes)^2)+0.0001)),