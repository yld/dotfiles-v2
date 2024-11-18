# frozen_string_literal: true

require 'rubygems'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError
  puts 'please gem install awesome_print'
end 

require 'benchmark'

# This makes pry itself and all pry gems available
$LOAD_PATH.push(*Dir["#{ENV['HOME']}/.prygems/gems/*/lib"]).uniq!

begin
  # Use Pry everywhere
  require 'pry'
rescue LoadError
  puts 'please gem install pry'
end

if defined? Pry
  Pry.start
  exit
else
if defined?(rails_env) && rails_env == 'test'
  begin
    require 'factory_bot'
    factorybot.find_definitions
    include factorybot::syntax::methods
  rescue standarderror
    puts 'please gem install factory_bot'
  end
end

if defined?(rails_env) && rails_env == 'test'
  begin
    require 'factory_bot'
    factorybot.find_definitions
    include factorybot::syntax::methods
  rescue standarderror
    puts 'please gem install factory_bot'
  end
end

  def time(times = 1)
    result = nil
    Benchmark.bm { |x| x.report { times.times { result = yield } } }
    result
  end
end
