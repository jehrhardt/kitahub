# frozen_string_literal: true
# Validation for email addresses
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    pattern = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    return if value.match?(pattern)

    record.errors[attribute] <<
      'is not an email'
  end
end

# The user is an entity, that represents the logged in user.
class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, email: true
  validates :password, length: { minimum: 8 }
end
