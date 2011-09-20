require 'java'
java_import javax.management.remote.JMXConnector
java_import javax.management.remote.JMXConnectorFactory
java_import javax.management.remote.JMXServiceURL
java_import javax.management.ObjectName

class Array
  def to_hash
    Hash[self.zip(map{|i| yield i})] if block_given?
  end
end


ROUTE_ATTRIBUTES = ["ExchangesCompleted", "ExchangesFailed", "ExchangesTotal",
   "FirstExchangeCompletedTimestamp", "FirstExchangeFailureTimestamp", "InflightExchanges", 
   "LastExchangeCompletedTimestamp", "LastExchangeFailureTimestamp", "LastProcessingTime",
    "MaxProcessingTime", "MeanProcessingTime", "MinProcessingTime",
    "RouteId", "RoutePolicyList", "State"]

def route_attributes(route)
  ROUTE_ATTRIBUTES.to_hash do |route_attr|
    @mbean_conn.get_attribute route, route_attr
  end
end


service_url = 'service:jmx:rmi://localhost:44444/jndi/rmi://localhost:1099/karaf-root'
url = JMXServiceURL.new service_url
map = java.util.HashMap.new
creds = ['smx', 'smx'].to_java :String
jmxc = JMXConnectorFactory.connect url, {"jmx.remote.credentials" => creds} 
@mbean_conn = jmxc.get_mbean_server_connection
domains = @mbean_conn.domains.to_a
camel_mbeans = @mbean_conn.query_names(nil, nil).select{|m| m.domain == 'org.apache.camel'}
camel_context_map = Hash[camel_mbeans.select{|m| m.to_s =~ /type=context/}.map do |m|
  matchdata=m.to_s.match /org.apache.camel:context=(.*?),type=context,name="(.*?)"/
  [matchdata[1],matchdata[2]]
end]
@camel_routes = camel_context_map.keys.to_hash{|k| {} }
#TODO: DRY this the hell out
camel_mbeans.inject(@camel_routes) do |routes,mbean| 
  matchdata=mbean.to_s.match /org.apache.camel:context=(.*?),type=routes,name="(.*?)"/
  if matchdata
    routes[matchdata[1]][matchdata[2]] = route_attributes(mbean)

#    doc.root.elements
  end
  routes
end