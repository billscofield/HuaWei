delimiter //
create procedure mwhilesum()
begin
declare sum int;
declare num int;
set sum = 0;
set num = 1;
while num<11 DO
    sum = sum + i;
    i = i+1;
end while;
select sum;
end;
delimiter ;
