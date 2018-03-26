# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy
# For further information see the following documentation
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy

Rails.application.config.content_security_policy do |policy|
  policy.default_src :self, :https
  policy.font_src    :self, :https, :data
  policy.img_src     :self, :https, :data
  policy.object_src  :none

  if Rails.env.development?
    policy.style_src   :self, :http, :https, :unsafe_inline
    policy.script_src  :self, :http, :https, :unsafe_inline
    policy.connect_src :self, :http, :https, "ws://localhost:3035", "ws://localhost:35729"
  else
    policy.style_src   :self, :https
    policy.script_src  :self, :https
    policy.connect_src :self, :https
  end

  # Specify URI for violation reports
  # policy.report_uri "/csp-violation-report-endpoint"
end

# Enabling nonces disables the `unsafe_inline` policy, which we need in dev for scout etc
if !Rails.env.development?
  # automatically generate nonces to allow UJS scripts
  Rails.application.config.content_security_policy_nonce_generator = -> request { SecureRandom.base64(16) }
end

# Report CSP violations to a specified URI
# For further information see the following documentation:
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only
# Rails.application.config.content_security_policy_report_only = true
