local Class = require 'lib.class'
local event = require "src.General.event"

EVENT_BUTTON_CLICKED = Class{ __includes = event }

names = {
UI_BUTTON_CLICKED : "UI_BUTTON_CLICKED",
}

function EVENT_BUTTON_CLICKED:init( button )
    Entity.init( self, "UI_BUTTON_CLICKED" )
    self.button = button.text
end

function EVENT_BUTTON_CLICKED:act( State, dt )
    return {}
end