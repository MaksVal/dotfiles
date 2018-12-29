-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     size_hints_honor = false,
                     honor_workarea = true,
                     honor_padding = true,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
      }
    },

    -- Floating clients
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
        },
        class = {
          "Galculator",
          "feh",
          "Gpick",
          "Diptera",  -- Floating Termite
        },

        name = {
          "Event Tester",  -- xev
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true, ontop = false }},

    -- Add titlebars to normal clients and dialogs
    -- Not needed anymore --
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = true }--,
      --callback = function (c)
      --end
    },

    -- Centered clients
    { rule_any = {
        type = {
          "dialog",
          },
        class = {
          "feh",
          },
        name = {
          "Save As",
        },
        role = {
          "GtkFileChooserDialog",
        }
      }, properties = {},
      callback = function (c)
        awful.placement.centered(c,{honor_workarea=true})
      end
    },

    -- Titlebars OFF (explicitly)
    -- Titlebars of these clients will be hidden regardless of the theme setting
    { rule_any = {
        class = {
          "qutebrowser",
          "feh",
          "Gimp",
          "Sublime_text",
          --"discord",
          --"TelegramDesktop",
          "Firefox",
          "Chromium-browser",
          "Rofi",
          },
      }, properties = {},
      callback = function (c)
        if not beautiful.titlebars_imitate_borders then
            awful.titlebar.hide(c, beautiful.titlebar_position)
        end
      end
    },


    -- Titlebars ON (explicitly)
    -- Titlebars of these clients will be shown regardless of the theme setting
    { rule_any = {
        class = {
          --"feh",
          --"qutebrowser",
          --"Firefox",
          --"Rofi"
          },
      }, properties = {},
      callback = function (c)
        awful.titlebar.show(c, beautiful.titlebar_position)
      end
    },

      -- Skip taskbar
    { rule_any = {
        class = {
          --"feh",
          },

      }, properties = {},
      callback = function (c)
        c.skip_taskbar = true
      end
    },

    -- Fixed terminal geometry
    { rule_any = {
        class = {
          "Termite",
          "Diptera",
          "mpvtube",
          "kitty",
          "st-256color",
          "st",
          "URxvt",
          "XTerm",
          },
      }, properties = { width = 640, height = 400 }
    },

    -- File managers
    { rule_any = {
        class = {
          "Nemo",
          "Thunar",
          "Nautilus",
          },
      }, properties = { floating = true, width = 580, height = 440 }
    },

    -- Rofi configuration
    -- Needed only if option "-normal-window" is used
    { rule_any = {
        class = {
          "Rofi",
          },
      }, properties = { floating = true, ontop = true, sticky = true },
      callback = function (c)
        c.skip_taskbar = true
        awful.placement.centered(c,{honor_workarea=true})
      end
    },

    -- Screenruler
    { rule_any = {
        class = {
          "Screenruler",
          },
      }, properties = { floating = true, ontop = true },
      callback = function (c)
        c.border_width = 0
        awful.titlebar.hide(c, beautiful.titlebar_position)
        awful.placement.centered(c,{honor_workarea=true})
      end
    },

    -- On screen keyboard
    --{ rule_any = {
        --class = {
          --"Onboard",
          --},
      --}, properties = { floating = true, ontop = false, sticky = false, focusable = false },
      --callback = function (c)
        ----c.skip_taskbar = true
        ----awful.placement.centered(c,{honor_workarea=true})
      --end
    --},

    -- Scratchpad and calendar (calcurse)
    { rule_any = {
        class = {
          "scratchpad",
          "calendar",
          },
      }, properties = { tag = awful.screen.focused().tags[10], floating = true, ontop = false, sticky = true },
      callback = function (c)
        c.skip_taskbar = true
        c.minimized = true
        awful.placement.centered(c,{honor_workarea=true})
      end
    },

    ---------------------------------------------
    -- Start application on specific workspace --
    ---------------------------------------------
    -- Example:
    -- Set Firefox to always map on the tag named "2" on screen 1.
     --{ rule = { class = "Firefox" },
       --properties = { screen = 1, tag = "2" } },
    -- Browsing
    { rule_any = {
         class = {
            "Chromium-browser", "chromium-browser-chromium", "Chromium-browser-chromium",
            "Google-chrome"
         }
    }, properties = { screen = awful.screen.preferred, tag = awful.screen.focused().tags[3] } },

    -- Chatting
    { rule_any = {
        class = {
          "discord",
          "TelegramDesktop",
          "TeamSpeak 3",
          },
    --local clients =
     }, properties = { screen = 1, tag = awful.screen.focused().tags[4] } },

    -- Photo editing
    { rule_any = {
        class = {
          "Gimp",
          "Inkscape",
          },
     }, properties = { screen = 1, tag = awful.screen.focused().tags[6] } },

    -- Music
    { rule_any = {
        class = {
          "mpvtube",
          },
        --name = {
          --"mpvtube",
        --},

     }, properties = { screen = 1, tag = awful.screen.focused().tags[10] },
      callback = function (c)
        awful.placement.centered(c,{honor_workarea=true})
        gears.timer.delayed_call(function()
            c.urgent = false
        end)
      end
    },
}
-- }}}
