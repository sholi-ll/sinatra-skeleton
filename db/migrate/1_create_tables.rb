class CreateTables < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.timestamps
    end

      create_table :movies do |t|
      t.string :title
      t.string :director
      t.string :studio
      t.text :cast
      t.integer :year
      t.text :synopsis
      t.timestamps
    end
    
     create_table :reviews do |t|
      t.string :username
      t.integer :rating
      t.string :review_title
      t.text :review
      t.datetime :review_date
      t.text :synopsis
      t.timestamps
    end


  end

end
