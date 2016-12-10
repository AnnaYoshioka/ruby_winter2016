# coding: utf-8

class Enemy < Sprite
  def update
    self.y += 1
    self.x += Math.sin(self.x)*5
    if self.y >= Window.height - self.image.height
      self.visible = false
      self.x, self.y = rand(800),20
      self.visible = true
    end
  end
  # 他のオブジェクトから衝突された際に呼ばれるメソッド
  def hit(obj)
    self.vanish
  end
end