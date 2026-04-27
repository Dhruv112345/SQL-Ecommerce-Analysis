-- RFM Analysis
SELECT customer_id,
       DATEDIFF(CURDATE(), MAX(order_date)) AS recency,
       COUNT(order_id) AS frequency,
       SUM(amount) AS monetary
FROM Orders
GROUP BY customer_id;

-- Customer Segmentation using NTILE
SELECT customer_id,
       NTILE(4) OVER (ORDER BY SUM(amount) DESC) AS customer_segment
FROM Orders
GROUP BY customer_id;

-- Top Customers (Revenue Contribution)
SELECT customer_id, SUM(amount) AS total_spent
FROM Orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;
