class ApplicationSerializer
  include FastJsonapi::ObjectSerializer

  def to_h
    data = to_hash[:data]
    return data[:attributes] unless data.is_a?(Array)
    data.map { |dat| dat[:attributes] }
  end
end