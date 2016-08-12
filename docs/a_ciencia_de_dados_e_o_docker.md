# A Ciência de Dados e o Docker

> **Open Data Science** não é uma única tecnologia, mas uma revolução dentro da comunidade científica de dados. *Open Data Science* é um movimento **inclusivo** que produz ferramentas de *código aberto* para a ciência de dados permitindo que se trabalhe facilmente com um ecossistema conectado de Applications Servers, Frameworks e APIs.

## As promessas da OPEN DATA SCIENCE

### Disponibilidade


_Open Data Science_ é Ciência de Dados que usa tecnologias de **código aberto** (_open source_), disponibilizando ferramentas poderosas gratuitamente para todos que estejam interessados em criar soluções ou realizar pesquisas que envolvam Big Data, Inteligência Artificial, Data Mining, Docker Contêineres, etc. Qualquer profissional de TI pode acessar um número grande de ferramentas  conectados num Ecosistema coeso, fornecendo a comunidade científica os maiores avanços da tecnologia para promover a inovação e os avanços desejados nos dias atuais.

### Inovação 

_Open Data Science_ reune as soluções mais inovadoras da Comunidade Open Source tais como Hadoop, Spark, Scala, R, Jupyter, Docker dentre outros. Essas comunidades vem demonstrando alta eficiencia na entrega de inovação em tecnologias abertas de TI tais como:

* Linguagens de programação expressivas 
* Linguagens de domínios específicas (DSL - Domain Specific Language)
* Armazenamento de dados persistentes de alta performance
* Algoritimos super eficientes de processamento paralelo
* Ambiente de Desenvolvimento interativo (Playground) para estudos e prototipação
* Servidores de Aplicações
* Automação de Infraestrutura em Contêineres 


### Interoperabilidade

As Tecnologias open source facilitam a Interoperabilidade por usar protocolos padrões e interfaces abertas de acesso além de repositórios de código com interfaces simplificadas para gestão de versões de software, controle de tickets (gestão de mudança), e Wiki para documentações técnicas, permitindo que qualquer interessado integre a seu gosto duas ou mais tecnologias. Como exemplo o Contêiner Docker discutido neste post pode ser integrado com outras tecnologias que venham agregar funcionalidades adicionais desejadas. 


### Transparência

Existe atualmente um grande número de Tecnologias **Open Data Science** tais como algoritimos e processos que são entreges transparentemente em pacotes **Open Source**. Esta transparência favorece a agregação de novas inovações da propria comunidade acadêmica e até de grandes empresas que financiam esses projetos (Apple, Google, Oracle, Microsoft, RedHat, etc.).

Estes são os valores entregues pelas soluções **Open Data Science** que podem ser usadas nas Universidades nas Instituições de Pesquisa no Governo e nas Empresas (industria, comercio, serviços e mídia). A seguir dou uma pincelada sobre como as coisas estão mudando de uma forma dramática na sociedade e sobre a importancia da Colaboração entre os Indivíduos. 

## As novas regras nos leva a times colaborativos

Já é consenso tanto na comunidade científica quanto na comunidade empresarial e de governo que o trabalho isolado não produz os resultados desejados. É necessário que o time de cientistas e partes interessadas no projeto trabalhem colaborativamente e em tempo-real. É neste ponto que as abordagens de **Código Aberto** se mostram ainda mais relevantes pois usam estas técnicas em seus proprios times de desenvolvimento produzindo soluções incrivelmente valiosas como Sistemas Operacionais, Linguagens de Programação, APIs e Frameworks diversos, e mais recentemente, Automação de Infra-estrutura.  

As ferramentas disponíveis na atualidade permitem usar toda o poder da colaboração em tempo-real para aumentar a produtividade das equipes de pesquisa além de alavancar a distribuição democrática do conhecimento.

![SCRUM](https://raw.githubusercontent.com/joao-parana/spark/master/docs/images/rugby-scrum.jpg)


## A necessidade de Processamento Paralelo

Ciência de dados requer processamento de alto desempenho devido aos requisitos impostos pelos algoritimos de alta complexidade (polinomial e exponencial). Além disso o grande volume de dados impõem requisitos específicos de persistência em termos de eficiência no armazenamento e na recuperação eficiente dos dados. Desta forma o ambiente operacional indicado para run-time nos leva a processamento distribuido em Clusters, Grid, ou Nuvens (privadas ou públicas). Existe uma grande diversidade de plataformas existentes para ambientes de processamento de alto desempenho e muitas delas distribuidas em **Código Aberto**. Assim o Processamento Paralelo ganha muita importância neste contexto e o **Docker Swarm** permite a criação dessa infraestrutura que permite solução agnóstica ao tipo de infraestrutura de TI a ser utilizada.


## Ferramentas básicas 

Como ferramentas básicas para uso diário de um **Cientista de Dados** posso citar:

* Conta no Github
* Conta no Docker HUB
* Ambiente configurado para **Apache Spark**
* Ambiente configurado para **R** (opcional)

**Por que é necessário uma conta no _Github_ ?** 

O _Github_ fornece um serviço de edição colaborativa e compartilhamento de código de qualidade excepcional. Na versão gratis do serviço é possível criar uma número ilimitado de repositórios, cada um contendo um ou mais projetos de software. É possivel também criar organizações e associar pessoas a elas. Essas pessoas podem colaborar na criação de código de acesso público. O _Github_ suporta também funcionalidades de gerenciamento de versão de código, Páginas Wiki para documentação, Gerenciamento de incidentes e integração com Serviços de Terceiros via WebHook.

**Por que é necessário uma conta no _Docker HUB_ ?** 

O _Docker HUB_ fornece um serviço de construção automatizada de Imagens para maquinas virtuais Linux de grande eficiência. Além disso o _Docker HUB_ armazena estas imagens e disponibiliza de forma segura e colaborativa usando um modelo parecido com o Github. O _Docker HUB_ se integra com o _Github_ e _Bitbucket_ provendo _Automated Build_ de imagens facilitando muito o trabalho de criação de ambientes completos de TI. Para mais detalhes veja as próximas sessões desse documento. 

**E quanto ao _Apache Spark_ ?** 

O _Apache Spark_ é um _Framework_ de computação em cluster de código aberto. O _Spark_ foi desenvolvido originalmente na Universidade da Califórnia - Berkeley. A base de código do foi doado à Apache Software Foundation, que tem mantido desde então. O _Spark_ fornece uma interface para programação de _Clusters_ com paralelismo de dados implícita e tolerância a falhas Veja uma [Visão Geral](https://en.wikipedia.org/wiki/Apache_Spark#Overview) sobre o _Spark_ no site [https://en.wikipedia.org](https://en.wikipedia.org/wiki/Apache_Spark#Overview). 

**A linguagem R**

*R* é uma linguagem e também um ambiente de desenvolvimento integrado para cálculos estatísticos e apresentação de gráficos. Instalando o **R Studio** você poderá usar o **R Markdown** - [http://rmarkdown.rstudio.com](http://rmarkdown.rstudio.com)




## Onde entra o Docker ?


Com o Docker é possível criar um ambiente de desenvolvimento completo e isolado que pode ser iniciado em segundos num macOS, Linux ou Windows 10. O Dockerfile (artefato que define o ambiente) é um arquivo texto e podemos facilmente gereciar as mudanças usando o Github ou Bitbucket, por exemplo. 

Assim temos um ambiente Linux pronto para ser usado com os softwares já instalados e configurados. Desta forma eliminamos todo aquele custo de preparação de ambiente com os problemas de gerenciamento de versão de Sistema Operacional, distribuição Linux, versões incompatíveis de Python, Database, Aplications Servers, Frameworks, Chaves de criptografia, scripts SQL, etc.

Para este artigo eu preparei uma **imagem Docker** com diversas ferramentas para iniciar com pesquisas e projetos de **Ciência de Dados (Data Science)**.

Veja no Github.

[https://github.com/joao-parana/spark](https://github.com/joao-parana/spark)

Se desejar baixar o projeto para sua máquina local e fazer o build da Imagem use o seguinte comando:

```bash
git clone https://github.com/joao-parana/spark.git
cd spark
./build-spark
```

Você pode usar a imagem também diretamente do HUB do Docker. Para isso basta executar 

```bash
docker pull parana/spark
```

Apesar de se chamar **spark**, esta imagem também agrega outras funcionalidades como Apache WEB Server, Java JDK 8, entre outros. Tudo isso rodando num Sistema Operacional CentOS 7 64 bits.

Para rodar o ambiente basta usar :

```bash
docker run -i -t -h my-spark -p 8080:8080 --rm parana/spark bash
```

A opção `--rm` demonstra **o caráter efêmero de contêineres Docker**. Com ela o contêiner será destruido ao final da sessão de uso e qualquer dado persistido no contêiner será destruido. Esta opção é util para testes e uso de playground. Uma outra execução do comando criará novamente um contêiner do Zero. Isto é muito útil para reproduzir testes e provas de conceito.


### Importância do Docker - Infrastructure as a Code

A seguir algumas informações adicionais sobre Docker para quem não conhece este Ecosistema de Automação de Infraestrutura de TI.

A equipe do Docker está Reinventando a forma de Construir e Distribuir Aplicações.

O objetivo deles é Tornar a Internet Programável. 

Eles estão trabalhando em algumas metas imediatas:

* Reinventar a Caixa de Ferramentas dos Desenvolvedores para que criemos um ambiente de TI em minutos em vez de horas, melhorarando os bastidores e criando mecanismos mais eficientes para gerir infraestrutura.
* Promover os Padrões Abertos liberando o proprio código do Docker como *Código Aberto* e trabalhando com parceiros poderosos (Google, Microsoft, IBM, Amazon, RedHat, ...) para melhorar a programação de infraestrutura.
* Melhorar a experiencia dos desenvolvedores e dos SysAdmins.
* Adotar Metodologia **Incremental Revolution** com os focos:
  * runtime - Docker Runtime
  * packaging & distribution - image, registry, distribution mechanism
  * service composition: docker-compose
  * machine management (docker machine), clustering, networking, extensibility, runC
  * clustering: docker swarm
  * networking: docker network - deve ser parte da aplicação e não do hardware. Respeitando as politicas de segurança. *Built on top of industry standards*. Com service discovery - baseado no Serviço de DNS
  * extensibility: docker plugins - *Dymanic Loading - no patchs or restart needed*

### Características e Benefícios do Docker

A seguir destaco algumas características do Docker que considero importantes no Ambiete de TI.

* Repetibilidade - Capacita a criação de ambientes equivalentes rodando em Sistemas Operacionais diferentes
* Scripts de Definição de Ambiente permitem Gestão de Mudança via GIT ou SVN
* Resolve problema da dependência que aplicações tem de configurações de ambiente
* Facilita promoção de aplicação entre Desenvolvimento, Homologação e Produção
* Torna o processo de entrega de software muito mais eficiente e resistente a falhas
* Encoraja e favorece *Service Oriented Architecture* e *Micro Service Architecture*
* Melhora a Segurança nas Aplicações pois permite granularidade fina nas ACL
* Tempo de start-up and shut-down super reduzido
* Alta Densidade - Podemos executar mais containers do que VM num mesmo host
* Maior Retorno do Investimento (ROI)
* Adoção pelos maiores players de Cloud Computing
    * Google abandonou seu projeto container stack e está migrando para Docker - https://github.com/google/lmctfy
    * Microsoft - está colaborando com Docker Inc para implementar Docker nativamente na proxima versão do Windows Server
    * RedHat - OpenShift platform-as-a-service suporta Docker
    * IBM - Bluemix platform-as-a-service (PaaS) suporta Docker
* Docker, CoreOS, Google, Microsoft, Amazon e outras empresas se uniram para criar um padrão para Containers independente de Sistema Operacional
* Agile - Docker provê agilidade para Gestão de Infraestrutura



 

 
