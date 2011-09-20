java_import javax.management.remote.JMXConnector
java_import javax.management.remote.JMXConnectorFactory
java_import javax.management.remote.JMXServiceURL
java_import javax.management.ObjectName

class Server < ActiveRecord::Base
  
  @@connections = {} #TODO: this doesn't seem the best way, but it's what I'm doing atm
  
  def connection
    if @@connections[name].nil?
      url=JMXServiceURL.new uri
      map = java.util.HashMap.new
      creds = [username, password].to_java :String if !username.nil? #TODO: Encrypt pass?
      jmxc = JMXConnectorFactory.connect url, {"jmx.remote.credentials" => creds}     
      @@connections[name] = jmxc.get_mbean_server_connection
    end
  end
  
end
