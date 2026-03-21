// OP1: insertMany() — insert all 3 documents
db.products.insertMany([
  {
    _id: "E101",
    name: "Samsung 55-inch Smart TV",
    category: "Electronics",
    price: 45000,
    brand: "Samsung",
    specs: {
      resolution: "4K",
      voltage: "220V",
      smart_features: ["Netflix", "YouTube", "Prime Video"]
    },
    warranty_years: 2,
    ratings: [4.5, 4.7, 4.6]
  },
  {
    _id: "C101",
    name: "Men's Casual Shirt",
    category: "Clothing",
    price: 1500,
    brand: "Levis",
    sizes_available: ["S", "M", "L", "XL"],
    material: "Cotton",
    color_options: ["Blue", "Black", "White"],
    ratings: [4.2, 4.0, 4.3]
  },
  {
    _id: "G101",
    name: "Amul Milk 1L",
    category: "Groceries",
    price: 60,
    brand: "Amul",
    expiry_date: new Date("2024-12-30"),
    nutritional_info: {
      calories: 150,
      fat: "8g",
      protein: "6g"
    },
    storage: {
      temperature: "Refrigerated",
      shelf_life_days: 7
    }
  }
]);



// OP2: find() — Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});



// OP3: find() — Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});



// OP4: updateOne() — add discount_percent field
db.products.updateOne(
  { _id: "E101" },
  { $set: { discount_percent: 10 } }
);



// OP5: createIndex() — index on category
db.products.createIndex({ category: 1 });

// Explanation:
// Creating an index on the "category" field improves query performance
// for frequent searches like filtering products by category (e.g., Electronics, Groceries).
// It reduces scan time and speeds up retrieval in large datasets.