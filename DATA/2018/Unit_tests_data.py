from typing_extensions import Self
import unittest
import pandas as pd
import os


class dataTesting(unittest.TestCase):

    def test_data_not_empty(self, file):
        f = open(file)
        df=pd.read_csv(file)
        self.assertFalse(df.empty)
    
    def test_all_files(self, reqd_files):
        rootdir = '../DATA/2018/'
        for file in reqd_files:
            path_to_file = rootdir+file
            self.assertTrue(os.path.exists(path_to_file))
    
    def outputPathExists(path):
        self.assertTrue(os.path.exists(path))

    def encPicklePath(pkl_path):
        self.assertTrue(os.path.exists(pkl_path))


#### csn: 32697062, 32845700, 32845703, 32845704, 34550642 ####

### CREATE A NEW CSV FOR VASOPRESSORS FROM SCRATCH FOR THESE 5 CSNS: 32697062, 32845700, 32845703, 32845704, 34550642 ###
#### ASK DR RISHI FOR COMPONENT IDs MISSING IN PITT DATA ####
#### VITALS: MISSING MAPS, RESPIRATORY RATE, HEIGHT IN CM ####
#### OMOP ID ? COMPONENT ID IN EMORY DATA #### -- CHECK ==== MERGE WITH LOINC CODES


###PHASE 2:
#### ARRANGE FOR A CSN LIST #### === CREATE A SCRIPT TO MAKE A LIST OF CSNS
#### FLUID DATA??? DO WE HAVE EVEN - HOW TO EXTRACT!!! DOCUMENT!! #### 
#### CHECK IF DIAGNOSIS HAS TIME ALSO OR JUST DIAGNOSIS DATE #### ==== ONLY DATE
#### WHAT IS quan_deyo_ICD10 AND quan_elix_ICD10 ####
#### df_vasopressors not created because of missing medication id ####


#### THINK ABOUT IMPROVING THE PIPELINE ####
# QUICKLY FINISH OFF THIS PROJECT SO THAT WE CAN MOVE ON TO THE GENERALISATION OF THE PIPELINE #### 

 


