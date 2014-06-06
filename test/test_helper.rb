require 'minitest'
require 'minitest/autorun'
require 'minitest/spec/expect'
require 'minitest/pride'

module AuthorHelpers
  include FileUtils
  
  def capture(stream = :stdout)
    begin
      strm = stream.to_s
      eval "$#{strm} = StringIO.new"
      yield
      result = eval("$#{strm}").string
    ensure
      eval("$#{strm} = #{strm.upcase}")
    end
    result
  end
  
  def liquid_templates_path
    File.join(File.dirname(__FILE__), 'liquids')
  end
  
  def using_liquid_templates
    cd(liquid_templates_path) do
      yield
    end
  end
  
end
MiniTest::Test.send :include, AuthorHelpers

module MiniTest
  class Spec
    class << self
      alias_method :context, :describe
    end
  end
end