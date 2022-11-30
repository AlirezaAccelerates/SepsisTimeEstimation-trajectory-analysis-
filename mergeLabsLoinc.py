##FILE USED TO ADD COMPONENT ID TO THE LAB FILES RECEIVED FROM PITT DATA
import pandas as pd
import sys
# MERGE LOINC-COMPONENT-LABNAME FILE WITH 0.GROUPING(LABS)

grouping_labs = "/home/palaka/CJ_Sepsis_Code/MODS/0.grouping/em_grouping_labs(042921).csv"
loinc_comp = "/home/palaka/CJ_Sepsis_Code/MODS/0.grouping/loincMappedPitt.csv"

gr = pd.read_csv(grouping_labs)
lc = pd.read_csv(loinc_comp, usecols=range(1,4)).reset_index(drop=True)

gr = gr[gr['import']=="Yes"][['component', 'component_id']].reset_index(drop=True)

# print(gr.head)
# print(lc.head)

final = pd.merge(lc, gr,how="inner").reset_index(drop=True)
# final.to_csv("/home/palaka/CJ_Sepsis_Code/MODS/0.grouping/grouping_labs(palak)_with_loinc.csv", index=False)


# MERGING PITT LABS TO GET CORRESPONDING COMPONENT IDS:
plab = f"/home/palaka/CJ_Sepsis_Code/DATA/{sys.argv[1]}/PAL_LABS.dsv"
pitt_labs = pd.read_csv(plab)
# print(pitt_labs.head)
labs_grouping = final

for lab in pitt_labs['component'].values:
    # print(lab)
    if labs_grouping['component'].str.contains(lab, case=False).any():
        # print(labs_grouping[labs_grouping['component'].str.contains(lab, case=False)==True]['lc'].values[0])
        pitt_labs.loc[pitt_labs['component']==lab, 'component_id'] = labs_grouping[labs_grouping['component'].str.contains(lab, case=False)==True]['component_id'].values[0]
        pitt_labs.loc[pitt_labs['component']==lab, 'loinc_code'] = labs_grouping[labs_grouping['component'].str.contains(lab, case=False)==True]['lc'].values[0]


# print(pitt_labs)

pitt_labs.to_csv(plab, index=False)
    