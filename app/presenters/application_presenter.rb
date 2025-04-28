class ApplicationPresenter
  def initialize(object, template)
    @object = object
    @template = template
  end

  def self.presents(name)
    define_method(name) do
      @object
    end
  end

  def respond_to_missing?(*)
    true
  end

  def method_missing(*, &block)
    @template.send(*, &block)
  end
end
