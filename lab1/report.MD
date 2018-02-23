
# Relatório de MNSE: Lab 1

## Parte introdutória
Foi pedido para se escolher um ficheiro de música `mp3`
e o codificar duas vezes no formato `wav` com frequências de amostragem `44100hz` e `11025hz`. Verificou-se que a versão com a maior taxa de amostragem tem uma nitidez tangivelmente melhor do que a restante.

## Variação da frequência de amostragem usando ou não filtros
Foi pedido que se realizassem sub amostragens com e sem filtro de um ficheiro de som. Foi utilizado o ficheiro `batman_theme_x.wav` fornecido no Moodle com uma taxa de amostragem de `11025hz` e um número total de amostras de `70464`.
||Filtered|Unfiltered| 
|:-:|:-:|:-:|
|**k = 2**|Erro = 0.000824002 PSNR = 30.7726|Erro = 0.00962606 PSNR = 20.0974| 
|**k = 4**|Erro = 0.013163 PSNR = 18.7383|Erro = 0.0429577 PSNR = 13.6015| 

## Experiências de quantização
