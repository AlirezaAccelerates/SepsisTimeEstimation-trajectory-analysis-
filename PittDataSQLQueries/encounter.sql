drop table if exists PalakHB.encounter;
create table PalakHB.encounter as (
select e.patientid as pat_id,
e.patientvisitid as csn,
d.age,
null as zip_code,
e.AdmitSrc as ed_arrival_source,
e.AdmitType as pre_admit_location,
null as ed_presentation_time,
e.AdmitDate as hospital_admission_date_time,
e.DischDate as hospital_discharge_date_time,
null as admit_reason,
e.hp1 as insurance_status,
null as cpr_in_ed,
ad.iculos as total_icu_days,
null as total_vent_days,
ad.hlos as total_hosp_days,
null as discharge_status,
e.DischLoc as discharge_to,
e.EncntrType as encounter_type,
e.Hospital as hospital
from hidenic15raw.Encounter as e
left join
hidenic15raw.demographics as d
on e.patientvisitid = d.patientvisitid
left join
hidenic15raw.admit_discharge as ad
on ad.patientvisitid = e.patientvisitid
);