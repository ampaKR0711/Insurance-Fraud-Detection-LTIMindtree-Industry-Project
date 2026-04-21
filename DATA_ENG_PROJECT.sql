SELECT * FROM claims LIMIT 10;


--Total Fraud vs Legit Claims
SELECT claim_status, COUNT(*)
FROM claims
GROUP BY claim_status;
 --Fraud by Region
SELECT region_code, COUNT(*) AS total_claims    
FROM claims
WHERE claim_status = 1
GROUP BY region_code
ORDER BY total_claims DESC; 

 --Average Claim by Vehicle Age
SELECT vehicle_age, AVG(displacement) AS avg_claim
FROM claims
GROUP BY vehicle_age
ORDER BY avg_claim DESC;

--WINDOW FUNCTION
SELECT *,
RANK() OVER (PARTITION BY region_code ORDER BY displacement DESC) AS rank  
FROM claims;

 --Top 5 Risky Records
 SELECT *
FROM claims
ORDER BY displacement DESC
LIMIT 5;  
      