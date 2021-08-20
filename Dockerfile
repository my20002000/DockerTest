FROM python:3.7.11-alpine3.14

RUN  apk add --no-cache libtbb libjpeg mesa-gl \
    && apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ libtbb-dev openjpeg-dev openjpeg-tools libjpeg-turbo-dev libpng-dev tiff-dev libwebp-dev mesa-dev libgphoto2-dev \
    && pip install --no-cache-dir scikit-build \
    && pip install --no-cache-dir --no-build-isolation opencv_python==4.5.1.48 \
    && apk del --no-cache .build-deps \
    && python3 -c "import cv2"
