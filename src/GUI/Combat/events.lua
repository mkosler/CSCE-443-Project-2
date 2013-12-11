local Class = require 'lib.class'
local event = require( "src.GUI.General.event" )
--local lube = require( "lib.LUBE.LUBE" )


local events = {}

local ATTACK = Class{ __includes = event }

function ATTACK:init( dmg )
    event.init(self,"ATTACK")
    print("Bleck")
    print(dmg)
    self.dmg = dmg
end

function ATTACK:act( State, dt )
    print(self.dmg)
    State.dmg.atk_dmg = self.dmg
    State:update_attack()
    return {}
end

function ATTACK:to_net()
    local msg = {
        name = self.name,
        dmg = self.dmg,
    }
    return msg
end

function ATTACK.from_net( msg )
    return ATTACK(msg.dmg)
end

events.ATTACK = ATTACK

local DEFEND = Class{ __includes = event }

function DEFEND:init( dmg )
    event.init(self,"DEFEND")
    self.dmg = dmg
end

function DEFEND:act( State, dt )
    State.dmg.atk_dmg = self.dmg
    State:update_defend()
    return {}
end

function DEFEND:to_net()
    local msg = {
        name = self.name,
        dmg = self.dmg,
    }
    return msg
end

function DEFEND.from_net( msg )
    return DEFEND(msg.dmg)
end

events.DEFEND = DEFEND

local RETURN_TO_BATTLE = Class{ __includes = event }

function RETURN_TO_BATTLE:init( )
    event.init(self,"RETURN_TO_BATTLE")
end

function RETURN_TO_BATTLE:act( State, dt )
    Gamestate.switch(Battle, false, self.network)
    return {}
end

function RETURN_TO_BATTLE:to_net()
    local msg = {
        name = self.name,
    }
    return msg
end

function RETURN_TO_BATTLE.from_net( msg )
    return RETURN_TO_BATTLE()
end

events.RETURN_TO_BATTLE = RETURN_TO_BATTLE

return events 

