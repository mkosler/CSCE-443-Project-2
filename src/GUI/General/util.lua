
function if_not_nil_set( var, set_func, object )
    if var ~= nil then
        set_func( object, var )
    end
    return (var ~= nil)
end

function get_skin( skin_name )
    return loveframes.skins.Get( skin_name )
end

function create_frame( height, width, skin_name )
    local frame = loveframes.Create("frame")
    frame:SetSize( height, width )
    if_not_nil_set( skin_name, frame.SetSkin, frame )
    return frame
end

function create_panel( height, width, skin_name )
    local panel = loveframes.Create("panel")
    panel:SetSize( height, width )
    if_not_nil_set( skin_name, panel.SetSkin, panel )
    return panel
end

function create_button_list( buttons, skin_name )
    local list = loveframes.Create( "list" )
    if_not_nil_set( skin_name, list.SetSkin, list )
    for i, button in ipairs(buttons) do
        list:AddItem( button )
    end
    return list
end

function create_text_button( text, x, y, width, height, skin_name )
    local button = loveframes.Create( "button" )
    button:SetText( text )
    if_not_nil_set( x, button.SetX, button )
    if_not_nil_set( y, button.SetY, button )
    if_not_nil_set( width, button.SetWidth, button )
    if_not_nil_set( height, button.SetHeight, button )
    if_not_nil_set( skin_name, button.SetSkin, button )
    return button
end

function create_text( str, x, y, width, height, skin_name )
    local text = loveframes.Create("text")
    text:SetText( str )
    if_not_nil_set( x, text.SetX, text )
    if_not_nil_set( y, text.SetY, text )
    if_not_nil_set( width, text.SetWidth, text )
    if_not_nil_set( height, text.SetHeight, text )
    if_not_nil_set( skin_name, text.SetSkin, text )
    return text
end