use master;
go 
create database Clinic77;
go 
use Clinic77;
go
create schema userss;
go 
create table userss.staffs
(
staff_id int  primary key identity,
staff_name varchar(15) not null ,
staff_password varchar(4) not null,
staff_phone varchar(12)
);
go




create table userss.patients
(
patient_id int primary key identity,
patient_name varchar (50) not null,
patient_age int not null,
patient_phone varchar(12),
patient_gender varchar(10) ,
patient_address varchar(50),
symptoms varchar (200),
notes varchar (500),
"date" date ,
signs varchar (500),
patient_status varchar (15),
investgation  varbinary (max)
);
go 


create schema session;
go 
create table session.diagnosis
(
diagnosis_id int primary key identity,
diagnosis_date date ,
diagnose varchar (500),
d_investgation varbinary (max) 
);
go 



create table session.prescription
(
prescription_id int primary key identity ,
prescription_date date ,
prescription_quantity int,
medication varchar (500),
duration varchar (500),
prescription_notes varchar (500),
pati_id int,
appoin_id int 
);
go 


create schema appoinments;
go 

create table appoinments.appoinments
(
appoinments_id int primary key identity ,
appoinments_date date ,
appoinments_status varchar (100),
appoinments_reson varchar (100),
pat_id int ,
diagn_id int,
staff_id int 
);
go

alter table  appoinments.appoinments 
add  discovery_date date ;
go

alter table appoinments.appoinments 
add replay_date date;
go 


alter table appoinments.appoinments 
add name varchar (100);
go 



create table userss.patient_diagnosis
(
d_id int ,
p_id int ,


p_name varchar (50) not null ,
p_age int not null,
p_phone varchar(12),
p_gender varchar (10),
p_address varchar (50),
symptom varchar (500),
note varchar (500),
p_date date ,
signs varchar (500),
p_status varchar (15),
p_investgation varbinary (max),

date_diag date,
diagnoses varchar (500),
d_investgations varbinary (max)

);
go 

alter table userss.patient_diagnosis alter column p_name varchar null;
go


alter table userss.patient_diagnosis alter column p_age int null;
go


alter table Userss. patient_diagnosis
add constraint fk1_patients_patient_diagnosis_p_id
foreign key(p_id)references Userss.patients(patient_id);
go



alter table Userss.patient_diagnosis
add constraint fk2_diagnosises_patient_diagnosis_d_id
foreign key(d_id) references session.diagnosis(diagnosis_id)
go



alter table appoinments.appoinments
add constraint fk_patient_appoinment_id 
foreign key (pat_id ) 
references userss.patients(patient_id);
go 



alter table appoinments.appoinments
add constraint fk_diadnosises_appoinment_id
foreign key (diagn_id)
references  session.diagnosis(diagnosis_id);
go 


alter table session.prescription 
add constraint fk_patient_prescription_id
foreign key (pati_id)
references userss.patients (patient_id);
go 



alter table session.prescription 
add constraint fk_appoinment_prescription_id 
foreign key (appoin_id)
references appoinments.appoinments(appoinments_id);
go 

select * from userss.patients;
go


select * from appoinments.appoinments;
go


select * from userss.patient_diagnosis;
go


select * from session.prescription;
go 

select count (*) from userss.staffs where staff_name = 'doctor' and staff_password ='2468' ;