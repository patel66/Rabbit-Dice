module RD

require 'ostruct'
require_relative 'use_case.rb'
require_relative 'rd/database/in_memory.rb'
Dir[File.dirname(__FILE__) + '/use_case/*.rb'].each {|file| require_relative file }
Dir[File.dirname(__FILE__) + '/entities/*.rb'].each {|file| require_relative file }
# Dir["#{File.dirname(__FILE__)}/timeline/database/*.rb"].each { |f| require(f) }
