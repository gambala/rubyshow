module WithFrameContainerTag
  extend ActiveSupport::Concern

  private

  def use_container
    @use_container = true
  end
end
