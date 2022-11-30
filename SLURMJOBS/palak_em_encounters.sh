#!/bin/bash
#SBATCH --job-name=tomato_em
#SBATCH --nodes=1 
#SBATCH --ntasks=1 
#SBATCH --mem=30G
#SBATCH --time=36:00:00
#SBATCH --output=/home/paggar8/ssd/palak/tomato_out/em_encounters_%A_%a.out
##SBATCH --error=/home/paggar8/ssd/palak/em_encounters_%A_%a.err
#SBATCH --array=0-1

# This is the list of years to process; each core will take a fraction of each year
YEARS=(2014)

### These are variables passed into the Python Script ###
# Total num of cores assigned to job (i.e. 16)
NUM_OF_PROCESSES=$SLURM_ARRAY_TASK_COUNT

# list of csn and the associated year
# CSN_LIST=/home/paggar8/ssd/palak/em_test.psv
# CSN_LIST=../DATA/2018/pal_em_csn.psv


# path for yearly pickles
PICKLE_PATH=/home/palaka/CJ_Sepsis_Code/OUTPUT/
#PICKLE_PATH=/home/cjosef/6.Yearly_Pickles/

# place to write encounter pickles
OUTPUT_PATH=/home/palaka/CJ_Sepsis_Code/OUTPUT/encounter_pickles/

### Print basic job info to log file for quality check ###
#echo The array number is- $SLURM_ARRAY_TASK_ID
echo This is the csn list- $CSN_LIST
echo This is the pickle path- $PICKLE_PATH
echo This is the output path- $OUTPUT_PATH
echo This is the number of processor- $NUM_OF_PROCESSES
echo This is the task ID- $SLURM_ARRAY_TASK_ID

## Activate the custom python environment
# conda activate extraction
# #source /home/cjosef/environments/csj_env/bin/activate
# python3 --version

#### FOR LOOP: takes each year and divides the patients in chunks based on number of cores ###
for year in ${YEARS[*]}
do
echo Currently processing year: $year
CSN_LIST=/home/palaka/CJ_Sepsis_Code/DATA/$year/em_pt_list.csv

python3 -u /home/palaka/CJ_Sepsis_Code/createEn_list.py $year 
python3 -u /home/palaka/CJ_Sepsis_Code/MODS/palak_em_make_dicts.py $CSN_LIST $PICKLE_PATH $OUTPUT_PATH $year

done
