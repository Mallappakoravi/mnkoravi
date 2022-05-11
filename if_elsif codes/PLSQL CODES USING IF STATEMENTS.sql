1-- WRITE A PLSQL BLOCK CHEck WETHER THE NUMBER IS EVEN OR ODD
declare
v_no number(5):=19;
begin
if mod(v_no,2)=0 then
dbms_output.put_line(v_no||'is even');
else
dbms_output.put_line(v_no||'is odd');
end if;
end;
/

set serveroutput on;


2--PASS 3 NUMBERS WHICH IS GREATER OR LESSER
declare
a int:=44;
b int:=75;
c int:=84;
begin
if a>b and a>c then
dbms_output.put_line(a ||'is greater');
elsif b>a and b>c then
dbms_output.put_line(b ||'is greater');
else
dbms_output.put_line(c ||'is greater');
end if;
end;
/


3--WABLOK PASS A DATE DISPLAY WETHER IT IS WEEK DAY OR WEEKEND
declare
v_date date:='02-apr-22';
begin
if to_char(v_date,'dy') in('sat','sun') then
dbms_output.put_line(v_date ||'is weekend');
else
dbms_output.put_line(v_date ||'is week day');
end if;
end;
/


4-- WAB TO PRINT EVEN NUMBER FROM 1-50
begin 
for i in 1..50 loop

if mod(i,2)= 0 then
dbms_output.put_line (i ||' is even');

end if;
end loop;
end;
/


5--PRINT ALL THE DATES WHICH STARTS 1ST DAY OF THIS MONTH TO LAST DAY OF THIS MONTH
declare
no_of_days int;
start_dt date;
end_dt date;
begin
start_dt:=trunc(sysdate,'mm');
end_dt:=add_months(start_dt,1);
no_of_days:=end_dt-start_dt;
for i in 1..no_of_days loop
dbms_output.put_line(start_dt);
start_dt:=start_dt+1;
end loop;
end;
/


6--PRINT ALL WEEKEND DAYS OF THIS MONTH
declare
no_of_days int;
start_dt date;
end_dt date;
begin
start_dt:=trunc(sysdate,'mm');
end_dt:=add_months(start_dt,1);
no_of_days:=end_dt-start_dt;
for i in 1..no_of_days loop
if to_char(start_dt,'d')  not in (2,3,4,5,6) then
dbms_output.put_line(start_dt);
end if;
start_dt:=start_dt+1;
end loop;
end;
/

7--PASS A STRING AS AROHA TO GET ONE BY ONE CHARECTER
declare 
a varchar2(20):='AROHA';
b varchar2(20);
begin 
for i in 1..length(a) loop
select substr(A,i,1) into b
from dual;
dbms_output.put_line(b);
end loop;
end;
/

8--WRITE A CODE TO GET OP AS(a
                             ar
                             aro
                             aroh
                             aroha)
  declare
v_char varchar2(20);
str varchar2(20):='&a';
len int;
begin
len:=length(str);
for i in 1..len  loop
v_char:=substr(str,1,i);
dbms_output.put_line(v_char);
end loop;
end;
/

9--USING SELECT STATEMENT
declare 
x varchar2(20):='AROHA';
Y varchar2(20);
begin
for i in 1..length(x) loop
select substr(x,1,i) into y
from dual;
dbms_output.put_line(y);
end loop;
end;
/


10--WRITE A CODE TO GET FACTORIAL OF NO
declare 
n int:=&n;
begin
for i in 1..n-1 loop
n:=n*i;
end loop;
dbms_output.put_line(n);
end;

/

11--TO PRINT FIBONACCI NO
declare
a int :=0;
b int :=1;
c int := 0;
begin 
dbms_output.put_line (a);
dbms_output.put_line (b);
while c<=50 loop
c:=a+b;
dbms_output.put_line (c);
a:=b;
b:=c;
end loop;
end;
/



12--PRINT TO GET AREA AND CIRCUM OF CIRCLE
declare
r int :=&r;
pi float :=3.142;
area number;
circum number;
begin
area := pi*r*r;
circum := 2*pi*r;
dbms_output.put_line ('area of circle is ='|| area);
dbms_output.put_line ('area of circum is ='|| circum);      
end;
/