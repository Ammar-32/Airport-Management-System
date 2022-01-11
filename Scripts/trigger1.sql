CREATE OR REPLACE TRIGGER DELAYEDFLIGHTS 
AFTER INSERT OR UPDATE OF STATUS ON FLIGHT 
FOR EACH ROW 
DECLARE

BEGIN
    if updating('STATUS')
    then
       insert into delayed_flights (FLIGHT_CODE, SOURCE, DESTINATION , AIRLINEID ,report_time) values(:new.flight_code,:new.source,:new.destination,:new.airlineid,sysdate);
end if;
 
END;