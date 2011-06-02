class TileSet < Array

  def create_random(seed_size,num_tiles)
    i=0
    num_tiles.times do
      self[i] = Tile.new(rand(seed_size*(i+1))+150,rand(seed_size*(i+1))+150) {self.background_color='none'}
      i += 1
    end
  end

  def create_grid(grid_size,num_tiles)
    i=0
    num_tiles.times do
      self[i] = Tile.new((i+1)*grid_size,(i+1)*grid_size) {self.background_color='none'}
      i += 1
    end
  end

  def write_tile_set
    i=0
    self.each do |image|
      image.write('images/'+i.to_s+'.png')
    i += 1
    end
  end

end

