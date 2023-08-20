
-- List tables of the schema and attribute count

SELECT ROW_NUMBER() OVER (ORDER BY table_name) AS table_no,
       table_name,
       COUNT(column_name) AS attribute_count
FROM all_tab_columns
WHERE owner = 'C##TRIPIFY'
GROUP BY table_name;

-- Show tables and their row counts

DECLARE
  l_table_name VARCHAR2(100);
  l_row_count NUMBER;
BEGIN
	DBMS_OUTPUT.NEW_LINE;
	DBMS_OUTPUT.PUT_LINE('Tables and Row Counts');
	DBMS_OUTPUT.NEW_LINE;
  FOR table_rec IN (SELECT table_name FROM all_tables WHERE owner = 'C##TRIPIFY') LOOP
    l_table_name := table_rec.table_name;
    EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM C##TRIPIFY.' || l_table_name INTO l_row_count;
    DBMS_OUTPUT.PUT_LINE( l_table_name || ' -> ' || l_row_count );
  END LOOP;
END;
/
