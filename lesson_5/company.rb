module CompanyName
  def company(name)
    self.company_name = name
  end

  def company_info
    self.company_name
  end

  private
  attr_accessor :company_name
end