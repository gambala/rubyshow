module WithPagy
  extend ActiveSupport::Concern
  include Pagy::Backend

  included do
    helper_method :pagy_object
  end

  private

  def paginate(collection, **vars)
    @pagy_object, result = pagy(collection, **vars)
    result
  end

  def paginate_countless(collection, **vars)
    @pagy_object, result = pagy_countless(collection, **vars)
    result
  end

  def pagy_object
    # If we call "pagy_object" before "collection" in view, it will be nil
    # We must call "collection" first for generating proper pagy_object
    collection if @pagy_object.blank?
    @pagy_object
  end
end
