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
    case arg
    when Boolean
      arg.to_s
    when Integer
      'truthy'
    when nil
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

if __FILE__ == $0
  puts RubyTruth.new.play
end
