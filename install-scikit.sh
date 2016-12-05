export PATH=/usr/local/miniconda/bin:${PATH} ;
rm -rf /usr/local/miniconda/ ;
curl -O https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh && chmod a+rx Miniconda2-latest-Linux-x86_64.sh && bash Miniconda2-latest-Linux-x86_64.sh  -b -p /usr/local/miniconda && conda install -y scikit-learn && conda install -y cython && conda install -y jupyter && curl -L -o coursier https://git.io/vgvpD && chmod +x coursier && mv coursier /usr/local/bin && coursier --help

