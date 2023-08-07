class Country
  attr_reader :name,
              :capital

  def initialize(data)
    @name = data[0][:name][:common]
    @capital = data[0][:capital].first
  end
end
