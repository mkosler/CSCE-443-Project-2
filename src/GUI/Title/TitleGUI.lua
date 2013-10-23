local TitleGUI = {}

TitleGUI.skin_name = "default"
TitleGUI.skin = loveframes.skins.Get("default")
TitleGUI.font = love.graphics.newFont("assets/GUI/Fonts/Terminus.ttf", 40 )
TitleGUI.title_font = love.graphics.newFont("assets/GUI/Fonts/Terminus.ttf", 100 )
TitleGUI.menu_buttons = { "Start Local Game", "Quit" }
TitleGUI.menu_button_callbacks = { function ( object, x, y ) object.cb_state._start_local_game = true end, function ( object, x, y ) object.cb_state._quit = true end }
TitleGUI.text_color = { 0, 192, 0, 255 }

function TitleGUI.createTitleGUI( Title_State )
    local master = create_panel( conf.screen.width, conf.screen.height, TitleGUI.skin_name )
    master:SetPos( 0 , 0 )
    master:SetState("Title")
    Title_State.master = master
    TitleGUI.create_title_display( Title_State )
    TitleGUI.create_menu( Title_State )
end

function TitleGUI.create_title_display( Title_State )
    local title_display = create_panel( conf.screen.width, conf.screen.height/3, TitleGUI.skin_name )
    title_display:SetParent( Title_State.master )
    title_display:SetPos( 0, 0 )
    
    local title_box = create_panel( title_display.width*4/5, title_display.height*2/3, TitleGUI.skin_name )
    title_box:SetParent( title_display )
    title_box:Center()
    local title_text = create_text( {TitleGUI.text_color, "S I G I N T"}, nil, nil, nil, nil, TitleGUI.skin_name )
    title_text:SetFont( TitleGUI.title_font )
    title_text:SetParent( title_box )
    title_text:Center()
    
    Title_State.title_display = title_display
    Title_State.title_box = title_box
    Title_State.title_text = title_text
end

function TitleGUI.create_menu( Title_State )
    local menu_display = create_panel( conf.screen.width, conf.screen.height-conf.screen.height/3, TitleGUI.skin_name )
    menu_display:SetParent( Title_State.master )
    menu_display:SetPos( 0, conf.screen.height/3 )
    
    local list_box = create_panel( menu_display.width, menu_display.height*4/5, TitleGUI.skin_name )
    list_box:SetParent( menu_display )
    list_box:Center()
    local button_list = create_button_list( TitleGUI.make_menu_buttons( Title_State, list_box:GetWidth() ), TitleGUI.skin_name )
    button_list:SetParent( list_box )
    button_list:SetWidth( list_box:GetWidth() )
    button_list:Center()
    
    Title_State.menu_display = menu_display
    Title_State.menu_list_box = list_box
    Title_State.menu_button_list = button_list
end
    
function TitleGUI.make_menu_buttons( Title_State, width )
    local buttons = {}
    for i, button_text in ipairs(TitleGUI.menu_buttons) do
        local button = create_text_button( button_text, nil, nil, nil, nil, TitleGUI.skin_name )
        button.OnClick = TitleGUI.menu_button_callbacks[i]
        button.cb_state = Title_State
        button:SetWidth( width )
        button:SetHeight( 50 )
        --button:SetFont( TitleGUI.font )
        table.insert( buttons, button )
    end
    return buttons
end

function TitleGUI.quit( object, x, y )
    print "clicked"
    object.cb_state._quit = true
end

function TitleGUI.start_local_game( object, x, y )
    print "clicked"
    object.cb_state._start_local_game = true
end

return TitleGUI