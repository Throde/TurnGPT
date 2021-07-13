#!/bin/sh
# Grid Engine options (lines prefixed with #$)

#  job name: -N
#  use the current working directory: -cwd
#  runtime limit of 5 minutes: -l h_rt
#  memory limit of 1 Gbyte: -l h_vmem
#$ -N turngpt_mini            
#$ -cwd
#$ -o turngpt_mini_out.log
#$ -e turngpt_mini_err.log
#$ -l h_rt=36:00:00 
#$ -pe gpu 1
#$ -l h_vmem=32G

# priority
#$ -P lel_hcrc_cstr_students

# Email information
#$ -M s2125085@ed.ac.uk
#$ -m beas

# Initialise the environment modules
. /etc/profile.d/modules.sh

# Load Python
#module load python/3.8  # 3.4.3
module load anaconda
source activate slptorch

# Run the program
# available datasets: taskmaster metalwoz multiwoz coached persona dailydialog
# python hello.py
python ./turngpt/main.py \
  --model mini \
  --datasets maptask switchboard\
  --chunk_size 512 \
  --gpus 1 \
  --batch_size 2 \
