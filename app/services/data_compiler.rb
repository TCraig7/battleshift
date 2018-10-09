class DataCompiler

  def initialize(path)
    @path = path
  end

  def conn
    Faraday.new(url: ENV["path"]) do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def getter
    conn.get(@path)
  end

  def parser
    JSON.parse(getter.body, symbolize_names: true)
  end
end
