NON-PRE-DEFINED EXCEPTION

declare
child_rec_found exception;
pragma exception_init(2292, child_rec found);

begin
delete from p_family
where p_family_name='Elec';
exception
when child rec_rec_found then
dbms_output.put_line('cannot delete parent_records');
end;

select * from accounts;

USER-DEFINED EXCEPTION
declare
v_a_id varchar2(20):='S189642311';
invalid a_id exception;
v_c varchar2(20);
begin
if substr(a_id, 1) not in('S', 'T', 'U') THEN
raise invalid_a_id;
else
select c_name into v_c
from customer c, accounts a
where c.c_id=a.c_id
and a_id=v_a_id;
dbms_output.put_line(c_name);
end if;
exception 
when invalid a_id then
dbms_output.put_line('enter valid a_id');
end;



--NON_PRE_DEFINED EXAMPLE
CREATE TABLE t_test (v_clm NUMBER, v_clm1 VARCHAR2(10));

DECLARE
  v_sqlcode NUMBER;
  v_sqlerrm VARCHAR2(400);
  e_invalid_clm EXCEPTION;
  PRAGMA EXCEPTION_INIT (e_invalid_clm, -904);
BEGIN
  -- these col_name1, col_name2 are not column of t_test table!! I mean, After first run, the second run will not raise an error.
  EXECUTE IMMEDIATE 'alter table t_test drop (col_name1, col_name2)';
EXCEPTION
  WHEN e_invalid_clm THEN
    NULL;
    dbms_output.put_line('We will nothing!!');
  WHEN OTHERS THEN
    v_sqlcode := SQLCODE;
    v_sqlerrm := SQLERRM;
    dbms_output.put_line(v_sqlerrm);
    RAISE;
END;
set serveroutput on;
 