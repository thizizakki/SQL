CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_cursor`()
BEGIN

declare lcl_aid integer;
declare lcl_name varchar(100);

declare finished integer default 0;

declare mycur cursor for select authorid, name from authors;
declare continue handler for NOT FOUND
BEGIN
	set finished = 1;
END;
open mycur;
readloop:LOOP

		fetch mycur into lcl_aid,lcl_name;
        
        if finished = 1 then
           leave readloop;
		end if;
        
		select concat(lcl_name," is author no. ", lcl_aid) as msg;

END LOOP readloop;
close mycur;
select "Cursor Closed - Process Completed" as msg;
END