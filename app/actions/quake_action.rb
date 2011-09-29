class QuakeAction < Cramp::Action
  self.transport = :sse
  
  on_start :send_latest_quakes
  periodic_timer :send_latest_quakes, :every => 10
  
  def send_latest_quakes
    events = Quake::Event.last_hour
    event = events.first
    attributes = {}
    event.instance_variables.each do |var|
      attributes[var.to_s.delete("@")] = event.instance_variable_get(var)
    end
    render attributes.to_json
  end
end
