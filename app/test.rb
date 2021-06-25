require 'rubygems'
require 'activerecord'
require 'models\asset'
require 'models\user'
require 'models\tag'
require 'models\type'
require 'models\document'

ActiveRecord::Base.establish_connection(
  :adapter => 'mysql',
  :host     => "127.0.0.1",
  :database => "kabooru_development",
  :username => "root",
  :password => "");

d = Document.create_safely('Cons: Test Doc', 'blah blah and blah', 'suman.karthik@spinaxys.com', ['test', 'doc'])
