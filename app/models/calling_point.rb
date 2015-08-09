class CallingPoint
  attr_accessor :station, :st, :et, :at, :cancelled, :delayed


  def to_s
    station.to_s
  end


  def is_cancelled?
    cancelled
  end


  def is_delayed?
    delayed
  end


  def time
    return at if at
    return et if et
    return "Delayed" if is_delayed?
    return "Cancelled" if is_cancelled?
  end


  def css station
    return "list-group-item-info" if self.station == station
    return "disabled" if at
    return "list-group-item-danger" if is_cancelled?
  end


  def form_url service
    if service.station
      return "/journeys/new?journey_leg[departure_station_id]=#{service.station.id}&" +
      "journey_leg[arrival_station_id]=#{station.id}&" +
      "journey_leg[departure_platform]=#{service.platform}&" +
      "journey_leg[arrival_platform]=&" +
      "journey_leg[scheduled_departure]=#{service.std}&" +
      "journey_leg[actual_departure]=#{service.etd}&" +
      "journey_leg[scheduled_arrival]=#{st}&" +
      "journey_leg[actual_arrival]=#{et}&" +
      "journey_leg[operator_id]=#{service.operator.id}&"
    end
  end


end
