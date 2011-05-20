require 'RMagick'
require 'colorize'
include Magick

class Tile < Image

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
    puts @draw.inspect
  end

  def draw_star
    @draw = Magick::Draw.new
    rand(100).times do
      @draw.opacity(rand).fill('white')
      draw_circle(rand(3),rand(self.columns),rand(self.rows))
    end
    @draw.draw(self)
  end

  def rand_circle(size)
    #randomize color
    color_string = 'rgb('+rand(255).to_s+','+rand(255).to_s+','+rand(255).to_s+')'

    @draw = Magick::Draw.new
    
    # Draw the circle
    @draw.fill_opacity(0)
    @draw.stroke(color_string).stroke_width(1)
    15.times do
      draw_circle(rand(size),rand(self.columns),rand(self.rows))
    end
    @draw.draw(self)
  end

end

def rand1()
  i=1
  11.times do
    image = Tile.new(rand(200*i)+250,rand(200*i)+250) {self.background_color='none'}
    image.rand_circle(50)
    image.write('images/'+i.to_s+'.png')
    puts 'image '+ i.to_s + ' written'
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

starfield
