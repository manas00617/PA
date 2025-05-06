create table student (Roll_no int, name varchar(90), address varchar(90));
insert into student
values(10,'Rohit','Wagholi');
insert into student
values(20,'Mohit','Kharadi');
insert into student
values(30,'Manoj','Pimpri');
select * from student;
create table student_log(log_id int auto_increment primary key, roll_no int, name varchar(90), old_address varchar(80), new_address varchar(80), action_type varchar(80), action_time timestamp default current_timestamp);
delimiter //
create trigger before_insert_student before insert on student for each row
begin
if new.name='' then signal sqlstate '45000'
set message_text = 'Name cannot be empty';
end if;
end;
//
delimiter //
create trigger after_insert_student after insert on student for each row
begin
insert into student_log(roll_no, name, new_address, action_type)
values(new.roll_no, new.name, new.address, 'insert');
end;
//
delimiter //
create trigger before_update_student
before update on student for each row
begin
if new.address is null then
signal sqlstate '45000'
set message_text = 'Address cannot be null';
end if;
end;
// 
delimiter //
create trigger after_update_student
after update on student for each row
begin
insert into student_log(roll_no, name, old_address, new_address, action_type)
values(new.roll_no, new.name, old.address, new.address, 'update');
end;
// 
delimiter //
create trigger before_delete_student before delete on student for each row
begin
if old.address = 'Kharadi' then signal sqlstate '45000'
set message_text = 'Cannot delete student from Kharadi';
end if;
end;
//  
delimiter //
create trigger after_delete_student
after delete on student for each row
begin
insert into student_log(roll_no, name, old_address, action_type)
values(old.roll_no, old.name, old.address, 'delete');
end;
// 
insert into student(roll_no, name, address)
values(40, 'Jayesh', 'Baner');
//  
select * from student_log where roll_no = 40;//  
update student
set address = 'Wagholi'
where roll_no = 20;
select * from student_log where roll_no = 20 and action_type = 'update';
//
delete from student
where roll_no = 20;
//  
select * from student_log where roll_no = 20 and action_type = 'delete';// 
select*from student_log where roll_no = 20 and action_type = 'update'; //
delete from student where roll_no = 30;
select*from student_log where roll_no = 30 and action_type = 'delete'; //
