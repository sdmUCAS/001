class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
     # t.int :id
     # t.varchar(45) :name
    #  t.varchar(45) :title
     # t.text :content

     # t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
