module Validation
  def validate(name, type, args = nil)
    @validations = { name: name, type: type, args: args }
  end

  def validate!
    case @validations[:type]
    when :presence
      raise 'Value must to be presence' if @validations[:name].nil?
      raise "Value can't be empty" if @validations[:name] == ''
    when :format
      raise 'Invalid format' if @validations[:name] !~ @validations[:args]
    when :type
      raise 'Invalid type' if @validations[:name].class != @validations[:args]
    end
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end
end
