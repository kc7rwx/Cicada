require 'RMagick'
include Magick
require './tile.rb'
require './tile_set.rb'

def generate_rand1
  t = TileSet.new
  t.create_random(150,5)
  t.each do |tile|
    (rand(15)+1).times do
      tile.random_stuff
      tile.draw_circle(rand(85),rand(tile.columns),rand(tile.rows))
      tile.draw
    end
  end
  t.write_tile_set
end

def generate_rand2
  t = TileSet.new
  t.create_random(200,5)
  t.each do |tile|
    (rand(5)+1).times do
      tile.random_stuff
      tile.draw_circle(rand(55),rand(tile.columns),rand(tile.rows))
      tile.draw
    end
    (rand(2)+1).times do
      tile.random_stuff
      tile.draw_rectangle(rand(85),rand(85),rand(tile.columns),rand(tile.rows))
      tile.draw
    end
  end
  t.write_tile_set
end

def generate_xmass
  t = TileSet.new
  t.create_random(200,5)
  t.each do |tile|
    (rand(5)+1).times do
      tile.xmass
      tile.draw_circle(rand(55),rand(tile.columns),rand(tile.rows))
      tile.draw
    end
    (rand(2)+1).times do
      tile.xmass
      tile.draw_rectangle(rand(85),rand(85),rand(tile.columns),rand(tile.rows))
      tile.draw
    end
  end
  t.write_tile_set
end



def generate_pattern1
  grid_size=100
  t = TileSet.new
  t.create_grid(grid_size,5)
  t.each do |tile|
    tile.random_stuff
    x=tile.columns/grid_size
    y=tile.rows/grid_size
    tile.draw_rectangle(grid_size,grid_size,rand(x)*grid_size,rand(y)*grid_size)
    tile.draw
  end
  t.write_tile_set
end

def build
  t = TileSet.new

  puts 'Input # of Images'
  num_tiles = gets.to_i

  puts 'Input Grid Type'
  puts 'random'
  puts 'pattern'
  grid_type = gets.chomp
  if grid_type == 'random'
    puts 'Input Seed Size'
    seed_size = gets.to_i
    t.create_random(seed_size,num_tiles)
<<<<<<< HEAD
<<<<<<< HEAD
  elsif grid_type == 'pattern'
=======
elsif grid_type == 'pattern'
>>>>>>> origin/master
=======
elsif grid_type == 'pattern'
>>>>>>> origin/master
    puts 'Input Grid Size'
    grid_size = gets.to_i
    t.create_grid(grid_size,num_tiles)
  else
    puts 'invalid'
  end


  puts 'Input Color'
  puts 'random'
  puts 'xmass'
  color = gets.chomp


  t.each do |tile|
    (rand(15)+1).times do
      if color == 'random'
        tile.random_stuff
      elsif color == 'xmass'
        tile.xmass
      end
<<<<<<< HEAD
<<<<<<< HEAD
      puts 'circle size'
      size = gets.to_i
      tile.draw_circle(rand(seed_size),rand(tile.columns),rand(tile.rows))
=======
      tile.draw_circle(rand(85),rand(tile.columns),rand(tile.rows))
>>>>>>> origin/master
=======
      tile.draw_circle(rand(85),rand(tile.columns),rand(tile.rows))
>>>>>>> origin/master
      tile.draw
    end
  end
  t.write_tile_set
end

