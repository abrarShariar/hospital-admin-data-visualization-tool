-- triggers on user table on insert
CREATE OR REPLACE TRIGGER user_insert_trigger
BEFORE INSERT
  ON user
  FOR EACH ROW
BEGIN
  IF :NEW.name = :OLD.name THEN
    RAISE_APPLICATION_ERROR("user name already exists");
  END IF;

  IF :NEW.pid = :OLD.pid THEN
    RAISE_APPLICATION_ERROR("User pid already exists");
  END IF;

  IF :NEW.phone = :OLD.phone THEN
    RAISE_APPLICATION_ERROR("User pid already exists");
  END IF;

  IF TO_CHAR(SYSDATE, 'DAY') IN ('FRI', 'SAT') THEN
    RAISE_APPLICATION_ERROR('No DML operations on weekends!');
  END IF;
END;

-- triggers on user table on update
CREATE OR REPLACE TRIGGER user_update_trigger
BEFORE UPDATE
  ON user
  FOR EACH ROW
BEGIN
  IF :NEW.name = :OLD.name THEN
    RAISE_APPLICATION_ERROR("user name already exists");
  END IF;

  IF :NEW.pid = :OLD.pid THEN
    RAISE_APPLICATION_ERROR("User pid already exists");
  END IF;

  IF :NEW.phone = :OLD.phone THEN
    RAISE_APPLICATION_ERROR("User pid already exists");
  END IF;

  IF TO_CHAR(SYSDATE, 'DAY') IN ('FRI', 'SAT') THEN
    RAISE_APPLICATION_ERROR('No DML operations on weekends!');
  END IF;
END;

-- delete trgger on user table
CREATE OR REPLACE TRIGGER user_delete_trigger
BEFORE DELETE
  ON user
  FOR EACH ROW
BEGIN
  IF TO_CHAR(SYSDATE, 'DAY') IN ('FRI', 'SAT') THEN
    RAISE_APPLICATION_ERROR('No DML operations on weekends!');
  END IF;
END;
