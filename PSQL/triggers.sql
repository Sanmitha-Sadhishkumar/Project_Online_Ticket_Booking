select * from m2s1;
/*alter table m1s1 add column namount int;
alter table m1s2 add column namount int;
alter table m1s3 add column namount int;
alter table m2s1 add column namount int;
alter table m2s3 add column namount int;
alter table m2s2 add column namount int;

alter table m1s1 add column amount float;
alter table m1s2 add column amount float;
alter table m1s3 add column amount float;
alter table m2s1 add column amount float;
alter table m2s3 add column amount float;
alter table m2s2 add column amount float;

create or replace function tr1() 
	returns trigger 
	language plpgsql as 
	$$
	declare
	amt int;
	sum1 float;
	gst float;
	begin 
	select namount into amt from m1s1;
	gst:=(15*amt)/100;
	sum1=amt+gst;
	update m1s1 set amount=sum1 where email=new.email;
	return new;
	end;
	$$;

create or replace function tr2() 
	returns trigger 
	language plpgsql as 
	$$
	declare
	amt int;
	sum1 float;
	gst float;
	begin 
	select namount into amt from m1s2;
	gst:=(15*amt)/100;
	sum1=amt+gst;
	update m1s2 set amount=sum1 where email=new.email;
	return new;
	end;
	$$;

create or replace function tr3() 
	returns trigger 
	language plpgsql as 
	$$
	declare
	amt int;
	sum1 float;
	gst float;
	begin 
	select namount into amt from m1s3;
	gst:=(15*amt)/100;
	sum1=amt+gst;
	update m1s3 set amount=sum1 where email=new.email;
	return new;
	end;
	$$;

create or replace function tr4() 
	returns trigger 
	language plpgsql as 
	$$
	declare
	amt int;
	sum1 float;
	gst float;
	begin 
	select namount into amt from m2s1;
	gst:=(15*amt)/100;
	sum1=amt+gst;
	update m2s1 set amount=sum1 where email=new.email;
	return new;
	end;
	$$;
	
create or replace function tr5() 
	returns trigger 
	language plpgsql as 
	$$
	declare
	amt int;
	sum1 float;
	gst float;
	begin 
	select namount into amt from m2s2;
	gst:=(15*amt)/100;
	sum1=amt+gst;
	update m2s2 set amount=sum1 where email=new.email;
	return new;
	end;
	$$;
	
create or replace function tr6() 
	returns trigger 
	language plpgsql as 
	$$
	declare
	amt int;
	sum1 float;
	gst float;
	begin 
	select namount into amt from m2s3;
	gst:=(15*amt)/100;
	sum1=amt+gst;
	update m2s3 set amount=sum1 where email=new.email;
	return new;
	end;
	$$;

create or replace trigger tr1 after insert on m1s1 for each row execute procedure tr1();
create or replace trigger tr2 after insert on m1s2 for each row execute procedure tr2();
create or replace trigger tr3 after insert on m1s3 for each row execute procedure tr3();
create or replace trigger tr4 after insert on m2s1 for each row execute procedure tr4();
create or replace trigger tr5 after insert on m2s2 for each row execute procedure tr5();
create or replace trigger tr6 after insert on m2s3 for each row execute procedure tr6();

*/

select * from m1s2;