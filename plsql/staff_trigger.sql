-- trigger for insert on staff table
CREATE OR REPLACE TRIGGER staff_insert_trigger
BEFORE INSERT
  ON staff
  FOR EACH ROW
BEGIN
  IF :NEW.name = :OLD.name THEN
    RAISE_APPLICATION_ERROR("staff name already exists");
  END IF;

  IF :NEW.phone = :OLD.phone THEN
    RAISE_APPLICATION_ERROR("staff phone no already exists");
  END IF;

  IF TO_CHAR(SYSDATE, 'DAY') IN ('FRI', 'SAT') THEN
    RAISE_APPLICATION_ERROR('No DML operations on weekends!');
  END IF;
END;

-- trigger for delete on staff table
CREATE OR REPLACE TRIGGER staff_delete_trigger
BEFORE DELETE
  ON staff
  FOR EACH ROW
BEGIN
  IF TO_CHAR(SYSDATE, 'DAY') IN ('FRI', 'SAT') THEN
    RAISE_APPLICATION_ERROR('No DML operations on weekends!');
  END IF;
END;
