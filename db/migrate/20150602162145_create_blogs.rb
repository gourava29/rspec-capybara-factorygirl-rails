class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :content
      t.string :author

      t.timestamps null: false
    end
  end
end
