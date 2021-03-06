java_import javax.management.remote.JMXConnector
java_import javax.management.remote.JMXConnectorFactory
java_import javax.management.remote.JMXServiceURL
java_import javax.management.JMX
java_import javax.management.ObjectName

class Server < ActiveRecord::Base
  
  has_many :camel_contexts
  after_create :populate_contexts
  
  @@jmx_connections = {} #TODO: this doesn't seem the best way, but it's what I'm doing atm
  #TODO: Keep alive???
  
  def jmx_connection
    if @@jmx_connections[name].nil?
      url=JMXServiceURL.new uri
      map = java.util.HashMap.new
      creds = [username, password].to_java :String if !username.nil? #TODO: Encrypt pass?
      jmxc = JMXConnectorFactory.connect url, {"jmx.remote.credentials" => creds}     
      @@jmx_connections[name] = jmxc.get_mbean_server_connection
    end
    @@jmx_connections[name]
  end
  
  def populate_contexts
    domains = jmx_connection.domains.to_a
    camel_mbeans = jmx_connection.query_names(nil, nil).select{|m| m.domain == 'org.apache.camel'}
    camel_mbeans.select{|m| m.to_s =~ /type=context/}.each do |m|
      matchdata=m.to_s.match /org.apache.camel:context=(.*?),type=context,name="(.*?)"/
      context = CamelContext.new(:context_name => matchdata[1], :name => matchdata[2])
      camel_contexts << context
      camel_mbeans.select{|m| m.to_s =~ /org.apache.camel:context=#{Regexp.quote(context.context_name)},type=routes,name="(.*?)"/}.
        each do |m|
          routename=m.to_s.match(/name="(.*?)"/)[1]
#          mbeanProxy = JMX.newMBeanProxy(jmx_connection, m, java.lang.Object.class);
          context.routes << Route.new(:name => routename, :object_name => m.to_s)
      end
    end
  end
  
end
