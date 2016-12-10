# coding: utf-8
require 'dxruby'

require_relative 'player'
require_relative 'player2'
require_relative 'enemy'

Window.width  = 800
Window.height = 600

point1 = 0
point2 = 0
drawpoint = Font.new(32,"メイリオ")
player_img = Image.load("player.png")
player_img.setColorKey([0, 0, 0])

enemy_img = Image.load("enemy.png")
enemy_img.setColorKey([0, 0, 0])

player1 = Player.new(400, 500, player_img)
player2 = Player2.new(200, 500, player_img)

enemies = []
30.times do
  enemies << Enemy.new(rand(800), rand(600), enemy_img)
end



Window.loop do
  break if Input.keyPush?(K_ESCAPE)

  if Input.keyPush?(K_R) #reset
  	point1 = 0
  	point2 = 0
  	enemies.each {|ene| ene.vanish}
  	player1.vanish
  	player1 = Player.new(400, 500, player_img)
  	player2.vanish
  	player2 = Player2.new(200, 500, player_img)
  	30.times do
      enemies << Enemy.new(rand(800), rand(600), enemy_img)
    end
  end

  Window.draw_font(20,20,"player1:#{point1}",drawpoint)
  Window.draw_font(500,20,"player2:#{point2}",drawpoint)
  Sprite.update(enemies)
  Sprite.draw(enemies)

  player1.update
  player1.draw

  player2.update
  player2.draw

  # 当たり判定
  if Sprite.check(player1, enemies)
  	point1 = point1+1
  end

  if Sprite.check(player2, enemies)
  	point2 = point2+1
  end
  

end