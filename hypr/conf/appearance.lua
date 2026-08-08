hl.config({
    general = {
        gaps_in = 5,
        gaps_out = { top = 0, right = 10, bottom = 10, left = 10 },

        border_size = 1,

        col = {
            active_border = { colors = { 'rgba(FFF9E0aa)', 'rgba(ffffff00)', 'rgba(ffffff00)', 'rgba(FFF9E033)' }, angle = 45 },
            inactive_border = 'rgba(ffffff00)',
        },

        resize_on_border = false,

        allow_tearing = false,

        layout = 'dwindle',
    },

    decoration = {
        rounding = 18,
        rounding_power = 2.5,

        active_opacity = 0.9,
        inactive_opacity = 0.9,

        shadow = {
            enabled = true,
            range = 30,
            render_power = 4,
            color = 'rgba(00000033)',
            offset = { 4, 6 },
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 2,

            new_optimizations = true,
            ignore_opacity = true,

            vibrancy = 0.5,
            vibrancy_darkness = 0.15,
            contrast = 1.2,
            brightness = 1.1,
            noise = 0.02,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.curve('easeOutQuint', { type = 'bezier', points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve('easeInOutCubic', { type = 'bezier', points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve('linear', { type = 'bezier', points = { { 0, 0 }, { 1, 1 } } })
hl.curve('almostLinear', { type = 'bezier', points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve('quick', { type = 'bezier', points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.curve('fluent_decel', { type = 'bezier', points = { { 0.1, 1 }, { 0, 1 } } })
hl.curve('fastBezier', { type = 'bezier', points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.curve('smoothOut', { type = 'bezier', points = { { 0.5, 0 }, { 0.99, 0.99 } } })
hl.curve('expo', { type = 'bezier', points = { { 0.16, 1 }, { 0.3, 1 } } })
hl.curve('overshot', { type = 'bezier', points = { { 0.05, 0.9 }, { 0.1, 1.1 } } })
hl.curve('overshot2', { type = 'bezier', points = { { 0.1, 1.5 }, { 0.5, 0.91 } } })

hl.animation({ leaf = 'global', enabled = true, speed = 10, bezier = 'default' })
hl.animation({ leaf = 'border', enabled = true, speed = 10.39, bezier = 'easeOutQuint' })
-- hl.animation({ leaf = 'windows', enabled = true, speed = 4.79, spring = 'easeOutQuint' })
-- hl.animation({ leaf = 'windowsIn', enabled = true, speed = 4.1, spring = 'easy', style = 'popin 87%' })
-- hl.animation({ leaf = 'windowsOut', enabled = true, speed = 1.49, bezier = 'linear', style = 'popin 87%' })
hl.animation({ leaf = 'fadeIn', enabled = true, speed = 1.73, bezier = 'almostLinear' })
hl.animation({ leaf = 'fadeOut', enabled = true, speed = 1.46, bezier = 'almostLinear' })
hl.animation({ leaf = 'fade', enabled = true, speed = 3.03, bezier = 'quick' })
-- hl.animation({ leaf = 'layers', enabled = true, speed = 3.81, bezier = 'easeOutQuint' })
hl.animation({ leaf = 'layersOut', enabled = true, speed = 1.5, bezier = 'linear', style = 'fade' })
hl.animation({ leaf = 'fadeLayersIn', enabled = true, speed = 1.79, bezier = 'almostLinear' })
hl.animation({ leaf = 'fadeLayersOut', enabled = true, speed = 1.39, bezier = 'almostLinear' })
-- hl.animation({ leaf = 'workspacesIn', enabled = true, speed = 1.21, bezier = 'almostLinear', style = 'fade' })
-- hl.animation({ leaf = 'workspacesOut', enabled = true, speed = 1.94, bezier = 'almostLinear', style = 'fade' })
hl.animation({ leaf = 'zoomFactor', enabled = true, speed = 7, bezier = 'quick' })

hl.animation({ leaf = 'workspaces', enabled = true, speed = 7, bezier = 'overshot2', style = 'slide' })

hl.animation({ leaf = 'specialWorkspaceIn', enabled = true, speed = 7, bezier = 'overshot2', style = 'slidevert' })
hl.animation({ leaf = 'specialWorkspaceOut', enabled = true, speed = 25, bezier = 'overshot2', style = 'slidevert' })

hl.animation({ leaf = 'windows', enabled = true, speed = 7, bezier = 'overshot2', style = 'popin 0%' })
hl.animation({ leaf = 'windowsMove', enabled = true, speed = 5, bezier = 'overshot2' })

hl.animation({ leaf = 'layersIn', enabled = true, speed = 3, bezier = 'overshot2', style = 'slide' })

hl.animation({ leaf = 'borderangle', enabled = true, speed = 100, bezier = 'linear', style = 'loop' })

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = 'master',
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,

        animate_mouse_windowdragging = true,
    },
})
