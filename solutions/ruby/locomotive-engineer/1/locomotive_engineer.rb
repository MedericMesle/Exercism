class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagon_ids)
    wagon_ids
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    find_the_locomotive = each_wagons_id.index(1)
    sort_the_wagons = each_wagons_id.rotate(find_the_locomotive)
    [sort_the_wagons.first] + missing_wagons + sort_the_wagons.drop(1)
  end

  def self.add_missing_stops(route, **stops)
    stops_list = stops.values
    route.merge(stops: stops_list)
  end

  def self.extend_route_information(route, more_route_information)
    route.merge(more_route_information)
  end
end
