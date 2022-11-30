drop table if exists PalakHB.cultures;
create table PalakHB.cultures as (
SELECT patientid as pat_id,
patientvisitid as csn,
accession as proc_code,
ordername as proc_desc,
null as component_id,
null as omponent,
null as loinc_code,
CollectDate as specimen_collect_time,
orderDate as order_time,
eventId as order_id,
null as result_id,
eventDate as lab_result_time,
Status as result_status,
result as lab_result
 FROM hidenic15raw.Micro
 where source like "%blood%" and status="Final"
)
;

