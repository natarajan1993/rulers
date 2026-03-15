class Object
  def self.const_missing(c)
    require Rulers.to_underscore(c.to_s) # Use our to_underscore method to convert this to a snake case string
    Object.const_get(c) # Then call const_get to get the actual file
  end
end