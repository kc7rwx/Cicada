def rand_circle(image_size_x,image_size_y)
  circle_size = image_size_x/10
  circle_pos_x = rand(image_size_x-15)
  circle_pos_y = rand(image_size_y-15)
  circle_size_pos_x = circle_pos_x+rand(image_size_x/25)
  circle_size_pos_y = circle_pos_y+rand(image_size_y/50)

  string = " -fill 'rgb("+rand(255).to_s+", "+rand(255).to_s+", "+rand(255).to_s+")' \ -draw 'circle "+
      circle_pos_x.to_s+  #x pos of circle
      ","+
      circle_pos_y.to_s+  #y pos of circle
      " "+
      circle_size_pos_x.to_s+  #x intersect of circle
      ","+
      circle_size_pos_y.to_s+  #y intersect of circle
      "' \\"
  string
end

def image_create(x,y,i)
  Kernel.system "convert -size "+
    x.to_s+
    "x"+
    y.to_s+
    " xc:none \ "+
    rand_circle(x,y)+
    "images/"+
    i.to_s+
    ".png"
end

def array_create(elements)
  i=0
  elements.times do
	image_create(rand(100)*i+150,rand(100)*i+150,i)
    i += 1
  end
end

array_create(12)
