## Vector DB Use Case

A traditional keyword-based database search would not be sufficient for a system where lawyers need to search large contracts using natural language queries. Keyword search relies on exact word matches, which means it may fail to retrieve relevant sections if the wording in the contract differs from the user’s query. For example, a query like “termination clauses” might not match sections titled “contract cancellation conditions,” even though they are semantically similar.

In contrast, a vector database enables semantic search by understanding the meaning behind the text rather than just matching keywords. By converting both the contract content and user queries into vector embeddings, the system can identify similarities based on context and intent. This allows it to retrieve relevant sections even when different terminology is used.

In this system, the contracts would first be broken down into smaller chunks (such as paragraphs) and converted into embeddings using a model like sentence-transformers. These embeddings would then be stored in a vector database. When a lawyer submits a query, it is also converted into an embedding, and the system performs a similarity search to find the most relevant sections of the contract.

This approach significantly improves accuracy and usability, especially for large and complex documents. Therefore, a vector database plays a critical role in enabling efficient, intelligent, and context-aware search capabilities that go beyond traditional keyword matching.