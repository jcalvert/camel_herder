class CreateFlows < ActiveRecord::Migration
  def self.up
    create_table :flows do |t|
      t.int :from
      t.int :to
      t.route :references

      t.timestamps
    end
  end

  def self.down
    drop_table :flows
  end
end
