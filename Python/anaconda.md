anaconda3/bin/conda
    conda is a tool for managing and deploying applications, environments and packages.

conda create --name pythonPytorch python=3.7.1
conda activate pythonPytorch
conda deactivate

## 更改源

conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge 
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/msys2/

设置搜索时显示通道地址
conda config --set show_channel_urls yes

vi ~/.condarc


conda create --name test python=2.7
conda create --name test python=2.7 requests

conda env list  / conda info -e
conda activate test(source activate test)
    conda 不能用, 而是 source 
    source activate test

conda install numpy
