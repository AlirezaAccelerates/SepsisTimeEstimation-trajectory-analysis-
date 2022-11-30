#!/bin/bash
#SBATCH --job-name=potato
#SBATCH --nodes=1 --ntasks=7
#SBATCH --time=6:30:00
#SBATCH --mem=60G
#SBATCH --output=/labs/kamaleswaranlab/MODS/Palak/potato_out/em_encounters_%A_%a.out
##SBATCH --error=/labs/kamaleswaranlab/MODS/Palak/em_encounters_%A_%a.err

#SBATCH --array=0

### Use this block to run ALL years ###
YEARS=(2014)
#Y1 is the element of the array found with ARRAY_ID 
Y1=${YEARS[$SLURM_ARRAY_TASK_ID]}

# Use this block to run a single year ###
#declare -i Y1=2020

echo "$SLURM_ARRAY_TASK_ID"
echo "Currently processing year: $Y1"


# set the correct python environment
# source palak_env/bin/activate
# # print python version to check
python3 --version

# python3 /home/palaka/CJ_Sepsis_Code/mergeLabsLoinc.py $Y1
python3 /home/palaka/CJ_Sepsis_Code/MODS/em_make_pickle.py $Y1

sleep 1
