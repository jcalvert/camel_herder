class CreateCamelContexts < ActiveRecord::Migration
  def self.up
    create_table :camel_contexts do |t|
      t.string :name
      t.string :context_name
      t.references :server

      t.timestamps
    end
  end

  def self.down
    drop_table :camel_contexts
  end
end
