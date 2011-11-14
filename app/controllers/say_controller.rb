class SayController < ApplicationController
  def hello
    @time = Time.now
    @name = 'Ani'
    @files = Dir.glob('*')
    @hello = ['hello','world']
    respond_to do |format|
      format.json {render:json =>@hello.to_json }
    end
  end

  def goodbye
  end

end
