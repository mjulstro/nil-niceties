# A quick and dirty helper to make Ruby classes with
# a fixed set of named attrs, but no logic:

class Model < Struct
  def initialize(attrs)
    attrs.each do |k,v|
      send "#{k}=", v
    end
  end
end

# Simple model classes

User = Model.new(
  :name,
  :avatar,
)

StyledImage = Model.new(
  :image,
  :style,
)

Style = Model.new(
  :background_color,
  :foreground_color,
)

class Image
  # pretend this contains real image data
end
