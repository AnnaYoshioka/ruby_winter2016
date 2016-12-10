# coding: utf-8

class Player2 < Sprite
  def update
    self.x += 1 if Input.keyDown?(K_J) 
    self.y -= 1 if Input.keyDown?(K_H) 
    self.x -= 1 if Input.keyDown?(K_F) 
    self.y += 1 if Input.keyDown?(K_G) 
  end
end