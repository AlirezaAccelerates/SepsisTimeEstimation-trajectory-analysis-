create table PalakHB.trial as (
with merging as 
(select icdcpt.icdcpt, icdcpt.patientvisitid, icdcpt.disp
from hidenic15raw.ICDCPT as icdcpt
	inner join
hidenic15raw.Surgical
on Surgical.patientvisitid = icdcpt.patientvisitid
and Surgical.begdate = icdcpt.eventdate
where icdcpt<100 and IcdCpt regexp '^[0-9][0-9]\.[0-9][0-9]$')
select s.patientid as pat_id, 
s.patientvisitid as csn, 
s.begdate as surgery_date, 
s.begdate as in_or_dttm,
s.begdate as procedure_start_dttm, 
s.enddate as procedure_comp_date,
s.enddate as out_or_dttm, 
null as or_procedure_id,
s.surgprocedure as primary_procedure_nm,
merging.icdcpt as cpt_code,
merging.disp as service_name,
null as primary_physician_nm 
from hidenic15raw.Surgical as s
left join 
merging
on merging.patientvisitid=s.patientvisitid
);