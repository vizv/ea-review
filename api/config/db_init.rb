# Use in-memory database and fake data for demo purpose
DB = Sequel.sqlite

# Create tables

DB.create_table :users do
  primary_key :id
  String :name
end

DB.create_table :posts do
  primary_key :id
  String :title
  String :content
  foreign_key :author_id, :users
end

DB.create_table :comments do
  primary_key :id
  String :content
  foreign_key :author_id, :users
  foreign_key :post_id, :posts
end
