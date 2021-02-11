module CitiesHelper
    def inhabitants(city)
        User.where(city_id:city.id)
    end
end
