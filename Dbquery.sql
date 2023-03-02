-- Akeem Jokosenumi
-- G00366442

Show databases;

Use project;

-- Queries
select patno,pet,petname,vet from animal;

update appointment set appointmentdate = '2023-08-20' where patno = 9850;

delete from animal where petname = 'Link';
