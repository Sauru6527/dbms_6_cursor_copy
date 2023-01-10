-- 1: Create 2 tables 
-- 				A: Student 1        (Rno,name,class)    ---> INSERT DATA
-- 				B: Student 2        (Rno,name,class)    ---> NO
-- 2: create procedure save it..
-- 3: call proc_copy();
-- 4: select * from student2;
-- 5: Data is now copied in Student2 table Successfully

delimiter //
create procedure proc_copy()
begin
	declare vfinished int default 0;
	declare r int;
	declare n char(21);
	declare c char(21);
	
	declare studcursor cursor for select * from student1;
	declare continue handler for NOT FOUND set vfinished = 1;
	
	open studcursor;
		getdata:loop
		fetch studcursor into r,n,c;
		if vfinished = 1 then
		leave getdata;
		end if;
		insert into student2 values(r,n,c);
		end loop getdata;
		close studcursor;

end
//

			
	
