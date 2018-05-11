class MicroTest
  def self.inherited(c)
    c.class_eval do
      def self.method_added(m)
        # If m starts with "test" 
        # Create an instance of c 
        # If there's a setup method 
        # Execute setup 
        # Execute the method m
      end
    end
  end
end