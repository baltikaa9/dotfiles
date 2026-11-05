hl.config({
    general = {
        gaps_in = 4,
        gaps_out = { top = 0, right = 10, bottom = 10, left = 10 },

        border_size = 0,

        col = {
            active_border = { colors = { 'rgba(FFF9E0aa)', 'rgba(ffffff00)', 'rgba(ffffff00)', 'rgba(FFF9E033)' }, angle = 45 },
            inactive_border = 'rgba(ffffff00)',
        },

        resize_on_border = false,

        allow_tearing = false,

        layout = 'dwindle',
        -- layout = 'scrolling',
    },

    decoration = {
        rounding = 26,
        rounding_power = 4,

        active_opacity = 0.9,
        inactive_opacity = 0.9,

        -- shadow = {
        --     enabled = false,
        --     range = 30,
        --     render_power = 4,
        --     color = 'rgba(00000033)',
        --     offset = { 2, 2 },
        -- },

        shadow = {
            enabled = false,
            range = 0,
            render_power = 3,
            -- hyprglass сам включает тени; прозрачный цвет убирает тёмный контур вокруг окон
            color = 0x00000000,
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 2,

            new_optimizations = true,
            ignore_opacity = true,

            vibrancy = 0.1696,
            vibrancy_darkness = 0.15,
            contrast = 1.2,
            brightness = 1.3,
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
        disable_hyprland_logo = true,

        animate_mouse_windowdragging = true,
    },
})

if hl.plugin.hyprglass then
    local hg = hl.plugin.hyprglass

    hg.config({
        default_theme = "dark",
        default_preset = "pomme",

        layers = { enabled = true, preset = "layers" },

        focus_light = 0.4,
        focus_light_color = 0xFFF9E0ff,
    })

    -- Окна: pomme с размытием послабее (во встроенном 1.0)
    hg.preset("pomme", {
        blur_strength = 0.4,
        chromatic_aberration = 0.2,  -- радужная кайма на краях (во встроенном pomme 0)
        dark = { brightness = 0.9 }, -- во встроенном pomme 1.1
    })

    -- Слои (noctalia): pomme без тёмной тонировки и с ослабленным преломлением —
    -- сильное преломление на мелких капсулах затягивает в край тёмный контур
    hg.preset("layers", {
        inherits = "pomme",
        refraction_strength = 0.5,
        -- свечение слабее, чем у окон (pomme: 0.4 / 0.5 / 0.1)
        specular_strength = 0.2,
        bevel_strength = 0.25,
        fresnel_strength = 0.05,
        dark = {
            tint_color = 0x00000000,
            brightness = 1.0,
            adaptive_dim = 0.0,
        },
    })

    -- Слои noctalia, на которых есть стекло (имена: hyprctl layers)
    for _, ns in ipairs({
        "noctalia-bar-default",
        "noctalia-notification",
        "noctalia-osd",
        "noctalia-panel",
        "noctalia-attached-panel",
        "noctalia-dock",
        "noctalia-window-switcher",
    }) do
        hg.layer(ns, { mask_threshold = 0.05 })
    end

    -- Центр управления, лаунчер, буфер обмена: у noctalia плотный фон, стекло посветлее
    hg.preset("panels", {
        inherits = "layers",
        dark = { brightness = 1.25 },
    })
    hg.layer("noctalia-panel", { preset = "panels", mask_threshold = 0.05 })

    -- Панель: у каждой капсулы свой край стекла
    hg.layer("noctalia-bar-default", { mask_mode = "contour", mask_threshold = 0.15 })
end
