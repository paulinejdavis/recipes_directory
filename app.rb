require_relative 'lib/database_connection'

DatabaseConnection.connect('recipes_directory')

sql = 'SELECT id, name, cooking_time, rating FROM recipes;'
result = DatabaseConnection.exec_params(sql, [])

# result.each do |record|
#   p record
#SELECT name, cooking_time FROM recipes WHERE id = 2;

result.each do|record|
  p "#{record["id"]} - #{record["name"]} - #{record["cooking_time"]} - #{record["rating"]}"
end