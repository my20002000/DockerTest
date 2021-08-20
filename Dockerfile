FROM centos:7

RUN yum clean all \
    && yum makecache fast \
    && yum install yum-utils git make gcc mesa-libGL openssl-devel wget -y \
    && wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /miniconda.sh \
    && chmod +x /miniconda.sh \
    && /miniconda.sh -b -p /miniconda \
    && rm /miniconda.sh 
    
ENV PATH=/miniconda/bin:$PATH

# Create a Python 3.7 environment
RUN /miniconda/bin/conda install -y conda-build \
    && /miniconda/bin/conda create -y --name py37 python=3.7 \
    && /miniconda/bin/conda clean -ya

ENV CONDA_DEFAULT_ENV=py37
ENV CONDA_PREFIX=/miniconda/envs/$CONDA_DEFAULT_ENV
ENV PATH=$CONDA_PREFIX/bin:$PATH
ENV CONDA_AUTO_UPDATE_CONDA=false

RUN pip install opencv_python==4.5.1.48 , onnxruntime==1.7.0 , six==1.15.0 , pyclipper==1.2.1 , numpy==1.19.1 , Shapely==1.7.1 , Flask==1.1.2 , pillow==8.3.1 
    
