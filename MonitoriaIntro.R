##MONITORIA ESTATÍSTICA - INTRODUÇÃO AO R##

#ONDE APRENDER MAIS?
#1) https://bookdown.org/burak2358/SARP-EN/
  #Aydin, B., Algina, J., Leite, W. L., & Atilgan, H. (2018). An R Companion: A Compact Introduction for Social Scientists. Ankara: ANI Publishing.
#2) https://www.datacamp.com/courses/free-introduction-to-r
#3) https://www.statmethods.net/r-tutorial/index.html
#4) https://stackoverflow.com
#5) https://google.com > é sempre seu amigo

#DIRETÓRIO#
#Definindo o diretório - a pasta onde estão e estarão salvos os arquivos e scripts
  #É só copiar o endereço/caminho da pasta que você vai usar. 
    #ex. C:\Users\Rafaella\Demografia\Doutorado\R\2019\Monitoria Estatística
  #É sempre bom criar uma pasta para cada coisa e colocar tudo (script, bases, gráficos) nela
  #Se você é usuário do Windows, troque a barra \ pela barra / ou o R acusará um erro!!!!!!
direct = "COPIE AQUI O CAMINHO DA SUA PASTA"
setwd (direct)

#PACOTES#
#A versão 3.3.1 do R traz 30 pacotes que são armazenados na biblioteca do sistema. 
#Outras funções úteis são criadas por usuários R e disponibilizadas para a comunidade R.
  #Pro exemplo, professor Bernardo Lanza juntamente com Tim Riffe e Everton Lima fizeram o pacote DDM.
  #esse pacote estima o grau de cobertura do registro de óbitos para uma população.

#Você pode baixar pacotes R em seu computador e armazená-los na sua biblioteca. 
#Você precisa carregar(ativar) os pacotes em cada sessão antes de poder usá-los.

#Instalando pacotes
install.packages("readr")
install.packages("dplyr") 
install.packages("ggplot2")
install.packages("gmodels")
install.packages("descr")
install.packages("xlsx")
install.packages("modeest")
install.packages("RColorBrewer")

#Ativando pacotes
library(dplyr)
library(readr)
library(ggplot2)
library(foreign)
library(gmodels)
library(descr)
library(xlsx)
library (statip)
library(RColorBrewer)

##########################################################################################################
#SALVAR INFORMAÇÕES EM OBJETOS#

#A função mais básica do R é de calculadora. 
  4+4
  20^6
  sin(30) + 4^3 + log(4) + exp(3) + sqrt(7)
  
#As funções estimadas acima são calculadas, mas não são salvas no R
  #Podemos salvar o valor 4 dentro de uma variável a
  #Com isso, criamos um objeto 'a' no nosso Environment
    a = 4

#Quando salvamos um objeto o R não entende que queremos ver o que existe neste objeto
  #Para vermos o que está no objeto 'a' nós chamamos ele com o comando View
  View(a)  
  
#Nomes dos objetos são case-sensitive, então 'A' não será encontrado
  View(A)

#Da mesma maneira, se utilizarmos 'view' esse comando também não será encontrado
  view(a)
  
#Se temos um objeto número podemos somar ele com um número que não está definido em um objeto  
  a + 4
  
#Pode-se salvar um novo 'a' (sobrescrito) como um nome, que deve ser escrito em "" 
  #(que quer dizer que é escrito em uma linguagem que não é de programação)
  a = "bernardo"
  
#Como o objeto criado está na memória ele aparece na seção "Environment"
#Podemos também criar um objeto com várias observações dentro dele
  #Usamos a função c() para criar um vetor 
  
  a = c("bernardo", "cassio", "alisson", "gilvan", "zé")

#Perceba que a cada vez estamos reescrevendo o objeto 'a'
  #com isso, o primeiro "a=4" que criamos não existe mais. 
  #Então deve-se ter muita atenção com os nomes dos objetos. Uma opção é dar outro nome ao objeto
  professores.1ano = c("bernardo", "cassio", "alisson", "gilvan", "zé")

#Podemos também criar sequencias 
  seq(from=0,to=12, by=2) #sequencia de 0 até 12 de 2 em 2
    #Ou então seq(0,2, by=2)

#Ou repetições
  rep(0,12) #repetição de 0, 12 vezes
  rep(0:5,each=3) #Repetição de 0 a 5, cada um 3 vezes
  rep(0:5,times=3) #Repetição de 0 a 5, 3 vezes
    
#Comandos do teclado para facilitar a execução de tarefas
  #Ctrl+Enter >> Executar
  #Ctrl+l >> Limpa o console
  #Ctrl+s >> Salva o script
  #Esc >> Aborta a execução
  #rm(a) >> deleta o objeto 'a' do environment
  
#Ajuda!
  #Veja a função de média aritmética e seus argumentos
  ?mean 
  
  #Exemplos usando a função média
  example(mean)
  
########################################################################################################
#ABRINDO BANCOS DE DADOS#
  
  #Como nós definimos o diretório nas linhas 14 e 15 não precisamos ficar repetindo os caminhos
    #é só usar direto o nome do arquivo que DEVE ESTAR NA PASTA DO DIRETÓRIO
  
  #Banco Traição (Como ler um .txt)
  traicao = read.delim("traicoes.txt", 
                       header=T,
                       dec=".")  

  #Banco Traição 2 (Como ler um .csv)
  traicao2 <- read.table("Traicao2.csv", 
                       header = TRUE, 
                       sep=";", 
                       dec = ".")  

#O R tem extenções para ler arquivos de excel (.xls e .xlsx) e de outros programas como o Stata
  #Como estamos fazendo uma introdução, saber ler esses dois tipos de arquivo já é suficiente
  
 #Sobre o banco
  #Total de 601 observações
  #y = Número de traições no último ano
  #z1 = gênero (0 = mulher)
  #z2 = idade em anos
  #z3 = número de anos de casado
  #z4 = Se tem filhos (0 = não)
  #z5 = Religiosidade (0 = nenhuma,..., 5 = alta)
  #z6 = Educação em anos de estudo
  #z7 = Ocupação segundo a escala hollingshead 
        #(1= dependente de renda/renda não regular,..., 7 = proprietários de negócios, executivos, etc)
  #z8 = Auto-declaração quanto a 'qualidade' do casamento (1 = ruim, ..., 5 = ótimo)

  
#CONHECENDO UM BANCO#
#Vendo uma variável do banco 
  #O sinal $ indica que se está selecionando dentro daquele banco a variável específica
  traicao$z3
  
#Classificações das variáveis
  #logical (ex. TRUE, FALSE)
  #integer (ex. 5, 123, 86)
  #numeric (real or decimal) (ex. 12.56, 2.8, pi)
  #complex (ex. 1 + 0i, 1 + 4i)
  #character (ex. "a", "swc")
  #factor (numeric+character)
  
  class(traicao$z1)
  
  class(traicao$z2)

  class(traicao$z8)
  
#EXPORTANDO UM BANCO DE DADOS#
  #Como .csv
  write.csv(traicao, 
            file = "Traição.csv",
            row.names = F) 
  
  #Como .xlsx
  write.xlsx(traicao, 
             "Traição.xlsx",
             col.names = T,
             row.names = F)
  
  
#ALTERANDO BANCOS DE DADOS#  
#Rotulando uma variavel
  label(traicao$z2) = "Idade simples"
  
#Rotulando várias variáveis 
  #obs: Os nomes aparecem na ordem que as variáveis estão no banco
  colnames (traicao) = c("traicoes", "genero", "idade", "casamento", "filhos", 
                         "religiao", "escolaridade", "ocupacao", "qualidade")

#Rotulando os valores das variáveis  

  traicao$genero = factor(traicao$genero,
                          levels = c(0,1),
                          labels = c("Mulher", "Homem"))
  
  class(traicao$genero)

  traicao$filhos = factor(traicao$filhos,
                          levels = c(0,1),
                          labels = c("Nao","Sim"))
  
View(traicao)
  
#Selecionado variáveis específicas do banco
  
  #Os [] indicam uma lógica de matriz em que temos [linha, coluna]
  traicao_selvars = traicao[,c(1,2,3,4,6)]
  
  
  #Usando o comando subset
   #O | indica 'OU' enquanto o & indica 'E'
  
  newdata = subset(traicao, 
                   genero=="Mulher" & idade > 25)
  

##########################################################################################################    
#PACOTE DPLYR
#O pacote dplyr facilita a execução de algumas funções em um banco de dados
  
#Ele estabelece 5 verbos: Nessas funções o primeiro argumento é sempre o banco de dados, 
  #e no segundo argumento as variáveis que a operação que deve ser realizada

#SELECT: Retorna as duas colunas do banco de dados - Faz seleção de variáveis baseado nos nomes das colunas
religiosidadexfilhos = select(traicao, religiao, filhos)

#FILTER: Faz seleção de casos e esses casos podem ser salvos em um objeto
filter(traicao, idade > 25)
traicao.m.25 = filter(traicao, genero=="Mulher" & idade > 25)

#SUMMARISE: Summarise uses summary functions, 
  #functions that take a vector of values and return a single value
summarise(traicao, media = mean(idade))

  #Média de todas as variáveis
  summarise_all(traicao, funs(mean))
  
  #Desvio padrão de todas as variáveis
  summarise_all(traicao, funs(sd))
  
#GROUP_BY: Group data into rows with the same value
  #Apenas ordena as variáveis de acordo com a variável definida
group_by(traicao, idade)


#ARRANGE: Ordena de forma crescente ou decrescente - Para número e letras
arrange(traicao, desc(ocupacao)) 
  
#MUTATE: Cria uma nova coluna de variáveis no banco de dados a partir de variáveis já existentes
#Nova coluna
traicao = mutate(traicao, id.casamento = idade-casamento)

#Nova linha
nova_pessoa = data.frame(traicoes = 1,
                       genero = "Mulher",
                       idade = 42,
                       casamento = 15,
                       filhos = "Sim",
                       religiao = 3,
                       escolaridade = 20,
                       ocupacao = 3,
                       qualidade = 4) #Criando uma nova observação dentro de um data frame

rbind(traicao, nova_pessoa) 
  #(rbind) row bind > adicionando a nova linha dentro do data frame
  #(cbind) column bind > adiciona uma nova coluna no df

######################################################################################################## 
#TABELAS#

#Simples - 1 variável
b = table(traicao$genero)

b

prop.table(b) #Porporções de cada categoria

#Cruzadas
tab = table(Filhos = traicao$filhos,
      NºTraicoes = traicao$traicoes)

tab

addmargins(tab)

  #O valor de cada célula dividido pela soma total da matriz/tabela:
    #prop.table(m)
    prop.table(tab)
    
    #Ou então,
    tab/sum(tab)
  
  #O valor de cada célula dividido pela soma da linha:
    #prop.table(m, 1)
    prop.table(tab, 1)
  
  #O valor de cada célula dividido pela soma da coluna:
    #prop.table(m, 2)
    prop.table(tab, 2)

#Tabulação com três variáveis
tabela = table(Filhos = traicao$filhos, 
               NºTraicoes = traicao$traicoes,
               Genero = traicao$genero)

ftable(tabela) #Condensa as duas tabelas geradas anteriormente em uma só

##########################################################################################################
#ESTATÍSTICAS DESCRITIVAS#

  #Mínimo e Máximo
    min(traicao$idade)
    max(traicao$idade)
    range(traicao$idade)
    
  #Média  
    Média<- mean(traicao$idade)
    mean(traicao$idade, 
         na.rm = T) #Esse comando remove todas os missing (obs ausentes). ATENÇÃO AO USAR ESTE COMANDO!
    
  #Moda  
    mfv(traicao$idade)
    
  #Mediana
    median(traicao$idade)
    
  #Devio-padrão
    sd<- sd(traicao$idade)
  
  #Variância  
    var<- sd^2
      
    var(traicao$idade) #Essa variância é a variância AMOSTRAL
   
  #Coeficiente de Variação   
    cv(traicao$idade)
      
  #Assimetria
    skew(traicao$casamento)
   
  #Curtose   
    kurtosi(traicao$casamento)
  
  #Quantis    
    quantile(traicao$casamento)

    
#Como fazer isso de uma forma mais simples?
  describe(traicao)
    
  summary(traicao) #(Valor mínimo, 1º quartil, mediana, média, 3º quartil e valor máximo)
    
#A variância deve ser obtida pelo comando direto var
    
############################################################################################################  
#GRÁFICOS#

  #Histograma
    hist(traicao$casamento, 
         col = "pink",
         main = "Relação do Tempo de casamento",
         xlab = "Tempo decorrido desde o casamento em anos",
         ylab = "Frequência Absoluta")
     
    hist(traicao$casamento, 
       col = "lightblue",
       main = "Relação do Tempo de casamento",
       xlab = "Tempo decorrido desde o casamento em anos",
       ylab = "Probabilidade",
       prob = T)   

    lines(density(traicao$casamento)) #densidade de kernel
    
  #Gráfico de barras por grupos
    # Grafico de barras por grupo
    cols = brewer.pal(9, "Pastel1")
    pal = colorRampPalette(cols)
    
     x = barplot(table(traicao$idade,
                      traicao$religiao),
                beside = T, 
                ylim = c(0, 60),
                main = "Distribuicao das Pessoas por Cor ou Raca\nBrasil, 2011",
                col = pal(9),
                legend.text = c(17.5, 22, 27, 32, 37, 42, 47, 52, 57),
                args.legend = list(x = "topright"))
    
    x.freqs = table(traicao$idade,
                    traicao$religiao)
    
    x.freqs

    text(x = x,
         y = x.freqs,
         label = x.freqs,
         pos = 3, 
         cex = 0.6, 
         col = "maroon3")

    colors()[grep("pink",colors())]
    
  #Distribuição
    media_x<- mean(traicao$escolaridade)
    
    media_y<- mean(traicao$ocupacao)
    
    plot(traicao$escolaridade, 
         traicao$ocupacao, 
         col = "forestgreen",
         pch = 16,
         xlab = "Anos de estudo",
         ylab = "Tipo de Ocupação",
         main = "Relação entre anos de estudo e tipo de ocupação")
    
    abline(v = media_x, h=media_y, 
           col = "red", 
           lty = 2)
    
  #Box-plot
    boxplot(escolaridade~genero, 
            data = traicao,
            col = "cadetblue2",
            main = "Box-plot do nível de escolaridade por gênero",
            xlab = "Gênero",
            ylab = "Anos de Estudo")
    
    
#Fazendo gráficos com o pacote ggplot2
    #Histograma
    ggplot(data = traicao, aes(x = casamento))+
      geom_histogram(col = "deeppink", 
                     fill = "deeppink3", 
                     alpha = .4, #Quanto menor, mais transparente é o preenchimento
                     binwidth = .65) + #Largura das barras
      labs(title = "Relação do Tempo de casamento") + #Título do gráfico
      labs(x = "Anos de casado", #Título dos eixos
           y = "Frequência")
    
      #Criando uma linha na média das observações
        media<- mean(traicao$casamento)
        
          ggplot(data = traicao, 
                 aes(x = casamento))+
            geom_histogram(aes(y = ..count..), 
                           alpha = .5, 
                           binwidth = .65,
                           colour = "palevioletred1", 
                           fill = "palevioletred2") +
            scale_x_continuous(name = "Anos de casado") +
            scale_y_continuous(name = "Frequência") +
            labs(title = "Relação do Tempo de casamento")+
            geom_vline(xintercept = media, 
                       size = 1, 
                       colour = "maroon4",
                       linetype = "dashed")
          
    #Grafico de Densidade
    ggplot(traicao, aes(x = casamento))+
      geom_density(stat = "density",
                   position = "identity", 
                   colour = "mediumvioletred")
    
    #Cores por categorias
    ggplot(traicao,
           aes(x = casamento,
               y = idade))+ #Parametros esteticos gerais
      geom_point(aes(color = escolaridade))+ #Parametros esteticos específicos
      labs(title = "Relação entre idade e anos de casado segundo anos de estudo",
           caption = "Fonte: Elaborado a partir dos dados providos pelo Professor Gilvan Guedes")+
      scale_x_continuous(name = "Anos de Casado")+
      scale_y_continuous(name = "Idade")+
      scale_color_continuous("Anos de Estudo")
    
#Se você quiser fazer seus gráficos com cores diferentes veja:
    #http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
         
options(max.print=999999)
