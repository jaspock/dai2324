
# Generación de HTML

## Compilación local de la documentación

### Documentación y dispositivas:

    [conda activate dai]
    make

### Instalación de miniconda

    conda=Miniconda3-latest-Linux-x86_64.sh 
    curl -O https://repo.anaconda.com/miniconda/$conda
    bash $conda

### Configuración del entorno

    conda create --name dai python=3.9
    conda activate dai
    conda install -c conda-forge pandoc=2.19.2
    pip install -r requirements.txt
    conda deactivate
