module RD
end

require 'ostruct'
require_relative 'use_case.rb'
#require_relative 'rd/database/in_memory.rb'
Gem.find_files("rd/use_case/*.rb").each { |path| require path }
Gem.find_files("rd/entities/*.rb").each { |path| require path }
Gem.find_files("rd/database/*.rb").each { |path| require path }
