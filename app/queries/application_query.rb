# frozen_string_literal: true

class ApplicationQuery < SimpleDelegator
  attr_accessor :options

  def initialize(options = {}, relation)
    @options = options
    self.relation = relation
    apply_actions
  end

  class_attribute :actions

  class << self
    def action(*args, &block)
      if block_given?
        actions << block
      elsif args.first.is_a?(Array)
        actions.push(*args.first)
      else
        actions.push(*args)
      end
    end

    def remove_action(action)
      actions.delete(action)
    end

    def actions
      @actions ||= []
    end
  end

  private

  attr_reader :relation

  def relation=(value)
    @relation = value
    __setobj__(@relation)
  end

  def apply_actions
    self.actions.each do |action|
      self.relation = evaluate_action(action) || relation
    end
  end

  def evaluate_action(action)
    if action.is_a?(Proc)
      instance_eval(&action)
    else
      send(action.to_sym)
    end
  end
end
