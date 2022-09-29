require_relative '../lib/recipe'

class RecipeRepository
    def all
      sql = 'SELECT id, name, cooking_time, rating FROM recipes;'
      result_set = DatabaseConnection.exec_params(sql, [])
  
      recipes = []
   
  
    result_set. each |record|
    recipe = Recipe.new
    recipe.id = record['id']
    recipe.name = record['name']
    recipe.cooking_time = record['cooking_time']
    recipe.rating = record['rating']

    recipes << recipe
    
    end
    return recipes
end

    def find(id)
        sql = 'SELECT id, name, cooking_time, rating FROM recipes WHERE id = $1;'
        sql_ref = [id]

        result_set = DatabaseConnection.exec_params(sql, sql_ref)

        record = result_set[0]
        recipe = Recipe.new
        recipe.id = record['id']
        recipe.name = record['name']
        recipe.cooking_time = record['cooking_time']
        recipe.rating = record['rating']

        return recipe
    end
end