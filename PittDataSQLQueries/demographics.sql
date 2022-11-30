drop table if exists PalakHB.demographics;
create table PalakHB.demographics as (
with pat_id as (
select pv.patientid, pv.PatientVisitID from hidenic15raw.patient_visits as pv
where pv.patientvisitid in (select patientvisitid from hidenic15raw.demographics)),
-- where pv.PatientVisitID in ('32697062','32845700','32845703','32845704','34550642')),
dems as (
select distinct d.PatientVisitID as csn, d.Sex as gender, d.RaceComposite as race, d.Race3Category as race_code, d.Age, 
ad.DeathDate as death_date,
case 
when d.Hispanic=0 then 'Non-hispanic or Latino' 
else 'Hispanic or Latino' 
end
as ethnicity,
d.hispanic as ethnicity_code
from hidenic15raw.demographics as d 
left join 
hidenic15raw.admit_discharge as ad
on d.patientvisitid=ad.patientvisitid),
demographics as 
(select pat_id.patientid as pat_id, dems.* from dems
inner join
pat_id
on pat_id.PatientVisitID=dems.csn)
select 
case
when demographics.gender regexp '^M' then '1'
else '0' 
end as gender_code,
null as first_name, null as last_name, null as mi, null as dob, demographics.* ,null as last4_ssn from demographics
);