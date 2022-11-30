import pandas as pd
import sys

## MAKE ENCOUNTER_CSN_LIST

data_path = f"DATA/{sys.argv[1]}/"
print(data_path)
n = pd.read_csv(data_path+"PAL_ENCOUNTER.dsv")
age = pd.read_csv(data_path+'PAL_DEMOGRAPHICS.dsv')
# print(age)
# print(age['csn'].unique())

list_csn = pd.unique(n['csn'])
enc_list = pd.DataFrame(columns=['year', 'pat_id', 'csn', 'ed', 'in_pt', 'obs', 'adult'])

enc_list['csn'] = list_csn

for csn in list_csn:
    # print(csn)
    enc_list.loc[enc_list['csn']==csn, 'pat_id'] = n[n['csn']== csn]['pat_id'].values[0]
    # print(n[n['csn']==csn]['total_icu_days'])
    if n[n['csn']==csn]['total_icu_days'].values[0]>0:
        enc_list.loc[enc_list['csn']==csn, 'in_pt'] = 1
    else:
        enc_list.loc[enc_list['csn']==csn, 'in_pt'] = 0

    if csn in age['csn'].unique():
        # print(age[age['csn']==csn])
        if age.loc[age['csn']==csn, 'Age'].values[0]>18:
            enc_list.loc[enc_list['csn']==csn, 'adult'] = 1
    else:
        enc_list.loc[enc_list['csn']==csn, 'adult'] = 0
    enc_list.loc[enc_list['csn']==csn, 'year'] = sys.argv[1]

# print(enc_list)

enc_list.to_csv(data_path+"em_pt_list.csv")