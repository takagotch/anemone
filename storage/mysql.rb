begin
  require 'mysql2'
rescue LoadError
  puts "You need the mysql2 gem to use Anemone::Storage::MySQL"
  
  exit
end

def initialize(opts = {})
  host     = opts[:host]     || 'localhost'
  username = opts[:username] || 'crawler'
  password = opts[:password] || 'anemone_pass'
  database = opts[:database] || 'anemone'
  @db      = Mysql2::Client.new(
    :username => #{username}, :password => #{password},
    :database => #{database})
  create_schema
end

