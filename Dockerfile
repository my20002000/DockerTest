FROM ubuntu:21.04

RUN apt update 

RUN DEBIAN_FRONTEND=noninteractive apt install -y tzdata \
    && apt upgrade -y \
    && apt install build-essential libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev zlib1g-dev git gcc libgl1-mesa-glx vim wget  libglib2.0-0 -y


