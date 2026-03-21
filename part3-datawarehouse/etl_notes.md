## ETL Decisions

### Decision 1 — Date Format Standardization
Problem: The raw dataset contained inconsistent date formats such as DD-MM-YYYY and MM/DD/YYYY, which made aggregation and filtering difficult.  
Resolution: All dates were converted into a standard ISO format (YYYY-MM-DD) before loading into the dim_date table. Additionally, month and year fields were extracted to support analytical queries.

---

### Decision 2 — Handling NULL Values
Problem: Some records had missing values for fields such as product category or unit price, which could lead to incorrect aggregations or query failures.  
Resolution: Missing categorical values were replaced with appropriate defaults based on context, while missing numeric values were either cleaned or excluded. This ensured data completeness and reliability in the fact table.

---

### Decision 3 — Category Normalization
Problem: Product categories were inconsistently stored (e.g., "electronics", "Electronics", "ELECTRONICS"), leading to fragmented grouping in reports.  
Resolution: All category values were standardized to a consistent format (capitalized, e.g., "Electronics") before loading into the dim_product table. This ensures accurate grouping and reporting in analytical queries.