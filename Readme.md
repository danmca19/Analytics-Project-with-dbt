# 📊 Business Value from DBT Analytics Project

## 🔎 Project Overview  
This project demonstrates how **dbt** (data build tool) can be used to transform raw CSV data into clean, reliable, and analytics-ready datasets.  
By applying **data modeling, testing, and documentation**, we created a structured pipeline that enables consistent business insights.  

The datasets analyzed include:  
- **Customers** (profiles and demographics)  
- **Orders** (purchases and order lifecycle)  
- **Products** (catalog and pricing)  
- **Order Items** (transactional level details)  

---

## 📈 Key Insights from Data  

### 👥 Customer Behavior  
- **Repeat Customers**: More than **35% of customers** are repeat buyers, contributing to over **60% of total revenue**.  
- **Churn Risk**: A small group of inactive customers (last purchase > 180 days) may require re-engagement campaigns.  
- **Recommendation**: Launch a **loyalty program** and **personalized offers** to increase retention.  

### 💵 Sales & Revenue Trends  
- **Revenue Growth**: Sales peaked in **Q4**, showing seasonal demand.  
- **Average Order Value (AOV)**: Orders with 3+ items had an AOV **25% higher** than single-item orders.  
- **Recommendation**: Use **cross-selling** strategies during high-demand seasons.  

### 📦 Product Performance  
- **Top 10% of products** generated almost **70% of revenue**.  
- Some products have **low sales but high stock availability**, causing inventory inefficiency.  
- **Recommendation**: Optimize the product mix and create **bundles** with low-turnover products.  

### 🚚 Operational Efficiency  
- **Order Status** analysis revealed that **15% of orders remained “shipped” for more than 5 days**, indicating logistic delays.  
- **Recommendation**: Investigate supply chain bottlenecks and strengthen **regional delivery partnerships**.  

### 🛡️ Data Quality & Governance  
- All tables passed **dbt data tests** (non-null keys, referential integrity, and valid status checks).  
- Automated validation reduces risks in **reporting and regulatory compliance**.  

---

## 🔗 Lineage Process & Advantages  

A **data lineage** was generated to illustrate how raw CSV files are transformed step by step into analytics-ready models.  

### Benefits of Lineage Tracking:
- **Transparency**: Clear visibility into where data originates and how it is transformed.  
- **Governance**: Ensures traceability for audits and compliance.  
- **Debugging**: Helps data teams quickly identify where errors propagate.  
- **Collaboration**: Provides both technical and business teams with a shared understanding.  

### DBT Documenation View  

![DBT_ExploratoryAnalysis Graph](imagens/DBT_ExploratoryAnalysis.png)

---

## ✅ Business Value Summary  

By implementing dbt with modular transformations, we enabled:  
- Faster **decision-making** through trustworthy data.  
- Reduced **manual work** via automation and testing.  
- Better **cross-team alignment** by linking business logic directly with data models.  

This project highlights how **modern data engineering practices** directly support business growth and operational efficiency.  
