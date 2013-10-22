local Combat = {}

function Combat:init()
end

function Combat:enter(previous, attacker, defender)
    self.attacker = attacker
    self.defender = defender

    -- Perform combat calculations inside the enter function
    self:update_hp()
end

function Combat:update_hp()
    self.dmg = { 
      atk_dmg = cal_dmg(attacker.attack_value, attacker_amp),
      def_dmg = cal_dmg(defender.defender_value, defender_amp)
    }

    if self.dmg.atk_dmg > self.defender.hp then 
        self.defender.hp = 0
        self.defender.died = true
    else
        self.defender.hp = self.defender.hp - self.dmg.atk_dmg
    end 

    -- if the defender died 
    if not self.defender.died then 
        if self.dmg.def_dmg > self.attacker.hp then 
            self.attacker.hp = 0
        else
            self.attacker.hp = self.attacker.hp - self.dmg.atk_dmg
        end
    end 
end

function Combat:cal_dmg(value, amp)
    return value*amp
end 

function Combat:leave()
end

function Combat:update(dt)
end

function Combat:draw()
end

function Combat:focus()
end

function Combat:keypressed(key, code)
end

function Combat:keyreleased(key, code)
end

function Combat:mousepressed(x, y, button)
end

function Combat:quit()
end

return Combat
