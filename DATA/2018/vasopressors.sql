##VASOPRESSORS

SELECT 
patientid as pat_id,
patientvisitid as csn,
orderid as order_med_id,
-- null as medication_id,
orderedas as med_name, 
-- null as formulary_code,
-- null as formulary_name,
catalogDisp as med_name_generic,
-- null as med_order_time,
chartDate as med_action_time,
-- null as med_action_code,
resultval as med_action,
chartDate as med_start,
-- null as med_stop,
-- null as med_order_route_c,
Route as med_order_route,
eventTag as med_action_dose,
doseUnit as med_action_dose_unit
FROM hidenic15raw.Medication where 
       (orderedas like "%norepinephrine%"
		or orderedas like "%epinephrine%" 
		or orderedas like "%dobutamine%" 
		or orderedas like "%dopamine%" 
		or orderedas like "%phenylephrine%" 
		or orderedas like "%vasopressin%");
        -- and patientvisitid in (32697062, 32845700, 32845703, 32845704, 34550642);
        
        
