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
    c_pos_x = rand(self.columns)+
    c_pos_y = rand(self.rows)
    #size of circle
    c_size_pos_x = c_pos_x + c_size
    c_size_pos_y = c_pos_y + c_size

    d = Magick::Draw.new
    
    
    # Draw the circle
    d.fill_opacity(0)
    d.stroke(color_string).stroke_width(rand(3))
    d.circle(c_pos_x, c_pos_y, c_size_pos_x, c_size_pos_y)
    d.draw(self)
  end

end

def rand1()
  i=0
  10.times do
    image = Tile.new(rand(1000)+50,rand(1000)+50) {self.background_color="none"}
    100.times do
      image.rand_circle(5)
    end
    image.write("images/"+i.to_s+".png")
    i += 1
  end
end
