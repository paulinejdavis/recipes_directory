require_relative '../lib/recipe'
require_relative '../lib/recipe_repository'

RSpec.describe RecipesRepository do
    def reset_recipes_table
        seed_sql = File.read('spec/seeds_recipes.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
        connection.exec(seed_sql)
    end

    before(:each) do 
      reset_recipes_table
    end

    it 'returns a list of recipes' do
  
      repo = RecipeRepository.new
      recipes = repo.all

      expect(recipes.length).to eq(4)
      expect(recipes[0].id).to eq(1) 
      expect(recipes[0].name) .to eq ("Tofu Surprise")
      expect(recipes[0].cooking_tim) .to eq (5)
      expect(recipes[0].rating) .to eq (4)

      expect(recipes[1].id).to eq(2) # =>  2
      expect(recipes[1].name).to eq("Ratatouille") # =>  "Ratatouille"
      expect(recipes[1].cooking_time).to eq(10) # =>  10
      expect(recipes[1].rating).to eq(3) # => 3

      expect(recipes[2].id).to eq(3)# =>  3
      expect(recipes[2].name).to eq("Turkey Sandwich") # =>  "Turkey Sandwich"
      expect(recipes[2].cooking_time).to eq (6)# =>  6
      expect(recipes[2].rating).to eq(2) # => 2

      expect(recipes[3].id).to eq(4)# =>  4
      expect(recipes[3].name).to eq("Waffles") # =>  "Waffles"
      expect(recipes[3].cooking_time).to eq(5) # =>  5
      expect(recipes[3].rating).to eq(5) # => 5
    end
    # 2
    it 'return a single recipe' do

      repo = RecipeRepository.new
      recipe = repo.find(1)

      expect(recipe.id).to eq(1) # =>  1
      expect(recipe.name).to eq("Tofu Surprise")# =>  'Tofu Surprise'
      expect(recipe.cooking_time).to eq(5) # =>  5
      expect(recipe.rating).to eq(4) # =>  4
    end

    # 4
    it 'returns the second recipe - Ratatouille' do

      repo = RecipeRepository.new
      recipe = repo.find(2)

      expect(recipe.id).to eq(2) # =>  2
      expect(recipe.name.to eq("Ratatouille") # =>  'Ratatouille'
      expect(recipe.cooking_time).to eq(10) # =>  10
      expect(recipe.rating).to eq(4) # =>  4
    end
end