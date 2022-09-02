
create table Registration(
registrationID char(10) PRIMARY KEY,
patientRegistrationNumber char(10) NOT NULL UNIQUE,
registrationDate datetime,
patientID char(10));

create table Patient(
patientID char(10) PRIMARY KEY,
name varchar(30),
age int(10));

create table Visit(
visitID char(10) PRIMARY KEY,
visitDateTime datetime,
visitType varchar(30),
visitCharge int(10),
patientID char(10));

create table DiagnosticTest(
diagnosticTestID  char(10) PRIMARY KEY,
testName varchar(30),
testResults varchar(30));

create table Consultation(
consultationID char(10) PRIMARY KEY, 
symptoms varchar(30),
doctorID char(10));

create table Doctor(
doctorID char(10) PRIMARY KEY,
doctorName varchar(30),
speciality varchar(30));

create table Appointment(
appointmentID char(10) PRIMARY KEY,
appointmentDateTime datetime,
consultationID char(10)); 

create table Prescription(
prescriptionID char(10) PRIMARY KEY,
prescriptionDate datetime,
consultationID char(10)); 

create table Medication(
medicationID char(10) PRIMARY KEY,
medicineName varchar(30),
dosage varchar(30),
prescriptionID char(10));


alter table Registration
        add constraint fk_regn_pid FOREIGN KEY (patientID) REFERENCES Patient(patientID);

alter table Visit
        add constraint fk_visit_pid FOREIGN KEY (patientID) REFERENCES Patient(patientID);

alter table DiagnosticTest
        add constraint fk_dt_visitid FOREIGN KEY (diagnosticTestID) REFERENCES Visit(visitID);

alter table Consultation
        add constraint fk_cn_visitid FOREIGN KEY (consultationID) REFERENCES Visit(visitID);

alter table Consultation
        add constraint fk_cn_docid FOREIGN KEY (doctorID) REFERENCES Doctor(doctorID);

alter table Appointment
        add constraint fk_ap_conid FOREIGN KEY (consultationID) REFERENCES Consultation(consultationID);

alter table Prescription
        add constraint fk_pr_conid FOREIGN KEY (consultationID) REFERENCES Consultation(consultationID) ON DELETE CASCADE;

alter table Medication
        add constraint fk_md_prid FOREIGN KEY (prescriptionID) REFERENCES Prescription(prescriptionID) ON DELETE CASCADE;

insert into Patient values('p01','Jalubu Zhukam',25);
insert into Patient values('p02','Mercury',NULL);
insert into Patient values('p03','Venus',12);
insert into Patient values('p04','Earth',17);
insert into Patient values('p05','Mars',82);
insert into Patient values('p06','Jupiter',14);

insert into Doctor values('d01','Ms. Khemmu','chest specialist');
insert into Doctor values('d02','Jasmine','Physician');
insert into Doctor values('d03','Rose','Cardiologist');
insert into Doctor values('d04','Cactus','Dentist');
insert into Doctor values('d05','Lotus','Dentist');

insert into Registration values('r01','BLR-001','2013-04-01','p01');
insert into Registration values('r02','BLR-002','2013-4-3','p02');
insert into Registration values('r03','BLR-003','2013-4-4','p03');
insert into Registration values('r04','BLR-004','2013-4-5','p04');
insert into Registration values('r05','BLR-005','2013-4-6','p05');
insert into Registration values('r06','BLR-006','2013-4-7','p06');

insert into Visit values('v01','2013-04-01','Consultation',100,'p01');
insert into Visit values('v02','2013-04-01','DTest',250,'p01');
insert into Visit values('v03','2013-4-1','DTest',500,'p02');
insert into Visit values('v04','2013-4-1','DTest',300,'p01');
insert into Visit values('v05','2013-6-2','DTest',250,'p03');
insert into Visit values('v06','2013-6-3','Consultation',100,'p03');
insert into Visit values('v07','2013-7-4','Consultation',100,'p04');
insert into Visit values('v08','2013-6-5','Consultation',100,'p01');

insert into DiagnosticTest values('v02','Choma Pariksha','All is well');
insert into DiagnosticTest values('v03','TSH','3.5');
insert into DiagnosticTest values('v04','XRAY','some result');
insert into DiagnosticTest values('v05','XRAY','image');

insert into Consultation values('v01','chronic cold','d01');
insert into Consultation values('v06','wheezing','d02');
insert into Consultation values('v07','giddiness','d03');
insert into Consultation values('v08','BP','d03');

insert into Appointment values('a01','2013-04-01 10:00:00','v01');
insert into Appointment values('a02','2013-4-2 10-0-0','v06');
insert into Appointment values('a03','2013-4-1 10-0-0','v07');
insert into Appointment values('a04','2013-4-4 10-30-0','v08');

insert into Prescription values('p01','2013-04-01','v01');
insert into Prescription values('p02','2013-4-2','v06');
insert into Prescription values('p04','2013-4-4','v08');

insert into Medication values('m01','honey','1 tsp','p01');
insert into Medication values('m02','steam inhalation','3 times','p01');
insert into Medication values('m03','honey','dosage 3','p02');
insert into Medication values('m04','medicine 4','dosage 4','p02');
insert into Medication values('m05','medicine 5','dosage 5','p02');
insert into Medication values('m06','medicine 6','dosage 6','p02');
insert into Medication values('m07','medicine 7','dosage 7','p02');
insert into Medication values('m08','honey','dosage 8','p04');
insert into Medication values('m09','medicine 4','dosage 9','p04');
insert into Medication values('m10','medicine 10','dosage 10','p04');
insert into Medication values('m11','medicine 11','dosage 11','p04');
insert into Medication values('m12','medicine 12','dosage 12','p04');
insert into Medication values('m13','medicine 13','dosage 13','p04');

