-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/ for more
-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/ for workspace rules

-- Example windowrule
-- hl.window_rule({ match = { class = '^(kitty)$' }, float = true })
-- hl.window_rule({ match = { class = '^(org.telegram.desktop)$' }, float = true, size = '1000 600', center = true })

-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({
    match = { class = '.*' },
    suppress_event = 'maximize',
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    match = {
        class = '^$',
        title = '^$',
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

hl.window_rule({
    match = { title = 'Картинка в картинке' },
    float = true,
    size = '400 225',
    move = '1492 827',
})

hl.window_rule({
    match = { class = '^(org.telegram.desktop)$' },
    pseudo = true,
    size = '450 800',
})

hl.window_rule({
    match = { class = '^(com.ayugram.desktop)$' },
    float = true,
    size = '935 600',
    center = true,
})

hl.window_rule({
    match = { class = '(clipse)' },
    float = true,
    center = true,
    size = '622 470',
    stay_focused = true,
})

-- Reduced opacity for these apps
local dimmedClasses = {
    '^(org.gnome.Nautilus)$',
    '^(Spotify)$',
    '^(yandex-music)$',
    '^(com.obsproject.Studio)$',
}
for _, class in ipairs(dimmedClasses) do
    hl.window_rule({
        match = { class = class },
        opacity = '0.7 override',
    })
end

-- Full opacity for these apps
local fullOpacityClasses = {
    '^(kitty)$',
    '^(zen)$',
    '^(dev.zed.Zed)$',
    '^(org.telegram.desktop)$',
}
for _, class in ipairs(fullOpacityClasses) do
    hl.window_rule({
        match = { class = class },
        opacity = '1.0 override',
    })
end

hl.window_rule({
    match = { class = '^(com.gabm.satty)$' },
    float = true,
    min_size = '700 350',
})

hl.window_rule({
    match = { class = '^(Waydroid)$' },
    pseudo = true,
    workspace = '1',
    size = '438 1022',
})

-- hl.window_rule({ match = { class = '^(wttr.in)$' }, workspace = 'special:magic' })
hl.window_rule({
    match = { class = '^(wttr.in)$' },
    float = true,
    size = '1284 950',
    center = true,
})

hl.window_rule({
    match = { class = '^(wttr.in0)$' },
    float = true,
    size = '310 170',
})

hl.window_rule({
    match = { class = '^(qalc)$' },
    float = true,
    size = '600 230',
    -- center = true,
})

hl.window_rule({
    match = { class = '^(Spotify)$' },
    workspace = 'special:magic',
})

-- Some things in Wayland are not windows, but layers - app launchers, status bars, wallpapers, etc.
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/#layer-rules

hl.layer_rule({
    match = { namespace = 'logout_dialog' },
    blur = true,
    above_lock = 2,
})

hl.layer_rule({
    match = { namespace = 'wofi' },
    blur = true,
    ignore_alpha = 0,
})

hl.layer_rule({
    match = { namespace = 'waybar' },
    blur_popups = true,
    ignore_alpha = 0,
})

hl.layer_rule({
    match = { namespace = 'notifications' },
    blur = true,
    ignore_alpha = 0,
})