class CamelContext < ActiveRecord::Base
  belongs_to :server
  has_many :routes
  
  def populate_routes
    camel_mbeans = server.jmx_connection.query_names(nil, nil).select{|m| m.domain == 'org.apache.camel'}
    camel_mbeans.select{|m| m.to_s =~ /type=routes/}.each do |m|
      matchdata=m.to_s.match /org.apache.camel:context=#{Regexp.quote(context_name)},type=routes,name="(.*?)"/
      camel_contexts << CamelContext.new(:context_name => matchdata[1], :name => matchdata[2])
    end
    
  end
  
  
end