require 'RMagick'
include Magick

class Tile < Image
  def draw_circle(radius,pos_x,pos_y)
    #position of circle
    c_pos_x = rand(self.columns-(radius*2+10))+radius+5
    c_pos_y = rand(self.rows-(radius*2+10))+radius+5
    #size of circle
    c_size_pos_x = c_pos_x + c_size
    c_size_pos_y = c_pos_y + c_size
  end

  
  def rand_size
    self.resize(rand(1000),rand(1000))
  end

  def draw_star
    d = Magick::Draw.new
    500.times do
      d.fill_opacity(rand).fill('white')
      d.point(rand(self.columns),rand(self.rows))
    end
    d.draw(self)
    puts d.inspect
  end

  def rand_circle(size)
    #randomize color
    color_string = 'rgb('+rand(255).to_s+','+rand(255).to_s+','+rand(255).to_s+')'
    #randomize circle size
    c_size = rand(size)
    #position of circle
    c_pos_x = rand(self.columns-(c_size*2+10))+c_size+5
    c_pos_y = rand(self.rows-(c_size*2+10))+c_size+5
    #size of circle
    c_size_pos_x = c_pos_x + c_size
    c_size_pos_y = c_pos_y + c_size

    d = Magick::Draw.new
    
    # Draw the circle
    d.fill_opacity(0)
    d.stroke(color_string).stroke_width(1)
    d.circle(c_pos_x, c_pos_y, c_size_pos_x, c_size_pos_y)
    d.draw(self)
  end

end

def rand1()
  i=1
  11.times do
    image = Tile.new(rand(200*i)+250,rand(200*i)+250) {self.background_color='none'}
    100.times do
      image.rand_circle(25)
    end
    image.write('images/'+i.to_s+'.png')
    i += 1
  end
end



def starfield()
  i=1
  11.times do
    image = Tile.new(rand(200*i)+250,rand(200*i)+250) {self.background_color='none'}
    image.draw_star()
    image.write('images/'+i.to_s+'.png')
    i += 1
  end
end
