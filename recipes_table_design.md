# Recipes Table Design Recipe

## 1. Extract nouns from the user stories or specification

```
As a food lover,
So I can stay organised and decide what to cook,
I'd like to keep a list of all my recipes with their names.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to keep the average cooking time (in minutes) for each recipe.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to give a rating to each of the recipes (from 1 to 5).
```

```
Nouns:

recipe, name, cooking time, rating
```

## 2. Infer the Table Name and Columns

| Record                | Properties          |
| --------------------- | ------------------  |
| recipe                | name, cooking time, rating

Name of the table (always plural): `recipes` 

Column names: `name`, `cooking_time`, `rating`

## 3. Decide the column types.

```
id: SERIAL
name: text
cooking_time: int
rating: int
```

## 4. Write the SQL.

```sql
CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  name text,
  cooking_time int,
  rating int
);
```

## 5. Create the table.

```bash
psql -h 127.0.0.1 recipes_directory < recipes_table.sql
```
