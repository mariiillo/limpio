# frozen_string_literal: true

require_relative "limpio/version"

module Limpiable
  def blank_value?
    if respond_to? :empty?
      empty?
    else
      false
    end
  end

  def deep_reject_blank!; end
end

String.prepend(Limpiable)
Integer.prepend(Limpiable)
Float.prepend(Limpiable)
TrueClass.prepend(Limpiable)
FalseClass.prepend(Limpiable)
NilClass.include(Limpiable).tap do |klass|
  klass.define_method(:blank_value?) do
    true
  end
end

Hash.include(Limpiable).tap do |klass|
  klass.define_method(:deep_reject_blank!) do
    delete_if do |_key, value|
      value.deep_reject_blank!
      value.blank_value?
    end
  end
end

Array.include(Limpiable).tap do |klass|
  klass.define_method(:deep_reject_blank!) do
    delete_if do |element|
      element.deep_reject_blank!
      element.blank_value?
    end
  end
end
