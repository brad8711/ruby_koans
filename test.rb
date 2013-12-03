class Proxy
  def initialize(target_object)
    @object = target_object
    @message_log = {}
  end

  # WRITE CODE HERE
  def method_missing(method_name, *args, &block)
    if @object.respond_to?(method_name)
      @message_log[method_name] = number_of_times_called(method_name) + 1
      @object.send(method_name, *args, &block)
    else
      super(method_name, *args, &block)
    end
  end

  def messages
    @message_log.keys.reverse
  end
  def get_message_log
    
    @message_log
  
  end

  def called?(method_name)
    @message_log.key?(method_name)
  end
 
  def number_of_times_called(method_name)
    @message_log[method_name] || 0
  end
end

class Television
  attr_accessor :channel, :power

  def power
    if @power == :on
      @power = :off
    else
      @power = :on
    end
  end

  def on?
    @power == :on
  end
end

mytv = Television.new
#p mytv.send(:channel=, 10)
#p mytv.send(:instance_variable_get, "@channel")
tv = Proxy.new(Television.new)
#p tv.inspect
#p tv.instance_of?(Proxy)
tv.channel = 10
#p tv.channel
tv.power
tv.power

p tv.get_message_log.keys