create table PalakHB.noninfusedmeds (
SELECT patientvisitid as csn,
null as har,
orderId as order_med_id,
null as medication_id,
orderedAs as med_name,
catalogDisp as med_name_generic,
null as med_order_time, -- is order time important
chartdate as med_action_time,
chartdate as med_start_timestamp, -- is it same as chartdate, [as seen in emory it is same as med_action_time]
null as med_stop_timestamp,
dose as med_ordered_dose,
null as med_ordered_route_c,
route as med_order_route,
doseUnit as med_order_dose_unit,
'--' as med_frequency,
null as med_action_code,
null as med_Action,
null as med_action_dose,
null as med_action_dose_unit,
null as med_action_route_c,
route as med_action_route
 FROM hidenic15raw.Medication where route in ('by mouth', 'Dental', 'Inhale-Nasal', 'Inhale-Oral'))
;
 
 