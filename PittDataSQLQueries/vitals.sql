select distinct rollupname from hidenic15raw.ClinicalEvents;

-- select max(patientid) as pat_id, 
-- max(patientvisitid) as csn, 
-- max(eventdate) as charttime,
-- max(case when rollupname like '%temp%' and ResultVal regexp '[0-9]*[.]?[0-9]+' then resultval else null end) as temperature,
-- max(case when rollupname like '%height%' and ResultVal regexp '[0-9]*[.]?[0-9]+' then resultval else null end) as height,
-- max(case when rollupname like '%weight%' and ResultVal regexp '[0-9]*[.]?[0-9]+' then resultval else null end) as daily_weight_kg,
-- max(case when rollupname='Pulmonary artery systolic' and ResultVal regexp '[0-9]*[.]?[0-9]+' then resultval else null end) as sbp_line,
-- max(case when rollupname='Pulmonary artery diastolic' and ResultVal regexp '[0-9]*[.]?[0-9]+' then resultval else null end) as dbp_line,
-- max(case when rollupname like '%systolic%' and ResultVal regexp '[0-9]*[.]?[0-9]+' then resultval else null end) as sbp_cuff,
-- max(case when rollupname like '%diastolic%' and ResultVal regexp '[0-9]*[.]?[0-9]+' then resultval else null end) as dbp_cuff,
-- max(case when rollupname like 'hr' and ResultVal regexp '[0-9]*[.]?[0-9]+' then resultval else null end) as pulse,
-- max(case when rollupname='sao2' and ResultVal regexp '[0-9]*[.]?[0-9]+' then resultval else null end) as spo2,
-- null as o2_device,
-- max(case when rollupname='cvp' then resultval else 0 end) as cvp,
-- null as end_tidal_co2,
-- null as o2_flow_ratedf
-- from hidenic15raw.ClinicalEvents;

-- select * from hidenic15raw.ClinicalEvents where resultval='Wt. already charted for 9 a.m.';

drop table if exists PalakHB.vitals;
create table PalakHB.vitals as (
select patientid as pat_id, 
patientvisitid as csn, 
eventdate as recorded_time,
max(case when rollupname like '%temp%' and ResultVal regexp '[0-9]*[.]?[0-9]+' then resultval else null end) as temperature,
max(case when rollupname like '%height%' and ResultVal regexp '[0-9]*[.]?[0-9]+' then resultval else null end) as height,
max(case when rollupname like '%weight%' and ResultVal regexp '[0-9]*[.]?[0-9]+' then resultval else null end) as daily_weight_kg,
max(case when rollupname='Pulmonary artery systolic' and ResultVal regexp '[0-9]*[.]?[0-9]+' then resultval else null end) as sbp_line,
max(case when rollupname='Pulmonary artery diastolic' and ResultVal regexp '[0-9]*[.]?[0-9]+' then resultval else null end) as dbp_line,
-- MAP = (SBP + 2 (DBP))/3
max(case when rollupname like '%systolic%' and ResultVal regexp '[0-9]*[.]?[0-9]+' then resultval else null end) as sbp_cuff,
max(case when rollupname like '%diastolic%' and ResultVal regexp '[0-9]*[.]?[0-9]+' then resultval else null end) as dbp_cuff,
max(case when rollupname like 'hr' and ResultVal regexp '[0-9]*[.]?[0-9]+' then resultval else null end) as pulse,
max(case when rollupname='sao2' and ResultVal regexp '[0-9]*[.]?[0-9]+' then resultval else null end) as spo2,
null as o2_device,
max(case when rollupname='cvp' then resultval else null end) as cvp,
null as end_tidal_co2,
null as o2_flow_ratedf,
max(case when rollupname like '%rr%' and ResultVal regexp '[0-9]*[.]?[0-9]+' then resultval else null end) as unassisted_respiratory_rate		
from hidenic15raw.ClinicalEvents
group by eventdate)
;
-- select * from hidenic15raw.ClinicalEvents where rollupname like '%temp%' and ResultVal regexp '[0-9]*[.]?[0-9]+';