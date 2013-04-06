class Input
  include ActiveModel::Conversion
  include ActiveModel::Validations
  extend ActiveModel::Naming

  attr_accessor :regex
  attr_accessor :replace
  attr_accessor :input_text
 
  def persisted?
    false
  end
  
end
