-- user package
-- package specification
CREATE OR REPLACE user_pkg IS
  PROCEDURE insert_user(
    u_name user.name%TYPE,
    u_gender user.gender%TYPE,
    u_age user.age%TYPE,
    u_phone user.phone%TYPE,
    u_address user.address%TYPE,
    u_disease user.disease%TYPE,
    u_status user.status%TYPE,
    u_building user.building%TYPE,
    u_roomno user.roomno%TYPE,
    u_roomtype user.roomtype%TYPE,
    u_price user.price%TYPE,
    u_time user.time%TYPE
  );

  PROCEDURE delete_user(
    u_pid user.pid%TYPE
  );
END user_pkg;

-- package body
CREATE OR REPLACE PACKAGE BODY user_pkg IS
  -- insert_user implementation
  PROCEDURE insert_user(
    u_name user.name%TYPE,
    u_gender user.gender%TYPE,
    u_age user.age%TYPE,
    u_phone user.phone%TYPE,
    u_address user.address%TYPE,
    u_disease user.disease%TYPE,
    u_status user.status%TYPE,
    u_building user.building%TYPE,
    u_roomno user.roomno%TYPE,
    u_roomtype user.roomtype%TYPE,
    u_price user.price%TYPE,
    u_time user.time%TYPE
  ) IS
      invalid_name EXCEPTION;
      invalid_phone EXCEPTION;
      invalid_address EXCEPTION;
    BEGIN
      IF u_name IS NULL THEN
        raise invalid_name;
      END IF;
      IF u_phone IS NULL THEN
        raise invalid_phone;
      END IF;
      IF u_address IS NULL THEN
        raise invalid_address;
      END IF;

      INSERT INTO user (name, gender, age, phone, address, disease, status, building, roomno, roomtype, price, time)
      VALUES (u_name, u_gender, u_age, u_phone, u_address, u_disease, u_status, u_building, u_roomno, u_roomtype, u_price, u_time);

      EXCEPTION
        WHEN invalid_name THEN
          DBMS_OUTPUT.PUT_LINE("User name cannot be empty or null");
        WHEN invalid_phone THEN
          DBMS_OUTPUT.PUT_LINE("User phone no cannot be empty or null");
        WHEN invalid_address THEN
          DBMS_OUTPUT.PUT_LINE("User address cannot be empty or null");
    END;

    -- delete_user implementation
    PROCEDURE delete_user(
      u_pid user.pid%TYPE
    ) IS
      invalid_pid EXCEPTION
    BEGIN
      IF u_pid < 0 THEN
        raise invalid_pid;
      ELSE
        DELETE FROM user WHERE pid = u_pid;
      END IF;

      EXCEPTION
        WHEN invalid_pid THEN
          DBMS_OUTPUT.PUT_LINE("User pid cannot be less than 0");
    END;

END user_pkg;
