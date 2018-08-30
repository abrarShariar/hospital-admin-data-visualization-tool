create or replace PACKAGE user_info_pkg AS
  PROCEDURE insert_user(
      u_id user_info.id%TYPE,
      u_name user_info.name%TYPE,
      u_password user_info.password%TYPE,
      u_position user_info.position%TYPE
  );

  PROCEDURE delete_user(
      u_pid user_info.id%TYPE
  );
END user_info_pkg;


create or replace PACKAGE BODY user_info_pkg AS
   PROCEDURE insert_user(
      u_id user_info.id%TYPE,
      u_name user_info.name%TYPE,
      u_password user_info.password%TYPE,
      u_position user_info.position%TYPE
  ) IS
     invalid_name EXCEPTION;
    BEGIN
     IF u_name IS NULL THEN
       raise invalid_name;
     ELSE
         INSERT INTO user_info(id, name, password, position) VALUES (u_id, u_name, u_password, u_position);
     END IF;

     EXCEPTION
         WHEN invalid_name THEN
           DBMS_OUTPUT.PUT_LINE('INVALID NAME');
     END;

   PROCEDURE delete_user(
       u_pid user_info.id%TYPE;
   ) IS 
       invalid_pid EXCEPTION;

   BEGIN
       IF u_pid < 0 THEN
        raise invalid_pid;
       ELSE
           DELETE FROM user_info WHERE user_info.id = u_pid;
       END IF;

      EXCEPTION
          WHEN invalid_pid THEN
            DBMS_OUTPUT.PUT_LINE('user pid cannot be less than 0');
          END;
END user_info_pkg;
