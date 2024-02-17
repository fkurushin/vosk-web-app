#!/bin/bash
MODELNAME=vosk-model-ru-0.42

apt-get update

apt-get install -y --no-install-recommends \
    g++ \
    make \
    automake \
    autoconf \
    bzip2 \
    unzip \
    wget \
    sox \
    libtool \
    git \
    subversion \
    python2.7 \
    python3 \
    zlib1g-dev \
    ca-certificates \
    gfortran \
    patch \
    ffmpeg \
    vim \
    libopenblas-dev

wget https://alphacephei.com/vosk/models/$MODELNAME.zip

unzip $MODELNAME.zip && rm $MODELNAME.zip

mv $MODELNAME/* .

git clone https://github.com/kaldi-asr/kaldi.git

cd ./kaldi/tools

./extras/install_openblas.sh

./extras/install_irstlm.sh

make -j $(nproc)

cd ../src

./configure --shared --mathlib=OPENBLAS --use-cuda=no

make -j $(nproc) depend

make -j $(nproc)

export LD_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu:${LD_LIBRARY_PATH}"

cd /scripts

kaldi/src/online2bin/online2-tcp-nnet3-decode-faster \
--read-timeout=-1 \
--samp-freq=8000 \
--frames-per-chunk=20 \
--extra-left-context-initial=0 \
--frame-subsampling-factor=3 \
--config=conf/online.conf \
--min-active=200 \
--max-active=7000 \
--beam=15 \
--lattice-beam=8 \
--acoustic-scale=1.0 \
--port-num=5050 \
am/final.mdl \
graph/HCLG.fst \
graph/words.txt