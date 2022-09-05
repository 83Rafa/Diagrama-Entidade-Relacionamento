### O PAPEL DOS BANCOS DE DADOS SQL E NOSQL NA ENGENHARIA DE DADOS

 1 -  SQL – É um tipo de banco de dados utilizado para armazenar informações que tenham um relacionamento entre si. 
  Utilizado para a normalização das informações relacionadas sem gerar muita duplicidade. Indicado quando se utiliza um esquema de 
  dados íntegro e consistente – Quando já se conhece o que será armazenado no banco. 

 2 -  NoSQL – É um banco complementar ao SQL que permite fazer armazenamento de dados não estruturados ou de estruturas diferentes. 
   Surgiu de uma necessidade de escalabilidade horizontal e um volume cada vez maior de informações não estruturadas. 
   
   O NoSQl reduz bastante a complexidade das consultas por não ter um esquema rígido, mas a questão da consulta precisa ser pensada 
   desde o início, definindo as chaves e as características do banco para se ter uma forma minimamente organizada de se consultar as 
   informações armazenadas no banco. A aplicação também precisa saber lidar com a falta de previsibilidade de um banco não relacional.
	
   Mesmo em um banco não relaciona é muito importante se atentar para a modelagem dos dados para que ele possa performar 
   adequadamente ao se fazer buscas pelas informações guardadas. 
   
3 - Quanto aos SGBDs é importante não se ater à tecnologia, mas sim entender conceitos e contextos de cada um para que quando 
   preciso se tenha condições de escolher a ferramenta que melhor atende à necessidade do momento. Inclusive essa é uma maneira 
   de se obter uma melhor curva de aprendizado de uma tecnologia para outra.
   
4 - Para escolher entre um banco relacional e um não relacional e até mesmo depois de escolher um não relacional, por exemplo, 
  se faz necessário estabelecer critérios técnicos para embasar decisões arquiteturais que justifiquem uma tecnologia específica, 
  além de questões orçamentárias e profissionais que lidam com aquela tecnologia.
 
5 - Para evoluir de uma tecnologia para outra é fundamental se preocupar com a transição, que gera custos que precisam ser considerados.

6 - Engenharia de dados e ciência de dados são perfis complementares. O engenheiro manipula, prepara a informação para que o cientista 
  de dados as traduza em insights que gerem informações de valor para a empresa.


#### A grande dica relacionada ao uso de bancos de dados Relacionais e NoSQl é compreender o conceito de cada ferramenta, explorar sua aplicabilidade para saber utilizar um ou outro adequadamente à necessidade do projeto e não apenas se amarrar a uma tecnologia ficando assim limitado.

