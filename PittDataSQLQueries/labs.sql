create table PalakHB.labs as (
select patientid as pat_id,
patientvisitid as csn,
null as proc_cat_id,
null as proc_cat_name,
null as proc_code,
eventName as proc_desc,
null as component_id,
rollupName as component,
null as loinc_code,
eventdate as collection_time,   
resultstat as result_status,
null as lab_result_time,
ResultVal as lab_result
 from hidenic15raw.CE2
 );
 

