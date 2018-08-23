class RecursiveCounter
  def initialize
    @count = 0
  end

  def set_invoker
    @invoker = lambda do |*param|
      yield(self, *param)
    end
  end

  def invoke(*param)
    @count = @count + 1
    @invoker.call(*param)
  end

  def count
    @count
  end

  def self.create_recursive_counter(&block)
    counter = RecursiveCounter.new
    counter.set_invoker &block
    return counter
  end

  private
  attr_writer :count
  private_instance_methods  :set_invoker
end