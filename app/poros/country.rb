class Country
  attr_reader :name,
              :capital

  def initialize(data)
    @name = data[:name][:common]
    @capital = data[:capital].first
  end
end
