DROP TABLE IF EXISTS PalakHB.infusionmeds;
create table PalakHB.infusionmeds as (
select patientid as pat_id,
patientvisitid as csn,
orderID as order_med_id,
null as medication_id,
orderedAs as med_name,
null as formulary_code,
null as formulary_name,
catalogDisp as med_name_generic,
null as med_order_time,
chartDate as med_action_time,
null as med_action_code,
resultval as med_action,
chartDate as med_start,
null as med_stop,
null as med_order_route_c,
Route as med_order_route,
dose as med_action_dose,
doseUnit as med_action_dose_unit
from hidenic15raw.Medication
where route like '%iv%');
 
 
 

	
