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
    local attacker_amp = self:get_atk_amp()
    local defender_amp = self:get_def_amp()

    self.dmg = { 
      atk_dmg = self:cal_dmg(self.attacker.attack_value, attacker_amp),
      def_dmg = self:cal_dmg(self.defender.defender_value, defender_amp)
    }

    if self.dmg.atk_dmg > self.defender.hp then 
        self.defender.hp = 0
        self.defender.is_dead = true
    else
        self.defender.hp = self.defender.hp - self.dmg.atk_dmg
    end 

    -- if the defender died 
    if not self.defender.is_dead then 
        if self.dmg.def_dmg > self.attacker.hp then 
            self.attacker.hp = 0
        else
            self.attacker.hp = self.attacker.hp - self.dmg.atk_dmg
        end
    end 
end

function Combat:get_atk_amp()
    return self.attacker.attack_amp[self.defender.name]
end

function Combat:get_def_amp( attacker_id)
    return self.defender.defend_amp[self.attacker.name]
end

function Combat:cal_dmg(value, amp)
    -- consider critical damage
    if math.random() > 0.66 then 
        self.dmg_crit = true
    else 
        self.dmg_crit = false
    end 

    if self.dmg_crit then 
        return value*amp*(1.3 + 0.1 * math.random(1, 4))
    else 
        return value*amp*(0.8 + 0.1 * math.random(1, 4))
    end 
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
