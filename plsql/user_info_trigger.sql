-- user_info insert trigger
CREATE OR REPLACE TRIGGER user_info_insert_update_trigger
BEFORE INSERT OR UPDATE
  ON user_info
  FOR EACH ROW
BEGIN
  IF :NEW.name = :OLD.name THEN
    RAISE_APPLICATION_ERROR("user name already exists");
  END IF;

  IF TO_CHAR(SYSDATE, 'DAY') IN ('FRI', 'SAT') THEN
    RAISE_APPLICATION_ERROR('No DML operations on weekends!');
  END IF;
END;

-- user_info delete trigger
CREATE OR REPLACE TRIGGER user_info_update_trigger
BEFORE DELETE
  ON user_info
  FOR EACH ROW
BEGIN
  IF TO_CHAR(SYSDATE, 'DAY') IN ('FRI', 'SAT') THEN
    RAISE_APPLICATION_ERROR('No DML operations on weekends!');
  END IF;
END;
