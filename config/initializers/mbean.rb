module MBean
  
  def method_missing(method_id, *arguments, &block)
    begin
      super(method_id, arguments, &block)
    rescue
      #TODO: the ultimate call on server should *really* be here in the module. 
      #TODO Real typing plz? I could query the bean and get actual values.
#    p 'lulz rescue'
      result = server.jmx_connection.invoke(javax.management.ObjectName.new(self.object_name),
          method_id.to_s, arguments, Array.new(arguments.size, "String"))
    end
  end

end

