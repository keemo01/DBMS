-- Akeem Jokosenumi
-- G00366442

Show databases;

Use veterinarydb;

-- Queries

-- This Query retrieves the pet names and their appointment times
SELECT pet.petName, appointment.appointmentDate
FROM appointment
INNER JOIN pet ON appointment.petName = pet.petName;

-- This Query to retrieve the total number of bills paid using each payment method:
SELECT payment.method, COUNT(*) AS total_bills_paid
FROM payment
GROUP BY payment.method;

-- This Query is used to get the total amount of pets for each specie 
SELECT species, COUNT(*) AS total_pets
FROM pet
GROUP BY species;

-- A query to show all appointments that havent took place
SELECT *
FROM appointment
WHERE appointment.appointmentDate > CURDATE();

-- A Query to retrieve the average cost of all bills:

SELECT AVG(cost) AS average_cost
FROM bill;

-- Query to retrieve the details of all medications that are still ongoing:
SELECT *
FROM medication
WHERE medication.status = 'onGoing';
