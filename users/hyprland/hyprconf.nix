{config, pkgs, lib, ... }: 
{

home.packages = with pkgs; [
  hyprland
 # waybar
  rofi-wayland
  pamixer
  brightnessctl
 ];

wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    extraConfig = ''
 
       ################
       ### MONITORS ###
       ################
       # See https://wiki.hyprland.org/Configuring/Monitors/
          monitor=,preferred,auto,1
       
       ###################
       ### MY PROGRAMS ###
       ### (KEYWORDS) ####
       ###################
       # See https://wiki.hyprland.org/Configuring/Keywords/ for more
         $terminal = kitty
         $fileManager = thunar
         $browser = brave
         $editor = codium
         $launcher = rofi -combi-modi drun,run -theme Arc-Dark -font "hack 12" -show combi -show-icons
         $zapClient = zapzap
         
       #################
       ### AUTOSTART ###
       #################
         exec-once = waybar & nm-applet --indicator & xclip & dunst & hyprpaper & blueman-applet &
         exec-once = wl-paste -t text --watch clipman store --no-persist
         exec-once = hypridle
         exec-once = bluetoothd
         exec-once = udiskie
         exec-once = maestral_qt
       
       #############################
       ### ENVIRONMENT VARIABLES ###
       #############################
       # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
         env = XCURSOR_SIZE,24
        # env = HYPRCURSOR_SIZE,24
       
         input {
             kb_layout = br
             kb_variant =
             kb_model =
             kb_options =
             kb_rules =
         
             follow_mouse = 0
         
             touchpad {
                 natural_scroll = yes
             }
         
             sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
         }
       
       #####################
       ### LOOK AND FEEL ###
       ##################### 
       # See https://wiki.hyprland.org/Configuring/Variables/ for more
         general { 
             gaps_in = 4
             gaps_out = 10
             border_size = 2
             col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
             col.inactive_border = rgba(595959aa)
             layout = dwindle
         }       

         decoration {        
             rounding = 10
             blur {
                 enabled = true
                 size = 3
                 passes = 1       
                 vibrancy = 0.1696
             }

             drop_shadow = yes
             shadow_range = 4
             shadow_render_power = 3
             col.shadow = rgba(1a1a1aee)
         }
         # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
           animations {
               enabled = yes
               bezier = myBezier, 0.05, 0.9, 0.1, 1.05
               animation = windows, 1, 7, myBezier
               animation = windowsOut, 1, 7, default, popin 80%
               animation = border, 1, 10, default
               animation = borderangle, 1, 8, default
               animation = fade, 1, 7, default
               animation = workspaces, 1, 6, default
            }
        
         # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more 
           dwindle {
               pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
               preserve_split = yes # you probably want this
           }
          
          # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
         #    new_is_master = true
          # }
         
         gestures {
             workspace_swipe = on
         }
         
         # Example per-device config
         # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
         device {
            name = epic-mouse-v1
            sensitivity = -0.5
         }
         
         # Example windowrule v1
          windowrule = float, ^(nm-applet --indicator)$
          windowrule = workspace 9, ^($zapClient)$
         # Example windowrule v2
          #windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
         windowrule = opacity 0.9 0.7, ^($terminal)$
         windowrule = opacity 0.9 0.7, ^($fileManager)$
         # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
         
         misc {
         # See https://wiki.hyprland.org/Configuring/Variables/ for more
           disable_hyprland_logo = true
           disable_splash_rendering = true
         }

       ####################
       ### KEYBINDINGSS ###
       ####################
       # See https://wiki.hyprland.org/Configuring/Keywords/ for more
         $mainMod = SUPER
         
         # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
         
         bind = $mainMod, Q, killactive, 
         bind = $mainMod SHIFT, Q, exit,
         bind = $mainMod SHIFT, R, exec, reboot
         bind = $mainMod SHIFT, S, exec, poweroff
         bind = $mainMod, F, togglefloating, 
         bind = $mainMod, U, fullscreen, 
         bind = $mainMod, Z, exec, $launcher
         bind = $mainMod, P, pseudo, # dwindle
         bind = $mainMod, J, togglesplit, # dwindle
         bind = $mainMod, L, exec, hyprlock
         # Apps bindings
         bind = $mainMod, W, exec, $browser
         bind = $mainMod, E, exec, $fileManager
         bind = $mainMod, C, exec, $editor
         bind = $mainMod, X, exec, $terminal
         bind = $mainMod, N, exec, notes
         bind =,Print, exec, grim - | swappy -f -
         bind = $mainMod ,Print, exec, grim -g "$(slurp)" - | swappy -f -
         bind = $mainMod, V, exec, clipman pick -t rofi
         
         # Move focus with mainMod + arrow keys
         bind = $mainMod, left, movefocus, l
         bind = $mainMod, right, movefocus, r
         bind = $mainMod, up, movefocus, u
         bind = $mainMod, down, movefocus, d
         
         # Switch workspaces with mainMod + [0-9]
         bind = $mainMod, 1, workspace, 1
         bind = $mainMod, 2, workspace, 2
         bind = $mainMod, 3, workspace, 3
         bind = $mainMod, 4, workspace, 4
         bind = $mainMod, 5, workspace, 5
         bind = $mainMod, 6, workspace, 6
         bind = $mainMod, 7, workspace, 7
         bind = $mainMod, 8, workspace, 8
         bind = $mainMod, 9, workspace, 9
         bind = $mainMod, 0, workspace, 10
         
         # Move active window to a workspace with mainMod + SHIFT + [0-9]
         bind = $mainMod SHIFT, 1, movetoworkspace, 1
         bind = $mainMod SHIFT, 2, movetoworkspace, 2
         bind = $mainMod SHIFT, 3, movetoworkspace, 3
         bind = $mainMod SHIFT, 4, movetoworkspace, 4
         bind = $mainMod SHIFT, 5, movetoworkspace, 5
         bind = $mainMod SHIFT, 6, movetoworkspace, 6
         bind = $mainMod SHIFT, 7, movetoworkspace, 7
         bind = $mainMod SHIFT, 8, movetoworkspace, 8
         bind = $mainMod SHIFT, 9, movetoworkspace, 9
         bind = $mainMod SHIFT, 0, movetoworkspace, 10
         
         # Volume control
         bind = , xf86audioraisevolume, exec, pamixer -i 5 
         bind = , xf86audiolowervolume, exec, pamixer -d 5  
         bind = , xf86audioMute, exec, pamixer -t
           
         # Brightness control
         bind = , xf86MonBrightnessDown, exec, brightnessctl s 25- 
         bind = , xf86MonBrightnessUp, exec, brightnessctl s 25+ 
  
         # Media Player control
  
         bind = , xf86AudioPlay, exec, playerctl play-pause 
         bind = , xf86AudioPrev, exec, playerctl previous
         bind = , xf86AudioNext, exec, playerctl next
  
        
         # Scroll through existing workspaces with mainMod + scroll
         bind = $mainMod, mouse_down, workspace, e+1
         bind = $mainMod, mouse_up, workspace, e-1
         
         # Move/resize windows with mainMod + LMB/RMB and dragging
         bindm = $mainMod, mouse:272, movewindow
         bindm = $mainMod, mouse:273, resizewindow
           '';
         };
       
}

