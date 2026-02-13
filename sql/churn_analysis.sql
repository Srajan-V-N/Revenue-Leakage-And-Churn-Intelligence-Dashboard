USE revenue_leakage;

SELECT COUNT(*) AS total_customers
FROM telco_churn;

SELECT 
    ROUND(AVG(Churn) * 100, 2) AS churn_rate_percent
FROM telco_churn;

SELECT 
    ROUND(SUM(RevenueLost), 2) AS monthly_revenue_leakage
FROM telco_churn;

SELECT 
    ROUND(SUM(RevenueLost) * 12, 2) AS annual_revenue_leakage
FROM telco_churn;

SELECT 
    Contract,
    COUNT(*) AS customers,
    ROUND(AVG(Churn) * 100, 2) AS churn_rate_percent
FROM telco_churn
GROUP BY Contract
ORDER BY churn_rate_percent DESC;

SELECT 
    Contract,
    ROUND(SUM(RevenueLost), 2) AS revenue_leakage
FROM telco_churn
GROUP BY Contract
ORDER BY revenue_leakage DESC;

SELECT 
    TenureGroup,
    COUNT(*) AS customers,
    ROUND(AVG(Churn) * 100, 2) AS churn_rate_percent
FROM telco_churn
GROUP BY TenureGroup
ORDER BY churn_rate_percent DESC;

SELECT
    ROUND(AVG(Churn) * 100, 2) AS high_value_churn_rate
FROM telco_churn
WHERE HighValueCustomer = 1;

SELECT
    ROUND(SUM(RevenueLost), 2) AS high_value_revenue_loss
FROM telco_churn
WHERE HighValueCustomer = 1 AND Churn = 1;

SELECT 
    PaymentMethod,
    COUNT(*) AS customers,
    ROUND(AVG(Churn) * 100, 2) AS churn_rate_percent
FROM telco_churn
GROUP BY PaymentMethod
ORDER BY churn_rate_percent DESC;

SELECT 
    InternetService,
    ROUND(AVG(Churn) * 100, 2) AS churn_rate_percent
FROM telco_churn
GROUP BY InternetService
ORDER BY churn_rate_percent DESC;
