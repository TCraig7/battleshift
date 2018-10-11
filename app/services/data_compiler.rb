class DataCompiler

  def initialize(path)
    @path = path
  end

  def conn
    Faraday.new(url: ENV["path"])
  end

  def getter
    conn.get(@path)
  end

  def patcher(params)
    email = params[:email]
    conn.patch(@path, { 'email': email })
  end

  def parser
    JSON.parse(getter.body, symbolize_names: true)
  end
end
