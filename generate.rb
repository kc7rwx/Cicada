require 'RMagick'
include Magick


def create_layer(x,y,name)
  imgl = Magick::ImageList.new
  imgl.new_image(x,y) {self.background_color = "none"}
  3.times do
    rand_circle(x,y).draw(imgl)
    imgl = imgl.wave(rand(4),rand(50)+2)
  end
  imgl.write("images/"+name.to_s+".png")
end



def rand_circle(x,y)
  c_size = rand(20)
  c_pos_x = rand(x)
  c_pos_y = rand(y)
  c_size_pos_x = c_pos_x + c_size
  c_size_pos_y = c_pos_y + c_size
  color_string = "rgb("+rand(255).to_s+","+rand(255).to_s+","+rand(255).to_s+")"
  gc = Magick::Draw.new

  # Draw the circle
  gc.fill_opacity(0)
  gc.stroke(color_string).stroke_width(3)
  gc.circle(c_pos_x, c_pos_y, c_size_pos_x, c_size_pos_y)
  gc
end

i=0
11.times do
  create_layer(rand(1000)+100,rand(2000)+100,i)
  i += 1
end
