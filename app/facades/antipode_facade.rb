class AntipodeFacade
  attr_reader :new_lat, :new_long

  def initialize(lat, long)
    @_lat = lat
    @_long = long
    antipode_attributes
  end

  def antipode_attributes
    @new_lat = antipode_data[:data][:attributes][:lat]
    @new_long = antipode_data[:data][:attributes][:long]
  end

  def antipode_data
    @antipode_data ||= service.fetch_antipode(lat, long)
  end

  def service
    AmypodeService.new
  end

  private
    def lat
      @_lat
    end

    def long
      @_long
    end

end
