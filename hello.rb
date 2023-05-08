puts "じゃんけん..."

class Janken
  attr_accessor :program_hand, :player_hand
  
  def initialize(program_hand, player_hand)
    @program_hand = program_hand
    @player_hand = player_hand
  end
  
  def janken
    puts "0(グー)1(チョキ)2(パー)3(放棄)"
    @player_hand = gets.to_i 
    @program_hand = rand(3)

    if player_hand == 3
      puts "^じゃんけんが放棄されました。ゲームを終了します^。"
      puts "-----------------------------"
      exit
    end

    jankens = ["グー", "チョキ", "パー"]
    puts "ホイ!"
    puts "----------------------------"
    puts "あなた: #{jankens[@player_hand]}を出しました"
    puts "相手: #{jankens[@program_hand]}を出しました"
    
    if @program_hand == @player_hand
      puts "--あいこで--"
      return true
    
    elsif @player_hand == 0 && @program_hand == 1 ||
      @player_hand == 1 && @program_hand == 2 ||
      @player_hand == 2 && @program_hand == 0
      puts "--あなたの勝ち--"
      @winner = "player"
      acchimuite_hoi
    
    elsif @program_hand == 0 && @player_hand == 1 ||
      @program_hand == 1 && @player_hand == 2 ||
      @program_hand == 2 && @player_hand == 0
      puts "--あなたの負け--"
      @winner = "program"
      acchimuite_hoi  
    else
      puts "^放棄されました。終了します^。"
      exit
    end
  end

  def acchimuite_hoi
    puts "あっち向いて〜"
    puts "0(上) 1(下) 2(左) 3(右)"
    @player_hand = gets.to_i
    @program_hand = rand(4)
    
    directions = ["上", "下", "左", "右"]
    puts "ホイ!"
    puts "-----------------------------"
    puts "あなた: #{directions[@player_hand]}"
    puts "相手: #{directions[@program_hand]}"
    
    if @player_hand == @program_hand && @winner == "program"
      puts "--あなたの負け--"
      return false
    
    elsif @player_hand == @program_hand && @winner == "player"
      puts "--あなたの勝ち--"
      return false
    
    else
      puts "じゃんけん・・・"
      janken
    end
  end
end

next_game = true
while next_game
  game = Janken.new(@player_hand, @program_hand)
  next_game = game.janken
end