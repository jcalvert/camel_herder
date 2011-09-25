class Route < ActiveRecord::Base  
    include MBean
  has_many :flows
  belongs_to :camel_context 
  has_one :server, :through => :camel_context
  after_create :update_xml #TODO: Needs to be in canonically better place.
  
  def update_xml
    self.xml= dumpRouteAsXml
    self.save
  end
 # def set_jmx_connection
  
  #, :xml => mbeanProxy.send("dumpRouteAsXml")
  
end
