-- TO GET THE DX_SOURCE

-- create table source_disch as 
-- (select ad.hospdisch, d.patientid
-- from hidenic15raw.admit_discharge as ad
-- inner join
-- hidenic15raw.demographics_final as d
-- on d.patientid = ad.patientid);


create table PalakHB.diagnosis as (
select icd.PatientID as pat_id, 
icd.PatientVisitID as csn,
case
	when icd.seq=0 or icd.seq=1 then "Primary"
    when icd.seq>1 then"Secondary"
    else icd.seq
end as dx_line, 
icd.presentonadmit as dx_icd_scope,  
icd.icdcpt as dx_code_icd9,
null as dx_code_icd10, -- Dont have ICD 10 codes
-- case
-- 	when isNull(icd.eventdate) then 
-- end as dx_source,
null as dx_source,
icd.EventDate as dx_time_date, 
icd.icdcpt as dx_code, 
icd.Disp as dx_name
from hidenic15raw.ICDCPT as icd
);

-- Check if patient has 2 primary 




