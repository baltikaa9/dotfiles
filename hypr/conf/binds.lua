local programs = require("conf/programs")

local mainMod = 'SUPER'

hl.bind(mainMod .. ' + Return', hl.dsp.exec_cmd(programs.terminal))
hl.bind(mainMod .. ' + Z', hl.dsp.exec_cmd(programs.terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(programs.fileManager))
hl.bind('XF86Explorer', hl.dsp.exec_cmd(programs.fileManager))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + ALT + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(programs.menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move window
hl.bind(mainMod .. " + ALT + left", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + ALT + up", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + ALT + down", hl.dsp.window.swap({ direction = "down" }))

-- Resize window
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize({ x = -60, y = 0 }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 60, y = 0 }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -60 }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 60 }))

-- Switch workspaces with mainMod + [0-9
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

hl.bind(mainMod .. '+ CTRL + right', hl.dsp.focus({ workspace = 'm+1' }))
hl.bind(mainMod .. '+ CTRL + left', hl.dsp.focus({ workspace = 'm-1' }))
hl.bind(mainMod .. '+ CTRL + up', hl.dsp.focus({ workspace = 'm-1' }))
hl.bind(mainMod .. '+ CTRL + down', hl.dsp.focus({ workspace = 'm+1' }))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + CTRL + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("~/.config/bin/brightnessctl-all.sh set +10%"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.config/bin/brightnessctl-all.sh set 10%-"),
    { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Snow
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd('hyprsnow'))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd('killall hyprsnow'))

-- Clipboard
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd('kitty --class clipse clipse && wtype -M ctrl v -m ctrl'))

-- Waybar
hl.bind(mainMod .. " + SHIFT + W", function()
    hl.dispatch(hl.dsp.exec_cmd("pkill waybar; pkill cava; waybar"))
end)

hl.bind(mainMod .. ' + Tab', function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.bring_to_top())
end)

-- Other
hl.bind('Print', hl.dsp.exec_cmd('GRIMBLAST_EDITOR="satty --filename" SLURP_ARGS="-w 0" grimblast edit area'))
hl.bind('SHIFT + Print',
    hl.dsp.exec_cmd('GRIMBLAST_EDITOR="satty --filename" SLURP_ARGS="-w 0" grimblast --freeze edit area'))
hl.bind(mainMod .. '+ L', hl.dsp.exec_cmd('loginctl lock-session'))
hl.bind(mainMod .. ' + F4', hl.dsp.exec_cmd('wlogout -b 2'))
hl.bind(mainMod .. ' + F12', hl.dsp.exec_cmd('kitty --class qalc qalc'))
hl.bind('XF86Calculator', hl.dsp.exec_cmd('kitty --class qalc qalc'))
hl.bind(mainMod .. ' + F11', hl.dsp.exec_cmd('hyprpicker -a'))
hl.bind(mainMod .. ' + ALT + F9', hl.dsp.exec_cmd('~/.config/bin/wfrec-toggle.sh'))
hl.bind(mainMod .. ' + code:60', hl.dsp.exec_cmd('rofimoji'))
hl.bind(mainMod .. ' + B', hl.dsp.exec_cmd(programs.browser))
hl.bind(mainMod .. ' + T', hl.dsp.exec_cmd('Telegram || flatpak run org.telegram.desktop'))
-- hl.bind(mainMod .. ' + Tab', hl.dsp.exec_cmd('~/.config/bin/window_switcher.sh'))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd('AmneziaVPN'))
hl.bind('CTRL + SHIFT + Escape', hl.dsp.exec_cmd('kitty --class btop btop'))
