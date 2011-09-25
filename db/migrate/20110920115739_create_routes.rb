class CreateRoutes < ActiveRecord::Migration
  def self.up
    create_table :routes do |t|
      t.string :name
      t.string :object_name      
      t.text :xml
      t.references :camel_context

      t.timestamps
    end
  end

  def self.down
    drop_table :routes
  end
end
