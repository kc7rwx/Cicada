require 'RMagick'
require './tile.rb'
require './tile_set.rb'
include Magick

def rand_color
  color_string = "rgb("+rand(255).to_s+","+rand(255).to_s+","+rand(255).to_s+")"
  color_string
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

def generate_pattern1
  t = TileSet.new
  t.create_grid(50,10)
  t.each do |tile|
    100.times do
      tile.draw_rectangle(4,4,rand(tile.columns),rand(tile.rows))
    end
      tile.draw
  end
  t.write_tile_set
end

generate_pattern1

