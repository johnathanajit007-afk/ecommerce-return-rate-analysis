# 🛍️ E-Commerce Return Rate & Financial Loss Analysis

## 📌 What This Project Does
When online shoppers return too many items, it costs companies a lot of money in extra shipping and processing. This project looks at e-commerce transaction data to find out why items are coming back and which categories or customers are causing the biggest problems.

---

## 🔍 What I Discovered (Key Insights)

1. **Clothing Has the Biggest Return Problem:**
   * The **Clothing** category has a really high return rate. Almost all of the complaints were about **"Size Mismatch."** This means the sizing charts on the store's website are probably confusing and need to be fixed.
   
2. **Flagging a High-Risk Account:**
   * I found an outlier pattern with **Customer ID 1**. This user bought 4 items and returned all 4 of them (**100% return rate**). The business should flag accounts like this to prevent policy abuse.

---

## 🛠️ Tools & Tech Used

* **SQL (MySQL)**: I used this to set up the data table and write queries to group the orders and calculate total refunds.
* **Python (Jupyter Notebook)**: I used this to explore the raw numbers.
* **Pandas**: Helped me group the data categories and calculate the return percentages easily.
* **Seaborn & Matplotlib**: I used these to draw a clean bar chart showing the main reasons people return products.

---

## 📂 Data Reference
The setup and numbers for this project are modeled after the public [Kaggle E-Commerce Product Return Likelihood Dataset](https://kaggle.com).
