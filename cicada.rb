require 'RMagick'
include Magick

class Tile < Image

  def rand_size
    self.resize(rand(1000),rand(1000))
  end



  def rand_circle(size)
    #randomize color
    color_string = "rgb("+rand(255).to_s+","+rand(255).to_s+","+rand(255).to_s+")"
    #randomize circle size
    c_size = rand(size)
    #position of circle
    c_pos_x = rand(100)
    c_pos_y = rand(100)
    #size of circle
    c_size_pos_x = c_pos_x + c_size
    c_size_pos_y = c_pos_y + c_size

    d = Magick::Draw.new
    
    
    # Draw the circle
    d.fill_opacity(0)
    d.stroke(color_string).stroke_width(3)
    d.circle(c_pos_x, c_pos_y, c_size_pos_x, c_size_pos_y)
    d.draw(self)
  end

end


