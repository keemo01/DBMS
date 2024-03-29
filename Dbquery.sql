-- Akeem Jokosenumi
-- G00366442

Show databases;

Use veterinarydb;

-- Queries
-- Show the bill amount and appointment date for appointments where the cost was greater than 100
SELECT `bills`.`cost`, `appointments`.`appointmentDate` FROM `bills`
JOIN `appointments` ON `bills`.`appointmentNo` = `appointments`.`appointmentNo`
WHERE `bills`.`cost` > 100;

-- List the patients who have an ongoing medication.
SELECT DISTINCT `appointments`.`patientNo` FROM `appointments`
JOIN `medications` ON `appointments`.`appointmentNo` = `medications`.`appointmentNo`
WHERE `medications`.`status` = 'onGoing';


-- Get the total revenue generated by the clinic in the month of April 2023.
SELECT SUM(cost) AS revenue
FROM bills
WHERE appointmentNo IN (
  SELECT appointmentNo
  FROM appointments
  WHERE MONTH(appointmentDate) = 4 AND YEAR(appointmentDate) = 2023
);

-- Get the total number of appointments and the average cost of bills per appointment for each staff member.
SELECT a.staffID, COUNT(*) AS totalAppointments, AVG(b.cost) AS averageCostPerAppointment
FROM appointments a
INNER JOIN bills b ON a.appointmentNo = b.appointmentNo
GROUP BY a.staffID;

-- Display the total cost of all bills associated with completed medication treatments.
SELECT SUM(bills.cost) AS totalCost
FROM bills
JOIN appointments ON bills.appointmentNo = appointments.appointmentNo
JOIN medications ON appointments.appointmentNo = medications.appointmentNo
WHERE medications.status = 'Complete';
