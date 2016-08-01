# A Ciência de Dados e o Docker

>**Open Data Science** is not a single technology, but a revolution within the data science community. Open Data Science is an inclusive movement that makes open source tools for data science - data, analytics and computation - easily work together as a connected ecosystem.

## As promessas da OPEN DATA SCIENCE

### Disponibilidade


_Open Data Science_ é Ciência de Dados que usa tecnologias de **código aberto** (_open source_), disponibilizando ferramentas poderosas gratuitamente para todos que estejam interessados em em criar soluções ou realizar pesquisas que envolvam Big Data, Inteligência Artificial, Data Mining, Docker Contêineres, etc. Qualquer profissional de TI pode acessar um número grande de ferramentas  conectados num Ecosistema coeso, fornecendo a comunidade científica os maiores avanços da tecnologia para promover a inovação e os avanços desejados nos dias atuais.

### Inovação 

_Open Data Science_ reune as soluções mais inovadoras da Comunidade Open Source tais como Hadoop, Spark, Scala, R, Jupyter, Docker dentre outros. Essas comunidades vem demonstrando alta eficiencia na entrega de inovação em tecnologias abertas de TI tais como:

* Linguagens de programação expressivas 
* Linguagens de domínios específicas (DSL - Domain Specific Language)
* Armazenamento de dados persistentes de alta performance
* Algoritimos super eficientes
* Ambiente de Desenvolvimento interativo (Playground) para estudos e prototipação
* Servidores de Aplicações
* Automação de Infraestrutura em Contêineres 


### Interoperabilidade

As Tecnologias open source facilitam a Interoperabilidade por usar protocolos padrões e interfaces abertas de acesso além de repositórios de código com interfaces simplificadas para gestão de versões de software, controle de tickets (gestão de mudança), e Wiki para documentações técnicas, permitindo que qualquer interessado integre a seu gosto duas ou mais tecnologias. Como exemplo o Contêiner Docker discutido neste post pode ser integrado com outras tecnologias que venham agregar funcionalidades adicionais desejadas. 


### Transparência

Existe atualmente um grande número de Tecnologias **Open Data Science** tais como algoritimos e processos que são entreges transparentemente em pacotes **Open Source**. Esta transparência favorece a agregação de novas inovações da propria comunidade acadêmica e até de grandes empresas que financiam esses projetos (Apple, Google, Oracle, Microsoft, RedHat, etc.).

Estes são os valores entregues pelas soluções **Open Data Science** que podem ser usadas nas Universidades nas Instituições de Pesquisa no Governo e nas Empresas (industria, comercio, serviços e mídia). A seguir dou uma pincelada sobre como as coisas estão mudando de uma forma dramática na sociedade e sobre a importãncia da Colaboração entre os Indivíduos. 

## As novas regras nos leva a times colaborativos

Já é consenso tanto na comunidade científica quanto na comunidade empresarial e de governo que o trabalho isolado não produz os resultados desejados. É necessário que o time de cientistas e partes interessadas no projeto trabalhem colaborativamente e em tempo-real. É neste ponto que as abordagens de **Código Aberto** se mostram ainda mais relevantes pois usam estas técnicas em seus proprios times de desenvolvimento produzindo soluções incrivelmente valiosas como Sistemas Operacionais, Linguagens de Programação, APIs e Frameworks Diversos e mais recentemente Automação de Infra-estrutura.  

As ferramentas disponíveis na atualidade permitem usar toda o poder da colaboração em tempo-real para aumentar a produtividade das equipes de pesquisa além de alavancar a distribuição democrática do conhecimento.

COLOCAR IMAGEM de SCRUM 


## A necessidade de Processamento Paralelo

Ciência de dados requer processamento de alto desempenho devido aos requisitos impostos pelos algoritimos de alta complexidade (polinomial e exponencial). Além disso o grande volume de dados impõem requisitos específicos de persistência em termos de eficiência no armazenamento e na recuperação eficiente dos dados. Desta forma o ambiente operacional indicado para run-time nos leva a processamento distribuido em Clusters, Grid, ou Nuvens (privadas ou públicas). Existe uma grande diversidade de plataformas existentes para ambientes de processamento de alto desempenho e muitas delas distribuidas em **Código Aberto**. Assim o Processamento Paralelo ganha muita importância neste contexto e o **Docker Swarm** permite a criação dessa infraestrutura que permite solução agnóstica ao tipo de infraestrutura de TI a ser utilizada.



## Onde entra o Docker ?


Com o Docker é possível criar um ambiente de desenvolvimento completo e isolado que pode ser iniciado em segundos num macOS, Linux ou Windows 10. O Dockerfile que define o ambiente é um arquivo texto e podemos facilmente gereciar as mudanças usando o Github ou Bitbucket, por exemplo. 

Assim temos um ambiente Linux pronto para ser usado com os softwares já instalados. Desta forma eliminamos todo aquele custo de preparação de ambiente com os problemas de gerenciamento de versão de Sistema Operacional, distribuição Linux, versões incompatíveis de Python, Database, Aplications Servers, Frameworks, etc.

Eu preparei uma imagem Docker com diversas ferramentas para iniciar com pesquisas e projetos de **Ciência de Dados (Data Science)**.

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

Apesar de se chamar Spark, esta imagem também agrega outras funcionalidades como Apache WEB Server, Java JDK 8, Jupyter Notebook, entre outros. Tudo isso rodando num Sistema Operacional CentOS 7 64 bits.

Para rodar o ambiente basta usar :

```bash
docker run -i -t -h my-spark -p 8080:8080 -p 9999:9999 --rm parana/spark bash
```

A opção `--rm` demonstra o caráter efêmero de contêineres Docker. Com ela o contêiner será destruido ao final da sessão de uso e qualquer dado persistido no contêiner será destruido. Esta opção é util para testes e uso de playground. Uma outra execução do comando criará novamente um contêiner do Zero. Isto é muito útil para reproduzir testes e provas de conceito.


### Importância do Docker - Infrastructure as a Code

A equipe do Docker está Reinventando a forma de Construir e Distribuir Aplicações
O objetivo deles é Tornar a Internet Programável. Eles tem algumas metas imediatas:

* Reinventar a Caixa de Ferramentas dos Desenvolvedores
* Minutos em vez de horas para criar um ambiente
* Build better software plumbing (Melhorar os Bastidores)
* Criar mecanismos mais eficientes para gerir infraestrutura
* Promover os Padrões Abertos
* Código aberto e parceiros poderosos (Google, Microsoft, IBM, Amazon, ...)

### Evolução do Projeto Docker - SysAdmins lado a lado com Desenvolvedores

* Reinventando a Caixa de Ferramentas para Desenvolvedores
* Melhorar a experiencia dos desenvolvedores.
* Metodologia adotada por eles: Incremental Revolution
  * runtime - Docker Runtime
  * packaging & distribution - image, registry, distribution mechanism
  * service composition: docker-compose
  * machine management, clustering, networking, extensibility, runC
  * machine management: docker machine
  * clustering: docker swarm
  * networking: docker network - deve ser parte da aplicação e não do hardware. Respeitando as politicas de segurança. Built on industry standards. Com service discovery - docker service discovery - experimental feature - baseado no Serviço de DNS
  * extensibility: docker plugins - Dymanic Loading - no patchs or restart needed

### O que é o Docker ? 

* Engine Open Source de Automação de Infraestrutura
* Lançado em 2013 foi baseado inicialmente no projeto LXC - http://linuxcontainers.org
* Agora com sua propria implementação: libContainer
* Automatiza a construção de Ambientes Virtualizados de Execução de Aplicações
* Análogo a uma Maquina Virtual VMWare ou VirtualBox
* Super leve - Roda até no Raspberry Pi
* Desenvolvido pela dotCloud Inc atualmente Docker inc.
* Composto de : Kernel Linux + Daemon docker + docker client
* Permite "Dockerizar" aplicações em minutos
* Copy-on-write e Layers - Apenas o ultimo layer é read-write
* Compartilha recursos dos Contêineres com o Kernel do sistema Operacional
* Garante o isolamento de recursos (Processos, Filesystems, Redes, etc.)

### Características e Benefícios

* Repetibilidade - Capacita a criação de ambientes equivalentes rodando em Sistemas Operacionais diferentes
* Scripts de Definição de Ambiente permitem Gestão de Mudança via GIT ou SVN
* Resolve problema da dependência que aplicações tem de configurações de ambiente
* Facilita promoção de aplicação entre Desenvolvimento, Homologação e Produção
* Torna o processo de entrega de software muito mais eficiente e resistente a falhas
* Encoraja e favorece Service Oriented Architecture
* Encoraja e favorece Micro Service Architecture
* Melhora a Segurança nas Aplicações pois permite granularidade fina nas ACL
* Permite Aninhamento de containers.
* Tempo de start-up and shut-down super reduzidovirtualização a nível de processo 4 Fedoras em meio segundo num laptop.
* Alta Densidade - Podemos executar mais containers do que VM num mesmo host
* Maior Retorno do Investimento (ROI)
* Adoção pelos maiores players de Cloud Computing
* Google abandonou seu projeto container stack e está migrando para Docker - https://github.com/google/lmctfy
* Microsoft - está colaborando com Docker Inc para implementar Docker nativamente na proxima versão do Windows Server
* RedHat - OpenShift platform-as-a-service suporta Docker
* IBM - Bluemix platform-as-a-service (PaaS) suporta Docker
* Docker, CoreOS, Google, Microsoft, Amazon e outras empresas se uniram para criar um padrão para Containers independente de Sistema Operacional
* Agile - Docker provê agilidade para Gestão de Infraestrutura



 

 
