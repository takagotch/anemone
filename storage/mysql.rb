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



def get_hash_value(key)
  puts "get_hash_value"
  Digest::SHA1.hexdigest(key)
end

def has_key?(url)
  key = get_hash_value(url)
  result = @db.query(
  "SELECT count(id) FROM anemone_storage WHERE page_key = '#{key}'")

  if result.first['count(id)'] > 0
    return true
  else
    return false
  end
end

def [](url)
  value = @db.query(
  "SELECT data FROM anemone_storage WHERE page_key =
  '#{get_hash_value(url)}'").first['data']

  if value
    Marshal.load(value)
  end
end

def []=(url, value)
  data = Marshal.dump(value)
  key  = get_hash_value(url)
  if has_key?(url)
    @db.query("UPDATE anemone_storage SET page_data =
      '#{data}' WHERE page_key = '#{key}'")
  else
    @db.query("INSERT INTO anemone_storage(
      page_key, page_data) VALUES('#{key}', '#{data}')")
  end
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


