class Facility
  attr_reader :name, 
              :address, 
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      @registered_vehicles << vehicle
      collect_fees(vehicle)
      set_plate_type(vehicle) #vehicle.set_plate_type
      set_registration_date(vehicle)#vehicle.set_registration_date
    end
  end

  def collect_fees(vehicle)
    if vehicle.antique?
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      @collected_fees += 200
    else
      @collected_fees += 100
    end
  end

  def set_plate_type(vehicle) #move to vehicle class - responsibilty of Vehicle object to change its own attributes
    if vehicle.antique?
      vehicle.plate_type = :antique
    elsif vehicle.electric_vehicle?
      vehicle.plate_type = :ev
    else
      vehicle.plate_type = :regular
    end
  end

  def set_registration_date(vehicle) #move to vehicle class - responsibilty of Vehicle object to change its own attributes
    vehicle.registration_date = Date.today
  end
end
