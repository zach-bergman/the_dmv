class FacilityFactory

    def create_facilities(facility_data)
        facility_data.map do |facility|
            if facility[:state] == 'CO'
                facility_details = {
                    name: facility[:dmv_office],
                    address: format_co_address(facility[:address_li], facility[:address__1], 
                    facility[:city], facility[:state], facility[:zip]),
                    phone: facility[:phone]
                }
                Facility.new(facility_details)
            elsif facility[:state] == 'NY'
                facility_details = {
                    name: facility[:office_name],
                    address: format_ny_address(facility[:street_address_line_1], 
                    facility[:city], facility[:state], facility[:zip_code]),
                    phone: facility[:public_phone_number]
                }
                Facility.new(facility_details)
            end
        end
    end

    def format_co_address(address_1, address_2, city, state, zip)
        "#{address_1} #{address_2} #{city} #{state} #{zip}"
    end

    def format_ny_address(address, city, state, zip)
        "#{address} #{city} #{state} #{zip}"
    end
end