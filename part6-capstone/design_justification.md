## Storage Systems

To support the four goals of the hospital system, a combination of specialized storage systems is used.

For patient records and transactional data (EHR, treatment history, billing), a relational database such as MySQL is used. This ensures strong consistency, ACID compliance, and reliable updates, which are critical in healthcare environments where data accuracy is essential.

For real-time ICU vitals, a time-series or streaming-enabled storage system (such as a data lake with streaming ingestion) is used. This allows high-throughput ingestion and efficient storage of continuous sensor data without overloading the transactional system.

For analytical reporting (bed occupancy, cost analysis), a data warehouse or lakehouse is used. This system stores cleaned and structured data optimized for OLAP queries, enabling fast aggregations and historical analysis without impacting operational workloads.

For natural language querying by doctors, a vector database is used to store embeddings of patient records. This enables semantic search and retrieval using an LLM, allowing queries based on meaning rather than exact keywords.

Together, these systems provide a scalable and flexible architecture where each storage layer is optimized for its specific workload.

## OLTP vs OLAP Boundary

The OLTP (Online Transaction Processing) system consists of the relational database that handles day-to-day operations such as patient updates, treatment records, and billing transactions. This system is optimized for fast inserts, updates, and consistency.

The OLAP (Online Analytical Processing) system begins after the data is extracted from the OLTP system and loaded into the data lake and warehouse through ETL pipelines. Once data is transformed and stored in the lakehouse, it is used for reporting, analytics, and machine learning.

This separation ensures that heavy analytical queries do not impact the performance of the transactional system. The OLTP system focuses on operational efficiency, while the OLAP system supports insights, reporting, and AI workloads.

## Trade-offs

A key trade-off in this design is the increased architectural complexity due to the use of multiple storage systems (relational database, data lake, warehouse, and vector database). While this improves scalability and performance, it also introduces challenges in data consistency, maintenance, and system integration.

To mitigate this, a well-defined data pipeline and orchestration strategy can be implemented. Using centralized ETL processes ensures that data is consistently transformed and synchronized across systems. Additionally, adopting a lakehouse architecture can reduce fragmentation by combining data lake flexibility with warehouse performance.

Monitoring tools and data validation checks can further ensure data quality and consistency across all layers. While the system is more complex, these measures help maintain reliability and make the architecture manageable and scalable in the long run.