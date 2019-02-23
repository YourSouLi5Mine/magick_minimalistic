module Option
  def self.gravity(type)
    "-gravity #{type} "
  end

  def self.crop(geometry)
    "-crop #{geometry} "
  end

  def self.resize(geometry)
    "-resize #{geometry} "
  end
end


