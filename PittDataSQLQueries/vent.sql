-- create table PalakHB.vent as 

-- pat_id,csn,recorded_time,vent_start_time,vent_stop_time,vent_type,vent_mode,vent_rate_set,vent_tidal_rate_set,vent_tidal_rate_exhaled,peep
drop table if exists PalakHB.vent_final;
create table PalakHB.vent_final as
(with t as
(select PatientID as pat_id,
PatientVisitID as csn,
EventDate as recorded_time,
case
	when eventid=1 then eventdate
end as vent_start_time,
null as vent_stop_time,
null as vent_type,
case
	when eventname='Mode' then eventtag
    else null
end as vent_mode,
null as vent_rate_set,
null as vent_tidal_rate_set,
null as vent_tidal_rate_exhaled
from hidenic15raw.Ventilator),
s as
(select patientvisitid,
case 
	when TS_NAME like "%fio2%" then 
		val 
	end
    as fio2,
case 
	when TS_NAME like "%peep%" then
		val
	end
    as peep,
from_unixtime(TM*86400) as chartdate from PalakHB.vent_table)


select t.*, s.peep, s.fio2 from t
inner join
s
on t.csn=s.patientvisitid
and 
t.recorded_time=s.chartdate);
