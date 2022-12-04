import mysql.connector as sql
import pandas as pd
                          # Should I run the conde on the cluster? I don't have access to 2014,.... files
conn = sql.connect(
  host="crisma1.ccm.pitt.edu",
  user="alireza",
  password="alireza123",  # Is this the emory netid password?
  database="PalakHB"      # What sould I put here?
)

tables = {"labs": "collection_time", 'gcs': "recorded_time", "bedlocation":"bed_location_start", "infusionmeds": "med_start", "encounter": "hospital_admission_date_time", "noninfusedmeds": "med_start_timestamp", "orprocedures": "surgery_date", "vasopressors": "med_start", "vitals":"recorded_time", "sensitivities": "order_time"}
# csn_list = [34279786,33252409,33196297,33151967,33213381,32765022,33878731,32880617,33884664,34422771,\
#   33800248,33586008,33581839,34402277,33103809,33730120,32589269,33116118,32651669,32658541,34382978,34025869,32682721\
#     ,33929442,34121878,32860005,34409276,34020391,34233328,34421411,34190087,33533608,33627693,33965396,32619704,33084753\
#       ,33183643,33657036,34378875,34035419,33985447,33666500,34216325,34048251,32876642,34202175,32803895,33615400,34025996,33603100]

csn_list = [32621799,32634406,32653457,32712891,32718189,32730223,32829131,32891714,32897423,32950757,\
  32968411,33004535,33247630,33391677,33392129,33443824,33484806,33507454,33528918,33545096,33615400,33769239,\
    33985447,33993069,34020391,34190087,34202175,34204793,34216325,34233328,34239355,34253149,34279786,34366236,\
      34378875,34382978,34402277,34409276,34421411,34422771,34555955,34593539,34639668,34641476,34665108,34692435,34699200,34718573,34810508,34810518]

for table in tables.keys():
    query = f"SELECT * FROM {table} where year({tables[table]}) = 2014 and csn in {tuple(csn_list)};"
    print(query)
    df = pd.read_sql(query, conn)
    print(f"Data extracted for {table} successfully!")
    df.to_csv(f"/home/alireza/CJ_Sepsis_Code/DATA/2014/PAL_{table.upper()}.dsv", index=False)

dem_table = "demographics"
query = f"SELECT * FROM {dem_table} where csn in {tuple(csn_list)};"
print(query)
df = pd.read_sql(query, conn)
print(f"Data extracted for {dem_table} successfully!")
df.to_csv(f"/home/alireza/CJ_Sepsis_Code/DATA/2014/PAL_{dem_table.upper()}.dsv", index=False)

conn.close()
