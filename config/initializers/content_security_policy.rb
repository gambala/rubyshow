# frozen_string_literal: true

# Define an application-wide content security policy
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy

Rails.application.config.content_security_policy do |policy|
  policy.connect_src :self, :https, 'http://localhost:3035', 'ws://localhost:3035' if Rails.env.development?
  # policy.default_src :self, :https
  # policy.font_src    :self, :https, :data
  # policy.img_src     :self, :https, :data
  # policy.object_src  :none
  # policy.script_src  :self, :https
  # policy.style_src   :self, :https
  # policy.report_uri  "/csp-violation-report-endpoint"
end

# If you are using UJS then enable automatic nonce generation
Rails.application.config.content_security_policy_nonce_generator = ->(_request) { SecureRandom.base64(16) }

# Report CSP violations to a specified URI
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only
# Rails.application.config.content_security_policy_report_only = true
