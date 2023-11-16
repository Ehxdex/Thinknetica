module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods    
  end

  module ClassMethods
    def instances
      puts "Instance created, count: #{@instances}"
    end

    def increase_instance
      @instances ||= 0
      @instances += 1
    end
  end
  
  module InstanceMethods
    def register_instance
      self.class.increase_instance
    end
  end 
end