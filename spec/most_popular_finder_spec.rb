require 'spec_helper'

RSpec.describe MostPopularFinder do
    before(:each) do
        @most_popular_finder = MostPopularFinder.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    end

    describe '#initialize' do
        it 'exists' do
            expect(@most_popular_finder).to be_an_instance_of(MostPopularFinder)
        end

        it 'has a factory' do
            expect(@most_popular_finder.factory).to be_an_instance_of(VehicleFactory)
        end
    end

    it 'loads data for WA EV registrations' do
        expect(@wa_ev_registrations).to be_an_instance_of(Array)
    end

    describe '#most_popular_vehicle_registered' do
        it 'returns most popular vehicle for WA EV registrations' do
            expect(@most_popular_finder.most_popular_vehicle_registered(@wa_ev_registrations)).to be_a(String)
            expect(@most_popular_finder.most_popular_vehicle_registered(@wa_ev_registrations)).to eq('NISSAN Leaf')
        end
    end

    describe '#most_popular_model_year_registered' do
        it 'returns count of most popular model year registered' do
            expect(@most_popular_finder.most_popular_model_year_registered(@wa_ev_registrations)).to be_a String
            expect(@most_popular_finder.most_popular_model_year_registered(@wa_ev_registrations)).to eq('2023 with 131 registrations')
        end
    end

    describe '#most_popular_county_registered' do
        it 'returns most popular county for WA EV registrations' do
            expect(@most_popular_finder.most_popular_county_registered(@wa_ev_registrations)).to be_a String
            expect(@most_popular_finder.most_popular_county_registered(@wa_ev_registrations)).to eq('King county with 774 registrations')
        end
    end
end