drop table if exists PalakHB.bedlocation;
create table PalakHB.bedlocation as 
(select patientid as pat_id,
patientvisitid as csn,
begDate as bed_location_start,
endDate as bed_location_end,
unit as bed_unit,
null as bed_room,
null as bed_id,
null as bed_label,
null as hospital_service,
null as accommodation_code,
hospital as accommodation_description
 from hidenic15raw.Location)