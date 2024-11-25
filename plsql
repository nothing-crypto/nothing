DELIMITER $$
CREATE PROCEDURE get_students_by_department(IN p_department VARCHAR(50))
BEGIN
SELECT *
FROM students
WHERE department = p_department;
END $$
DELIMITER ;
-- To call the above stored procedure
CALL get_students_by_department('Computer Science');




a. IF-THEN Statement
sql
Copy code
BEGIN
    IF SYSDATE < TO_DATE('2024-12-31', 'YYYY-MM-DD') THEN
        DBMS_OUTPUT.PUT_LINE('The date is before the end of the year.');
    END IF;
END;
b. IF-THEN-ELSE Statement
sql
Copy code
BEGIN
    IF SYSDATE < TO_DATE('2024-12-31', 'YYYY-MM-DD') THEN
        DBMS_OUTPUT.PUT_LINE('The date is before the end of the year.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The date is after the end of the year.');
    END IF;
END;
c. IF-THEN-ELSIF Statement
sql
Copy code
BEGIN
    IF SYSDATE < TO_DATE('2024-06-30', 'YYYY-MM-DD') THEN
        DBMS_OUTPUT.PUT_LINE('The date is in the first half of the year.');
    ELSIF SYSDATE < TO_DATE('2024-12-31', 'YYYY-MM-DD') THEN
        DBMS_OUTPUT.PUT_LINE('The date is in the second half of the year.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The year has ended.');
    END IF;
END;
d. CASE Statement
sql
Copy code
DECLARE
    grade CHAR(1) := 'A';
BEGIN
    CASE grade
        WHEN 'A' THEN DBMS_OUTPUT.PUT_LINE('Excellent');
        WHEN 'B' THEN DBMS_OUTPUT.PUT_LINE('Good');
        WHEN 'C' THEN DBMS_OUTPUT.PUT_LINE('Average');
        ELSE DBMS_OUTPUT.PUT_LINE('Poor');
    END CASE;
END;
2. Loops
a. Basic LOOP
sql
Copy code
DECLARE
    counter INT := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('Counter: ' || counter);
        counter := counter + 1;

        EXIT WHEN counter > 5; -- Exit loop condition
    END LOOP;
END;
b. WHILE Loop
sql
Copy code
DECLARE
    counter INT := 1;
BEGIN
    WHILE counter <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE('Counter: ' || counter);
        counter := counter + 1;
    END LOOP;
END;
c. FOR Loop
sql
Copy code
BEGIN
    FOR i IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('Iteration: ' || i);
    END LOOP;
END;
