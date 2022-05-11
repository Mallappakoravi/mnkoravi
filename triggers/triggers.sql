create or replace trigger trg_cust_audit
after insert or update or delete on customer
declare
v_evt varchar2(20);

begin
if inserting then
v_evt:='insertion';
elsif updating then
v_evt:='updation';
else
v_evt:='deletion';
end if;
insert into cust_audit values(seq_audit.nextval, v_evt, sysdate);
end;
/

create table cust_audit (cust_aud_id number(5)primary key,v_evt varchar2(20));
/

