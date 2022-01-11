CREATE OR REPLACE TRIGGER TICKET_PRICE_HISTORY
BEFORE UPDATE OF PRICE
ON TICKET2
FOR EACH ROW

BEGIN
INSERT INTO TICKET_PRICE_HISTORY 
VALUES(:OLD.DATE_OF_BOOKING, :OLD.SOURCE, :OLD.DESTINATION, :OLD.CLASS, :OLD.PRICE);

END;
  