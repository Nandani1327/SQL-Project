use hospital_data;

show tables;

select * from admission_info;
select * from patient_info;
select * from patient_info1;

#
select a.patient_id,a.treatment_cost,p.city
from
admission_info a
join 
patient_info p
on 
a.patient_id = p.patient_id;

#
select patient_id,treatment_cost
from 
admission_info
order by treatment_cost desc
limit 10;

#
select round(avg(treatment_cost),2),diagnosis
from 
admission_info
group by diagnosis;

#
select count(*),city
from 
patient_info
group by city;

#
select p.city,avg(a.doctor_rating_1)
from
admission_info a
join 
patient_info p
on 
a.patient_id = p.patient_id
group by p.city
having avg(a.doctor_rating_1) > 4;

#
select diagnosis,avg(readmitted="Yes")*100 as highest_rating
from 
admission_info
group by diagnosis
order by highest_rating desc;

#
select patient_id,previous_admissions
from admission_info
where previous_admissions > 2;

#
select round(sum(a.treatment_cost),2),p.insurance_type
from
admission_info a
join 
patient_info p
on 
a.patient_id = p.patient_id
group by p.insurance_type;

#
select count(patient_id),followup_required
from patient_info1
where followup_required = "Yes"
group by followup_required;

#
select patient_id,
readmitted
from 
admission_info
where readmitted = "No";

