class Endpoint < ActiveRecord::Base
  
  has_many :from_flows, :class_name => "Flow", :foreign_key => "from"
  has_many :to_flows, :class_name => "Flow", :foreign_key => "to"
  
end
