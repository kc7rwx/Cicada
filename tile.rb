class Tile < Image


  def initialize(x,y)
    super
    @draw = Magick::Draw.new
  end

  def draw_circle(radius,pos_x,pos_y)

    #position of circle
    #nudges position if it will be off of the frame
    border = 2
    if pos_x <= radius
      pos_x = radius+border
    elsif pos_x+radius >= self.columns
      pos_x = self.columns-radius-border
    else
    end
    if pos_y <= radius
      pos_y = radius+border
    elsif pos_y+radius >= self.rows
      pos_y = self.rows-radius-border
    else
    end

    @draw.circle(pos_x, pos_y, pos_x-radius , pos_y)
  end

  def draw_rectangle(size_x,size_y,center_x,center_y)
    @draw.fill(rand_color)
    point_1_x = center_x-size_x/2
    point_1_y = center_y-size_y/2
    point_2_x = center_x+size_x/2
    point_2_y = center_y+size_y/2
    @draw.rectangle(point_1_x,point_1_y, point_2_x,point_2_y)
  end

  def draw
    @draw.draw(self)
  end
end

