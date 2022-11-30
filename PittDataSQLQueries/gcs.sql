drop table if exists PalakHB.gcs;
create table PalakHB.gcs as (
with eye as (
select patientid as pat_id, patientvisitid as csn, eventdate as recorded_time, rollupval as gcs_eye_score
 from hidenic15raw.ClinicalEvents where lower(rollupname) like '%gcs eye%'
),
verbal as (
select patientid as pat_id, patientvisitid as csn, eventdate as recorded_time, rollupval as gcs_verbal_score
 from hidenic15raw.ClinicalEvents where lower(rollupname) like '%gcs verbal%'
),
motor as (
select patientid as pat_id, patientvisitid as csn, eventdate as recorded_time, rollupval as gcs_motor_score 
 from hidenic15raw.ClinicalEvents where lower(rollupname) like '%gcs motor%'
),
total as (
select patientid as pat_id, patientvisitid as csn, eventdate as recorded_time, rollupval as gcs_total_score 
 from hidenic15raw.ClinicalEvents where lower(rollupname) like '%gcs total%'
)
select eye.*, motor.gcs_motor_score, verbal.gcs_verbal_score, total.gcs_total_score, null as flo_row_id, null as flo_name from eye
left join
motor
on eye.csn=motor.csn and
eye.recorded_time=motor.recorded_time
left join
verbal
on eye.csn=verbal.csn and
eye.recorded_time=verbal.recorded_time
left join
total
on eye.csn=total.csn and
eye.recorded_time=total.recorded_time
);