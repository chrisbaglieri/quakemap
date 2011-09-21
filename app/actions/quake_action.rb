class QuakeAction < Cramp::Action
  def start
    render "Hello World!"
    finish
  end
end
