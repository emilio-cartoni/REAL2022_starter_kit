#!/bin/bash
set -e

cd docker

# Download Miniconda if not present or if SHA is not correct
if [ ! -f ./Miniconda3-py38_4.10.3-Linux-x86_64.sh ]; 
then
    echo "Miniconda file not found, downloading..."
    wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-Linux-x86_64.sh
    chmod +x Miniconda3-py38_4.10.3-Linux-x86_64.sh
    echo "Miniconda file downloaded."
else
    CONDASHA=$(sha256sum ./Miniconda3-py38_4.10.3-Linux-x86_64.sh | cut -f1 -d" ")
    echo $CONDASHA
    if [ "$CONDASHA" == '935d72deb16e42739d69644977290395561b7a6db059b316958d97939e9bdf3d' ];
    then
        echo "Miniconda file already present."
    else
        echo "Miniconda file SHA verification failed, downloading again..."
        rm Miniconda3-py38_4.10.3-Linux-x86_64.sh
        wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-Linux-x86_64.sh
        chmod +x Miniconda3-py38_4.10.3-Linux-x86_64.sh
        echo "Miniconda file downloaded."
    fi
fi

# Copy yml files inside ./docker (to keep track of the file used in build)
cp ../environment.yml environment_build.yml
echo "environment.yml copied."

cp ../options.yml options_build.yml
echo "options.yml copied."

cd ..

# Docker image build
# Image is given two tags, one with current timestamp and one with "latest"
gpu_support=false
#gpu_support=true
if [ "$gpu_support" = true ] ; then
    docker build -t real2021submission:$(date '+%Y%m%d%H%M%S') -t real2021submission:latest -f ./docker/Dockerfile_gpu  .
else
    docker build -t real2021submission:$(date '+%Y%m%d%H%M%S') -t real2021submission:latest -f ./docker/Dockerfile  .
fi

