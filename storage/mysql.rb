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

private

def create_schema
  @db.query <<SQL
    create table if not exists anemone_storage (
      id int(11) NOT NULL auto_increment,
      page_key varchar(255),
      page_data BLOB,
      PRIMARY KEY (id),
      key (page_key)
    ) DEFAULT CHARSET=utf8;
    SQL
end


