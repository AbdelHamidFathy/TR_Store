class Constants {
  static const String database = "database.db"; 
  static const String createCartTable = "CREATE TABLE cart (id INTEGER PRIMARY KEY, title TEXT, price INTEGER, image TEXT, description TEXT, quantity INTEGER )"; 
  static const String selectFromCart = "SELECT * FROM cart";
  static const String insertToCart = "INSERT INTO cart(title, price, image, description, quantity) VALUES";
  static const String deleteFromCart = "DELETE FROM cart WHERE price = ?";
  static const String updateCart = "UPDATE cart SET quantity = ? WHERE id = ?";
}