Table table;

void setup() {
  table = loadTable("imdb_top_250.csv,");
  println(table.getRowCount() + "total rows in table");
  
  for (TableRow row : table.rows()) {
    int userId = row.getInt("User ID");
    String deviceMode = row.getString("Device Model");
    
    println("User " + userId + " has devide " + deviceMode);
  }
}
  
  
