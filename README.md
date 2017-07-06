# Detecção de áreas infartadas do miocárdio

Através do processamento de imagens digitais é possível detectar a região infartada e total do miocárdio para então obter o percentual da região infartada em relação a total. O infarto do miocárdio é responsável por grande parte dos óbitos registrados no Brasil, portanto, a pesquisa em fármacos para o tratamento da doença é relevante. Existem alguns parâmetros para medir a eficácia de um fármaco para essa doença, sendo um deles a extensão do infarto do miocárdio após o tratamento. 

Através de operações pontuais, como alteração de contraste, binarização e quantização de cores, e conceitos de cores complementares e análogas, foi possível detectar a região infartada e total do miocárdio. A partir da extensão dessas duas regiões, foi calculado o percentual de área infartada na secção do miocárdio da imagem de entrada. A solução apresenta boa acurácia e permite que os percentuais obtidos através das imagens de entrada sejam comparados, visto que todas imagens são processadas por algoritmos determinísticos. 

O percentual da região infartada do miocárdio é utilizado para comparar fármacos e determinar qual atuou com maior eficácia no tratamento do infarto do miocárdio.

## Imagens de entrada

A imagem de entrada do miocárdio infartado deve ter sido anteriormente corado com *Picrosirius red stain* (PSR). O PSR faz com que a região infartada ganhe coloração avermelhada, enquanto o restante do miocárdio passa a ter a cor amarela.

<p align="center">
  <img src="https://github.com/edineipiovesan/DIP-Myocardial_infarction/blob/master/Images/Original.jpg"/>
</p>

A imagem original foi cortada para que não contenha nenhum outro elemento visual além do próprio miocárdio. A imagem abaixo exemplifica a imagem de entrada esperada pelo script.

<p align="center">
  <img src="https://github.com/edineipiovesan/DIP-Myocardial_infarction/blob/master/Images/Input%20images/IMGa22.png"/>
</p>

## Imagem de saída

Após o processamento, uma nova imagem é criada na mesma pasta do script com a comparação visual das regiões detectadas.

<p align="center">
  <img src="https://github.com/edineipiovesan/DIP-Myocardial_infarction/blob/master/Images/Output%20images/m_compare_IMGa22.png"/>
</p>

## Relação entre área infartada e total

Na imagem de exemplo, a extensão do miocárdio infartado corresponde a aproximadamente 25% da área total da secção.

| Área infartada do miocárdio (pixels) | Área total do miocárdio (pixels) | Área do miocárdio infartada (%) |
|:-:|:-:|:-:|
| 8085 | 31255 | 25.8679 |
