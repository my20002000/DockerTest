FROM alpine:edge

RUN apk add --no-cache python3-dev py3-pip py3-wheel git openssh-client \
    && apk add --no-cache py3-numpy-dev \
    && pip install --no-cache-dir scikit-build \
    && apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --virtual .build-deps blas-dev cmake eigen-dev ffmpeg-dev freetype-dev glew-dev gstreamer-dev harfbuzz-dev hdf5-dev lapack-dev libdc1394-dev libgphoto2-dev libtbb-dev mesa-dev openexr-dev openjpeg-dev openjpeg-tools qt5-qtbase-dev vtk-dev ninja make g++ openssl-dev libpng-dev \
    && pip install --no-cache-dir --no-build-isolation opencv-python \
    && apk del --no-cache .build-deps \
    && apk add --no-cache lapack blas openexr openjpeg libdc1394 ffmpeg-libs \
    && python3 -c "import cv2"
