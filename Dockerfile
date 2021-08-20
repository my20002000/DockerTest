FROM alpine:edge

RUN apk add --no-cache python3-dev py3-pip py3-wheel \
    && apk add --no-cache py3-numpy-dev \
    && pip install --no-cache-dir scikit-build \
    && apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --virtual .build-deps blas-dev cmake eigen-dev freetype-dev glew-dev libgphoto2-dev libtbb-dev mesa-dev openexr-dev openjpeg-dev openjpeg-tools ninja make g++ openssl-dev libpng-dev \
    && pip install --no-cache-dir --no-build-isolation opencv-python \
    && apk del --no-cache .build-deps \
    && apk add --no-cache  openjpeg \
    && python3 -c "import cv2"
