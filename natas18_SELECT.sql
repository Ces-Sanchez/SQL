use natas17;

drop procedure if exists quietor;
create procedure quietor(in tedacuen varchar(32))
begin
	if BINARY substr((SELECT mypassword from users),1,1)='a' then
        Select mypassword from users;
        do sleep(5);
        Select mypassword from users;
	else
		select myusername from users;
	end if;
end

use natas17;
call quietor('af88306ee8ad41fd8819b89824268690');