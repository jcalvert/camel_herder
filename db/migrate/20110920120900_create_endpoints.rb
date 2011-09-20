class CreateEndpoints < ActiveRecord::Migration
  def self.up
    create_table :endpoints do |t|
      t.string :uri

      t.timestamps
    end
  end

  def self.down
    drop_table :endpoints
  end
end
