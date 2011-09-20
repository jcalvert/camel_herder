class CamelContext < ActiveRecord::Base
  belongs_to :server
  has_many :routes
  
end