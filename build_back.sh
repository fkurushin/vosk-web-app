#!/bin/bash

sudo apt-get update

sudo apt-get install -y --no-install-recommends \
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

wget https://github.com/fkurushin/vosk-web-app/archive/refs/heads/master.zip

unzip master.zip && rm master.zip

wget https://alphacephei.com/vosk/models/vosk-model-ru-0.22.zip

unzip vosk-model-ru-0.22.zip -d model && rm vosk-model-ru-0.22.zip

git clone https://github.com/kaldi-asr/kaldi/opt/kaldi

cd /opt/kaldi/tools

./extras/install_openblas.sh

make -j $(nproc)

cd /opt/kaldi/src

./configure --shared --mathlib=OPENBLAS --use-cuda=no

make -j $(nproc) depend

make -j $(nproc)

export LD_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu:${LD_LIBRARY_PATH}"

/opt/kaldi/src/online2bin/online2-tcp-nnet3-decode-faster --read-timeout=-1 --samp-freq=8000 --frames-per-chunk=20 \
--extra-left-context-initial=0 --frame-subsampling-factor=3 --config=/model/conf/online.conf --min-active=200 --max-active=7000 \
--beam=15 --lattice-beam=8 --acoustic-scale=1.0 --port-num=5050 /model/am/final.mdl /model/graph/HCLG.fst /model/graph/words.txt


