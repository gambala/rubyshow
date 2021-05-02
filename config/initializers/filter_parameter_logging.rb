# frozen_string_literal: true

Rails.application.config.filter_parameters += [
  :password, :passw, :secret, :token, :_key, :crypt, :salt, :certificate, :otp, :ssn
]
