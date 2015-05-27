#!/usr/bin/env ruby

module Boolean; end
class TrueClass; include Boolean; end
class FalseClass; include Boolean; end

class RubyTruth
  def initialize
    vals = %w(true false nil) + (0..9).to_a
    ops = %w(|| &&)
    @statement = create_statement(vals, ops)
  end

  def play
    puts @statement, 'True, truthy, false, or falsey?'
    evaluated_statement = evaluate @statement
    response = gets.chomp.downcase.strip
    the_rest = " This statement is #{evaluated_statement}."

    response == evaluated_statement ? 'Correct!' + the_rest : 'Incorrect!' + the_rest
  end

  def evaluate(arg)
    return arg.to_s if arg.is_a? Boolean

    if arg.is_a? Integer
      'truthy'
    elsif arg.nil?
      'falsey'
    else
      evaluate(eval arg)
    end
  end

  private

  def create_statement(vals, ops)
    rand(2) == 1 ? vals.sample : [vals.sample, ops.sample, vals.sample].join(' ')
  end
end

# Uncomment to play
# puts RubyTruth.new.play
