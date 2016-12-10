# coding: utf-8

class Player < Sprite
  def update
  	if Input.keyDown?( K_A )
      self.x += Input.x*10
      self.y += Input.y*10
    else
      self.x += Input.x
      self.y += Input.y
    end
  end
end