# frozen_string_literal: true

require_relative "limpio/version"

class Hash
  alias blank_value? empty?

  def deep_reject_blank!
    delete_if do |_key, value|
      value.deep_reject_blank!
      value.blank_value?
    end
  end
end

class Array
  alias blank_value? empty?

  def deep_reject_blank!
    delete_if do |element|
      element.deep_reject_blank!
      element.blank_value?
    end
  end
end

class String
  alias blank_value? empty?
  def deep_reject_blank!; end
end

class NilClass
  def deep_reject_blank!; end

  def blank_value?
    true
  end
end

class TrueClass
  def deep_reject_blank!; end

  def blank_value?
    false
  end
end

class FalseClass
  def deep_reject_blank!; end

  def blank_value?
    false
  end
end

class Integer
  def deep_reject_blank!; end

  def blank_value?
    false
  end
end

class Float
  def deep_reject_blank!; end

  def blank_value?
    false
  end
end
