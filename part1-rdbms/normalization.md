## Anomaly Analysis

### Insert Anomaly
In the current dataset, a new product cannot be added unless there is an associated order.  
For example, columns like `product_id`, `product_name`, and `unit_price` are tied to `order_id`.  
This means if a new product (e.g., P999) is introduced but not yet ordered, it cannot be inserted into the table.

---

### Update Anomaly
Customer and sales representative data are repeated across multiple rows.  
For example, if a customer (customer_id = C101) appears in multiple rows and their `customer_email` changes, all rows must be updated.  
If one row is missed, inconsistent data will exist in the database.

---

### Delete Anomaly
If the last order of a product is deleted, all information about that product is lost.  
For example, deleting a row containing a unique `product_id` will remove its `product_name`, `category`, and `unit_price`.  
Similarly, deleting all orders handled by a sales representative removes their details completely.

---

## Normalization Justification

While keeping all data in a single table may initially appear simpler, this approach introduces significant data redundancy and integrity issues, as seen in the provided dataset. For example, customer details such as `customer_name`, `customer_email`, and `customer_city` are repeated across multiple rows for every order placed by the same customer. If a customer’s email changes, it would need to be updated in every corresponding row. Missing even one update would lead to inconsistent and unreliable data, demonstrating an update anomaly.

Similarly, product information like `product_name`, `category`, and `unit_price` is duplicated for every order in which the product appears. This not only increases storage unnecessarily but also risks inconsistencies if product details are modified in some rows but not others. Additionally, a delete anomaly can occur when removing the last order of a product or customer results in the complete loss of their associated information from the system.

Normalization addresses these problems by separating the data into multiple related tables such as Customers, Products, Orders, and Sales Representatives. Each entity is stored only once, reducing redundancy and ensuring that updates occur in a single location. This design improves data consistency, prevents anomalies, and makes the database easier to maintain and scale.

Therefore, normalization is not over-engineering but a necessary step to ensure data integrity, accuracy, and long-term maintainability of the system.