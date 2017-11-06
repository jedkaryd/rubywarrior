class Player
  def play_turn(warrior)
    # add your code here

    @rescued_captive

    if @rescued_captive == nil
      if warrior.feel(:backward).empty?
        warrior.walk!(:backward)

      elsif warrior.feel(:backward).captive?
        warrior.rescue!(:backward)
        @rescued_captive = true

      end

    else
      #if the warrior health is not full
      if warrior.feel.empty? && warrior.health < 20
        #if the warrior is on the walk he rests
        if warrior.feel(:backward).wall?
          warrior.rest!

        #the warrior goes backward until he finds the beginning wall
        else
          warrior.walk!(:backward)

        end

      #if the warrior finds a captive
      elsif warrior.feel.captive?
        warrior.rescue!
   
      elsif warrior.feel.enemy?
        warrior.attack!

      else
        warrior.walk!

      end
      @health = warrior.health
    end
  end
end
