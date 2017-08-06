# frozen_string_literal: true

ActiveSupport.on_load(:action_controller) do
  wrap_parameters format: [:json] if respond_to?(:wrap_parameters)
end

# ActiveSupport.on_load(:active_record) do
#  self.include_root_in_json = true
# end
