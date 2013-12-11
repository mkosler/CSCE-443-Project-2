require("lib.json")
function event_factory( possible_events, msg, State )
    local unpacked_msg = json.decode(msg) 
    for event_name, event in pairs( possible_events ) do
        if unpacked_msg.name == event_name then
            return event.from_net( unpacked_msg, State )
        end
    end
end