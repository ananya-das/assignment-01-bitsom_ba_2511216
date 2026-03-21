## Architecture Recommendation

For this use case, a Data Lakehouse would be the best architectural choice.

To begin with, the startup generates highly diverse data—structured (payments), semi-structured (GPS logs), and unstructured (reviews and images). A Data Warehouse alone is too rigid for such variety, while a Data Lakehouse allows storage of all formats in their native form without enforcing strict schemas at ingestion.

Another key factor is the need for both operational and analytical workloads. For instance, GPS data may be processed in near real-time for delivery tracking, whereas historical transaction data is used for reporting and insights. A Data Lakehouse bridges this gap by combining the scalability of a data lake with the querying efficiency and reliability of a warehouse, including ACID transaction support.

Cost and growth are also major considerations. As the startup expands, data volume will increase rapidly. A Data Lakehouse leverages low-cost storage systems along with scalable compute engines, making it more economical compared to maintaining a traditional warehouse alone.

Finally, it enables advanced data use cases such as machine learning, including recommendation engines, demand prediction, and sentiment analysis from reviews. These capabilities are harder to implement efficiently in a warehouse-only setup.

In summary, a Data Lakehouse offers the flexibility, performance, and scalability needed to support both current operations and future growth.