# frozen_string_literal: true

require_relative "limpio/version"

module DeepRejectable
  def blank_value?
    if respond_to? :empty?
      empty?
    else
      false
    end
  end

  def deep_reject_blank!; end
end

String.prepend(DeepRejectable)
Integer.prepend(DeepRejectable)
Float.prepend(DeepRejectable)
TrueClass.prepend(DeepRejectable)
FalseClass.prepend(DeepRejectable)
NilClass.include(DeepRejectable).tap do |klass|
  klass.define_method(:blank_value?) do
    true
  end
end

Hash.include(DeepRejectable).tap do |klass|
  klass.define_method(:deep_reject_blank!) do
    delete_if do |_key, value|
      value.deep_reject_blank!
      value.blank_value?
    end
  end
end

Array.include(DeepRejectable).tap do |klass|
  klass.define_method(:deep_reject_blank!) do
    delete_if do |element|
      element.deep_reject_blank!
      element.blank_value?
    end
  end
end
