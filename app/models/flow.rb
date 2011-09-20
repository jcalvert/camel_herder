class Flow < ActiveRecord::Base
  
  belongs_to :from_endpoint, :class_name => "Endpoint", :foreign_key => "from"
  belongs_to :to_endpoint, :class_name => "Endpoint", :foreign_key => "to"
  
end
