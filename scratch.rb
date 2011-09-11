require 'java'
java_import javax.management.remote.JMXConnector
java_import javax.management.remote.JMXConnectorFactory
java_import javax.management.remote.JMXServiceURL
java_import javax.management.ObjectName
service_url = 'service:jmx:rmi://localhost:44444/jndi/rmi://localhost:1099/karaf-root'
url = JMXServiceURL.new service_url
map = java.util.HashMap.new
creds = ['smx', 'smx'].to_java :String
jmxc = JMXConnectorFactory.connect url, {"jmx.remote.credentials" => creds} 
mbean_conn = jmxc.get_mbean_server_connection
domains = mbean_conn.domains.to_a
camel_mbeans = mbean_conn.query_names(nil, nil).select{|m| m.domain == 'org.apache.camel'}
camel_contexts = camel_mbeans.select{|m| m.to_s =~ /type=context/}
camel_contexts.each{|context| p (context.to_s.match /,name=(.*)/)[1].gsub /\"/, '' }