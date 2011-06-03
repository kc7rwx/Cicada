class Tile < Image

  def initialize(x,y)
    super
    @draw = Magick::Draw.new
  end

  def rand_color
    color_string = "rgb("+rand(255).to_s+","+rand(255).to_s+","+rand(255).to_s+")"
    color_string
  end

  def random_stuff

    @draw.stroke_width(2)
    @draw.stroke(rand_color)
    @draw.fill(rand_color)
    @draw.opacity(rand)
  end

  def xmass
    def color
      ['red','green','white'].sample
    end

    @draw.stroke_width(2)
    @draw.stroke(color)
    @draw.fill(color)
    @draw.opacity(rand)
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

  def draw_rectangle(size_x,size_y,pos_x,pos_y)
    x1=pos_x-size_x/2
    y1=pos_y-size_x/2
    x2=pos_x+size_x/2
    y2=pos_y+size_y/2
    random_stuff
    @draw.rectangle(x1,y1, x2,y2)
  end

  def draw
    @draw.draw(self)
  end
end

