FROM ubuntu:21.04

RUN apt update 

RUN DEBIAN_FRONTEND=noninteractive apt install -y tzdata \
    && apt upgrade -y \
    && apt install build-essential libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev zlib1g-dev git gcc libgl1-mesa-glx vim wget  libglib2.0-0 -y \
    && wget https://www.python.org/ftp/python/3.7.11/Python-3.7.11.tgz \
    && tar -xzvf Python-3.7.11.tgz \
    && cd Python-3.7.11 && ./configure --enable-optimizations && make && make install \
    && pip install paddleocr paddlepaddle Flask gunicorn gevent \
    && mkdir -p /home/PaddleOCR/inference \
    && wget -qO- -O /home/PaddleOCR/inference/tmp.tar https://paddleocr.bj.bcebos.com/dygraph_v2.0/ch/ch_ppocr_server_v2.0_det_infer.tar && tar xf /home/PaddleOCR/inference/tmp.tar -C /home/PaddleOCR/inference && rm /home/PaddleOCR/inference/tmp.tar \
    && wget -qO- -O /home/PaddleOCR/inference/tmp.tar https://paddleocr.bj.bcebos.com/dygraph_v2.0/ch/ch_ppocr_mobile_v2.0_cls_infer.tar && tar xf /home/PaddleOCR/inference/tmp.tar -C /home/PaddleOCR/inference && rm /home/PaddleOCR/inference/tmp.tar \
    && wget -qO- -O /home/PaddleOCR/inference/tmp.tar https://paddleocr.bj.bcebos.com/dygraph_v2.0/ch/ch_ppocr_server_v2.0_rec_infer.tar && tar xf /home/PaddleOCR/inference/tmp.tar -C /home/PaddleOCR/inference && rm /home/PaddleOCR/inference/tmp.tar 
    

    


