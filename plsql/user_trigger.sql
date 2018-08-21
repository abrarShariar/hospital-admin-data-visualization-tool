-- triggers on user table
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
END;
