set $mod Mod4

# Font for window titles.
#font pango:monospace 100
font pango:DejaVu Sans Mono for Powerline 20

# The combination of xss-lock, nm-applet and pactl is a popular choice, so
# they are included here as an example. Modify as you see fit.
# xss-lock grabs a logind suspend inhibit lock and will use i3lock to lock the

# screen before suspend. Use loginctl lock-session to lock your screen.
exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork

# Starts Network Manager
exec --no-startup-id nm-applet

################################################
################# KEY BINDINGS #################
################################################

# Use pactl to adjust volume in PulseAudio.
set $refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status

# Use Mouse+$mod to drag floating windows to their wanted position`
floating_modifier $mod

# start a terminal
bindsym $mod+Return exec termite

# kill focused window
bindsym $mod+Shift+q kill

# change focus
bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+semicolon focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+semicolon move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+h split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

################# WORKSPACES #################

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

set $wsb "Browser"
set $wsp "Programming"
set $wst "Terminal"
set $wsc "Chat"

# switch to workspace
bindsym $mod+1 workspace number $ws1
bindsym $mod+2 workspace number $ws2
bindsym $mod+3 workspace number $ws3
bindsym $mod+4 workspace number $ws4
bindsym $mod+5 workspace number $ws5
bindsym $mod+6 workspace number $ws6
bindsym $mod+7 workspace number $ws7
bindsym $mod+8 workspace number $ws8
bindsym $mod+9 workspace number $ws9
bindsym $mod+0 workspace number $ws10

bindsym $mod+b workspace $wsb
bindsym $mod+p workspace $wsp
bindsym $mod+c workspace $wsc
bindsym $mod+t workspace $wst

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3
bindsym $mod+Shift+4 move container to workspace number $ws4
bindsym $mod+Shift+5 move container to workspace number $ws5
bindsym $mod+Shift+6 move container to workspace number $ws6
bindsym $mod+Shift+7 move container to workspace number $ws7
bindsym $mod+Shift+8 move container to workspace number $ws8
bindsym $mod+Shift+9 move container to workspace number $ws9
bindsym $mod+Shift+0 move container to workspace number $ws10

bindsym $mod+Shift+b move container to workspace $wsb
bindsym $mod+Shift+p move container to workspace $wsp
bindsym $mod+Shift+c move container to workspace $wsc
bindsym $mod+Shift+t move container to workspace $wst

# Moves entire workspace to the next monitor
bindsym $mod+m move workspace to output right

# reload the configuration file
# bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym semicolon resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}

bindsym $mod+r mode "resize"

# lock the screen
bindsym Mod1+l exec lock

# put system to sleep
bindsym Ctrl+Mod1+s exec lock --sleep

# lock
bindsym  Ctrl+Mod1+l exec lock

################# OPEN APPLICATIONS #################

# Open Chrome
bindsym Mod1+c exec google-chrome-stable

# open VS Code
bindsym Mod1+v exec code

# Open clipped
bindsym Ctrl+Mod1+v exec com.github.davidmhewitt.clipped

# open rofi
# Provides search for all available commands on the PATH
bindsym $mod+d exec rofi -show run -font "Source Code Pro 28" -separator-style none

# Provides search for all .desktop applications
bindsym $mod+F2 exec --no-startup-id i3-dmenu-desktop --dmenu='rofi -dmenu'

# Open Ulauncher
#bindsym $mod+d exec --no-startup-id ulauncher

#####################################################


# Launch Polybar
#exec_always --no-startup-id $HOME/.config/polybar/launch.sh

# Set screen layout
#exec_always --no-startup-id ~/.screenlayout/default.sh

exec --no-startup-id determine-setup

# Starts the compositor
exec_always --no-startup-id picom --config ~/.config/picom/picom.conf

################################################
#################### I3 GAPS ###################
################################################

for_window [class=".*"] border pixel 2
gaps inner 10
gaps outer 0
smart_gaps on
hide_edge_borders smart_no_gaps
floating_modifier Mod1

# Sets wallpaper
exec_always --no-startup-id feh --bg-fill ~/Pictures/zelda.jpg
