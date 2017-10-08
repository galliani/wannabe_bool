module WannabeBool::String
  TRUES  = %W{t true on y yes 1}.freeze
  FALSES = %W{f false off n no 0}.freeze

  def to_b
    value = self.strip.downcase
    return true  if TRUES.include?(value)
    return false if FALSES.include?(value)

    WannabeBool.invalid_value_behaviour.call
  end

  alias_method 'to_boolean', 'to_b'
  alias_method 'to_bool', 'to_b'  
end

class String
  include WannabeBool::String
end
