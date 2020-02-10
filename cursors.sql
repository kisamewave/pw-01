/*
select * From tr_trn ;



declare 
cursor c is select store, country_id from store 
where store = 3;
type t is record (x TR_TRN.AI_TRN%type, y number, z number);
cursor c2 (i_store varchar2) is select ai_trn,total_cost,null from tr_trn 
where store = i_store;
t_record t;
type tt is table of t;
tt_t tt := tt();
n number := 0;
liczba number;
begin 
for i in c loop
open c2 (i.store);
loop
fetch c2  bulk collect into tt_t;
exit when c2%notfound;
end loop;
for j in 1..tt_t.count loop
dbms_output.put_line(tt_t(j).x || ' ' || tt_t(j).z);
liczba := tt_t(j).x;
exit when tt_t.count = 0;
end loop;
end loop;
end;

*/

declare 
cursor c (i number) is select * from store 
where store = 1;
wynik1 number;
type r_t is record ( x number, y number);
type t is table of r_t;
r_t_record r_t;
tt t := t();
begin 
for i in c (1) loop

select count(1),null bulk collect into tt 
from (select 1 from dual where 1= i.store);

for j in tt.first..tt.count loop


r_t_record.x := tt(j).x;
--r_t_record.y := ;
exit when tt.count = 0 ;
end loop;

end loop;
end;


declare 

type t is record (x number, y number, z number);
t_R t;
cursor c is select level, level+1, null from dual
connect by level <= 10;
begin
for i in c loop
t_r.x := i.level;
select 1 into t_r.z from dual
where 1 = 1;
dbms_output.put_line(t_r.x || ' ' || t_R.z);

end loop;
end;


declare 
c_r SYS_REFCURSOR;
x number;
type r_t is record ( x number, y number);
type t is table of r_t;
r_t_record r_t;
tt t := t();
cursor c (i number) is select 1+i wartosc from dual;
begin
open c_r for select 1 from dual;
loop
fetch c_r into x;
exit when c_R%notfound;
for i in c(x) 
loop

select count(1),null bulk collect into tt 
from (select 1 from dual where 2= i.wartosc);

for i in tt.first..tt.count 
loop
dbms_output.put_line(tt(i).x);
select 1 into r_t_record.y from dual;
dbms_output.put_line(r_t_record.y);
exit when tt.count = 0;
end loop;

end loop;
end loop;
end;