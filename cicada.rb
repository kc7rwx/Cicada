require 'RMagick'
include Magick

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

  def draw_rectangle(center,size_x,size_y)

    point_1_x = center-size_x
    point_1_y = center-size_y
    point_2_x = center+size_x
    point_2_y = center+size_y
    @draw.rectangle(point_1_x,point_1_y, point_2_x,point_2_y)
  end

  def draw
    @draw.draw(self)
  end
end


class TileSet < Array

  def create_random(seed_size,num_tiles)
    i=0
    num_tiles.times do
      self[i] = Tile.new(rand(seed_size*(i+1))+50,rand(seed_size*(i+1))+50) {self.background_color='none'}
      i += 1
    end
  end

  def create_grid(grid_size,num_tiles)
  end

  def write_tile_set
    i=0
    self.each do |image|
      image.write('images/'+i.to_s+'.png')
    i += 1
    end
  end

end

def generate_rand1
  t = TileSet.new
  t.create_random(250,10)
  t.each do |tile|
    tile.draw_rectangle(rand(25),rand(25),rand(25))
    rand(10).times do
      tile.draw_circle(rand(10),rand(tile.columns),rand(tile.rows))
    end
    tile.draw
  end
  t.write_tile_set
end


generate_rand1

