# 📊 Customer Churn Analysis
![sql1](https://github.com/user-attachments/assets/94536a09-8ac4-4847-bc76-82c01bb4f70d)
![sql2](https://github.com/user-attachments/assets/da5d3d70-7cbf-419b-9eac-33b26ff3131f)
![sql3](https://github.com/user-attachments/assets/f62ff3ff-d57d-408a-af6c-97d9b039d3fd)

## 🚀 Project Overview
Customer churn is a critical issue for businesses, especially in the banking sector. This project analyzes customer churn using **SQL queries** to extract insights from a dataset containing customer demographics, account balances, salaries, and churn status.

---

## 📁 Dataset
**Dataset Name:** `Customer-Churn-Records`

| Column Name        | Description                                   |
|--------------------|-----------------------------------------------|
| `CustomerId`      | Unique identifier for customers               |
| `Gender`          | Customer gender (Male/Female)                 |
| `Age`             | Age of the customer                           |
| `Balance`         | Account balance                               |
| `EstimatedSalary` | Predicted salary of the customer              |
| `Exited`          | Whether the customer churned (1 = Yes, 0 = No) |

📌 **Objective:** Identify patterns in customer churn to help businesses retain customers.

---

## 🛠️ Setup Instructions

### 🔹 Clone the Repository
```bash
git clone https://github.com/yourusername/Customer-Churn-Analysis.git
cd Customer-Churn-Analysis
```

### 🔹 Install Dependencies (Optional for Python Analysis)
```bash
pip install pandas numpy matplotlib seaborn
```

---

## 🏗️ File Structure
```
Customer-Churn-Analysis/
│-- 📄 README.md  
│-- 📁 data/  
│   ├── customer_churn_records.csv  
│   ├── sample_data.sql  
│-- 📁 sql_queries/  
│   ├── data_exploration.sql  
│   ├── churn_insights.sql  
│   ├── advanced_queries.sql  
│-- 📁 reports/  
│   ├── churn_analysis_report.pdf  
│   ├── visualizations.png  
│-- 📁 notebooks/  
│   ├── churn_analysis.ipynb  
│-- 📁 scripts/  
│   ├── data_preprocessing.py  
│   ├── export_results.py  
│-- 📄 LICENSE  
│-- 📄 .gitignore  
```

---

## 🔍 Key SQL Queries

### **1️⃣ Total Number of Exited Customers Grouped by Gender**
```sql
SELECT Gender, COUNT(*) AS Total_Exited_Customers
FROM [Customer-Churn-Records]
WHERE Exited = 1
GROUP BY Gender;
```

### **2️⃣ Last 10 Customers with Highest Balance & Salary**
```sql
SELECT TOP 10 CustomerId, Balance, EstimatedSalary
FROM [Customer-Churn-Records]
ORDER BY Balance DESC, EstimatedSalary DESC;
```

### **3️⃣ Average Salary by Age**
```sql
SELECT Age, AVG(EstimatedSalary) AS Avg_Salary
FROM [Customer-Churn-Records]
GROUP BY Age;
```

---

## 📊 Visualizations
- 📌 **Churn rate by gender**
- 📌 **Customer balance distribution**
- 📌 **Salary vs. churn probability**

---
![sql7](https://github.com/user-attachments/assets/71c84d24-1589-46e1-9575-f89e3fdbdf53)
![sql6](https://github.com/user-attachments/assets/f2c3d421-558d-4ce2-91c7-5ea886cbb68d)
![sql5](https://github.com/user-attachments/assets/9642c82b-bfa2-4c6a-87f9-f465f2365405)
![sql4](https://github.com/user-attachments/assets/addeee82-a0d8-40ad-b58b-1c7035c8fe68)
![sql3](https://github.com/user-attachments/assets/1e1d37be-31dc-44c9-851d-9df406c7f384)
![sql2](https://github.com/user-attachments/assets/ef53c3ed-c2f6-49f9-8a51-4c5d80a676e2)
![sql1](https://github.com/user-attachments/assets/d7468308-54b7-4cce-8286-bd7cdb60bc07)


## 📝 License
This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

---

## 🤝 Contributing
Contributions are welcome! Feel free to **fork this repo**, make changes, and submit a **pull request**.

---

## 🌎 Connect with Me
📧 Email: your.email@example.com  
🐙 GitHub: [Your GitHub Profile](https://github.com/yourusername)  
💼 LinkedIn: [Your LinkedIn](https://linkedin.com/in/yourprofile)

