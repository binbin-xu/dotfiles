#!/bin/bash -e

HERE=$(realpath $(dirname ${BASH_SOURCE[0]}))
source $HERE/__init__.sh
ROOT=$(realpath $HERE/..)

cd $ROOT

source .anaconda3/bin/activate

# -------------------------------------------------------------------------------------

echo_bold "==> Installing the right pip and dependencies for the fresh python"
pip_install --upgrade pip 
conda_install python #=3.7  # meet tensorflow requirements

#echo_bold "==> Installing computer vision-related packages"
#pip_install \
#  ipython \
#  jupyter \
#  cython\
#  numpy\
#  matplotlib\
#  opencv-python \
#  opencv-contrib-python \
  # plyfile \
  # pandas \
  # requests \
  # scipy \
  # imageio \
  # scikit-image \
  # sklearn \
  # pyyaml \
  # tqdm \

#echo_bold "==> Installing deep learning-related packages"
# pip_install future 
# conda install pytorch torchvision cudatoolkit=9.2 -c pytorch
# pip_install tensorboard

# echo_bold "==> Installing requirements"
# pip_install -r install/requirements.txt

# echo_bold "==> Installing conda environment"
# conda env update --file install/environment.yml #--prune

# pip install -e .

# ---------------------------------------------------------------------------------------

echo_bold "\nAll is well! You can start using this!
  $ source .anaconda3/bin/activate
"
