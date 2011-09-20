class CreateRoutes < ActiveRecord::Migration
  def self.up
    create_table :routes do |t|
      t.string :name
      t.text :xml
      t.camel_context :references

      t.timestamps
    end
  end

  def self.down
    drop_table :routes
  end
end
