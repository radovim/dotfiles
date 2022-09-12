# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile.command import lazy
from libqtile import backend, bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile import qtile
from os import getlogin
import nerdfonts as nf
import subprocess
import re

from libqtile.command.client import InteractiveCommandClient



mod = "mod4"
terminal = 'st'
dmenu = 'dmenu_run -c -l 10'
power_menu = f'/home/{getlogin()}/software/linux_scripts/dmenu_power'
rofi_launcher = '/home/phill/.config/rofi/bin/launcher_misc'

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html

    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "k", lazy.layout.next(), desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns ayout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "f", lazy.window.toggle_floating()),
    Key([], "F11", lazy.window.toggle_fullscreen()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),
    Key([mod, "shift"], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "p", lazy.spawn(dmenu), desc="Run dmenu"),
    Key([mod, "shift"], "p", lazy.spawn(power_menu), desc="Run dmenu"),

    # My key bindings
    Key([], "XF86AudioRaiseVolume", lazy.spawn('pulsemixer --change-volume +5'), desc="Raise volume"),
    Key([], "XF86AudioLowerVolume", lazy.spawn('pulsemixer --change-volume -5'), desc="Lower volume"),
    Key([], "XF86AudioMute", lazy.spawn('pulsemixer --toggle-mute'), desc="Toggle mute volume"),
    Key([], "Print", lazy.spawn('flameshot gui'), desc="Make a screenshot with flameshot app"),

    Key([mod, "shift"], "b", lazy.spawn('brave'), desc="Start brave browser"),
    Key([mod, "shift"], "f", lazy.spawn('firefox'), desc="Start firefox"),
    Key([], "XF86MonBrightnessUp", lazy.spawn('brightnessctl s 5%+'), desc="Screen brightness up"),
    Key([], "XF86MonBrightnessDown", lazy.spawn('brightnessctl s 5%-'), desc="Screen brightness down"),
    Key([mod], "space", lazy.spawn(f'/home/{getlogin()}/software/linux-scripts/changekbmap.sh'), desc="Change keyboard layout"),
    Key([mod], "s", lazy.spawn('slock'), desc="Lock screen with slock"),
    Key([mod, "shift"], "s", lazy.spawn('flameshot gui'), desc="Take a screen shot"),
    Key([mod], "r", lazy.spawn(rofi_launcher), desc="Start rofi"),
    Key([mod, "shift"], "m", lazy.spawn('amixer -q sset Capture toggle'), desc="Toggle mic"),
]


color = {
    "background":   '1E3163',
    "white":        'ffffff',
    "cyan":         '8be9fd',
    "deepskyblue":  '00bfff',
    "green":        '00ff7f',
    "orange":	    'ffb86c',
    "lightorange":  'ffa500',
    "pink":	        'ff1493',
    "purple":	    'bd93f9',
    "red":	        'ff5555',
    "lightred":     'ffaaaa',
    "yellow":	    'ffff54'
}


# Groups
group_setup = (
    (
        '',
        {
            'layout': 'MonadTall', 
            'matches': [Match(wm_class=("Alacritty", "Alacritty", "st-256color", "st-256color"))]
        }
    ),

    (
        '',
        {
            'layout': 'RatioTile',
            'matches': [Match(wm_class=("brave-browser", "Brave-browser", "Navigator", "firefox"))]
        }
    ),

    (
        '﬏',
        {
            'layout': 'columns',
            'matches': [Match(wm_class=("code", "Code"))]
        }
    ),

    (
        '',
        {
            'layout': 'columns',
            'matches': [Match(wm_class=("STM32CubeIDE", "STM32CubeIDE"))]
        }
    ),

    (
        '',
        {
            'layout': 'columns',
            'matches': [Match(wm_class=("microsoft teams - preview", "Microsoft Teams - Preview"))] 
        }
    ),

   (
        '',
        {
            'layout': 'columns',
            'matches': [Match(wm_class=("Mail", "Thunderbird", "mailspring", "Mailspring"))],
        }
    ),

    (
        '',
        {
            'layout': 'columns',
            'matches': [Match(wm_class=())],
        }
    ),

    (
        nf.icons['mdi_textbox_password'],
        {
            'layout': 'columns',
            'matches': [Match(wm_class=("keepassxc", "KeePassXC"))],
        }
    ),

    (
        '',
        {
            'layout': 'columns',
            'matches': [Match(wm_class=())],
        }
    ),

    (
        nf.icons['mdi_vlc'],
        {
            'layout': 'columns',
            'matches': [Match(wm_class=("vlc", "vlc"))],
        }
    )
)

groups = [
        ScratchPad("scratchpad", [
        # define a drop down terminal.
        # it is placed in the upper third of screen by default.
        DropDown("term", "arandr", width=0.2, height=0.05, opacity=1),

        # define another terminal exclusively for ``qtile shell` at different position
        DropDown("qtile shell", "urxvt -hold -e 'qtile shell'",
                 x=0.05, y=0.4, width=0.9, height=0.6, opacity=0.9,
                 on_focus_lost_hide=True) ])
]
for idx, (label, config) in enumerate(group_setup):
    if idx + 1 == 10:
        hotkey = '0'
    else:
        hotkey = str(idx + 1)
    config.setdefault('layout', 'tile')
    groups.append(Group(label, **config))

    # mod + hotkey = switch to group
    keys.append(Key([mod], hotkey, lazy.group[label].toscreen()))

    # mod + shift + hotkey = move focused window to group
    keys.append(Key([mod, 'shift'], hotkey, lazy.window.togroup(label)))


arch_color='#1793d1'

layouts = [
#    layout.MonadTall(
#        border_on_single=True,
#        border_focus=arch_color,
#        border_normal=color["background"],
#        border_width=2,
#        margin=4
#    ),
#
    layout.Columns(
        border_on_single=True,
        border_focus=arch_color,
        border_normal=color["background"],
        border_width=2,
        margin=4
    ),
#
#    layout.Max(
#    ),
#
#    layout.RatioTile(
#        border_on_single=True,
#        border_focus=arch_color,
#        border_normal=color["background"],
#        border_width=2,
#        margin=4
#    )
    # Try more layouts by unleashing below layouts.
     #layout.Stack(num_stacks=2),
     #layout.Bsp(),
     #layout.Matrix(),
     #layout.MonadWide(),
     #layout.Tile(),
     #layout.TreeTab(),
     #layout.VerticalTile(),
     #layout.Zoomy(),
]

widget_defaults = dict(
    #font='AurulentSansMono Nerd Font',
    #font='FiraCode Nerd Font',
    #font='SF Pro Display:style=Bold',
    #font='Ubuntu:style=Regular',
    font='mononoki Nerd Font',
    #font="FiraCode Nerd Font Mono",
    fontsize=14,
    foreground='ffffff',
    padding=15,
    background=color["background"]
)
extension_defaults = widget_defaults.copy()

def getvolume():
    result=subprocess.run(["amixer", "sget", "Master"], capture_output=True, text=True)
    pattern = re.compile("(?<=\[)[0-9]{1,3}(?=%\])")
    volume = int(pattern.search(result.stdout)[0])

    if (volume <= 0) or ("[off]" in result.stdout):
        icon = "婢"
        volume = "M"
    elif volume <= 30:
        icon = "奄"
    elif volume <= 80:
        icon = "奔"
    elif volume > 80:
        icon = "墳"

    return f"{icon} {volume}"

def getwlan(flag, interface):
    command = "nmcli c show --active"
    result=subprocess.run(command.split(" "), capture_output=True, text=True)
    lines = result.stdout.split("\n")
    essid = ""
    for line in lines:
        if interface in line:
            essid = line.split(" ")[0]
    if (flag == "open"):
        if essid:
            return f"   {essid}  "
        else:
            return "  睊  ",
    elif (flag == "close"):
        if essid:
            return "    "
        else:
            return "  睊  ",

def getmic():
    result = subprocess.run(["amixer", "sget", "Capture"], capture_output=True, text=True)
    if "[on]" in result.stdout:
        return ""
    elif "[off]" in result.stdout:
        return ""
    else:
        return "err"

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    highlight_method='border',
                    borderwidth = 2,
                    margin = 3,
                    highlight_color=color["background"],
                    this_current_screen_border="FAEA48",
                    disable_drag=True,
                    fontsize=14,
                    padding=4,
                    urgent_alert_method='text',
                    urgent_border='A91079',
                ),
                widget.Sep(
                    linewidth=2,
                    foreground="#777777",
                    padding=10,
                    size_percent=60
                ),
                widget.CurrentLayoutIcon(
                    scale=0.6,
                    padding=4
                ),
                # widget.Chord(
                #     chords_colors={
                #         "launch": ("#0000ff", "#ffffff"),
                #     },
                #     name_transform=lambda name: name.upper(),
                # ),

                widget.Spacer(),
                widget.CheckUpdates(
                    distro='Arch',
                    padding=0,
                    fontsize=10,
                    display_format="{updates}"
                ),
                widget.TextBox(
                text='',
                fontsize=18,
                padding=4,
                foreground=arch_color,
                ),
                widget.Clock(
                    format="%d.%m.%y %a %H:%M",
                    padding=4,
                    mouse_callbacks={ 'Button1': lambda: qtile.cmd_spawn('gnome-calendar')}
                    ),
                widget.Spacer(),
                widget.TextBox(
                    text=' ',
                    fontsize=20,
                    padding=4,
                ),
                widget.GenPollText(
                    func=lambda: getvolume(),
                    padding=4,
                    update_interval=0.3,
                    mouse_callbacks={ 'Button1': lambda: qtile.cmd_spawn('pulsemixer  --toggle-mute'), 
                                      'Button4': lambda: qtile.cmd_spawn('pulsemixer --change-volume +3'),
                                      'Button5': lambda: qtile.cmd_spawn('pulsemixer --change-volume -3')
                                    },
                ),
                # widget.PulseVolume(
                #     volume_up_command = "pulsemixer --change-volume +3",
                #     volume_down_command = "pulsemixer --change-volume -3",
                #     mute_command = "pulsemixer --toggle-mute",
                #     limit_max_volume = False,
                #     get_volume_command = "pulsemixer --get-volume",
                # ),
                widget.GenPollText(
                    func=lambda: getmic(),
                    update_interval=1,
                    mouse_callbacks={ 'Button1': lambda: qtile.cmd_spawn('amixer -q sset Capture toggle')}
                ),
                widget.WidgetBox(
                    #text_closed = getwlan("close", "wlan0"),
                    #text_open = getwlan("open", "wlan0"),
                    text_closed = "  ",
                    text_open = "  > ",
                    widgets = [
                        widget.Wlan(
                            interface = "wlan0",
                            disconnected_message = "睊",
                            format = " {essid}[{quality}/70]"
                        ),

                    ],
                    padding=15,
                ),
                widget.Battery(
                    discharge_char = '',
                    charge_char = '',
                    full_char = '',
                    empty_char = '',
                    unknown_char = '',
                    format="{char} {percent:2.0%}",
                    show_short_text=False,
                    update_interval = 3,
                    ),
                widget.Backlight(
                    backlight_name='intel_backlight',
                    format='盛 {percent:2.0%}',
                    change_command='brightnessctl s {0}%',
                    step=5,
                    ),
                widget.KeyboardLayout(
                    display_map={'us': ' en', 'rs latin': ' sr', 'rs': ' ср'},
                    mouse_callbacks={ 'Button1': lambda: qtile.cmd_spawn('changekbmap') },
                    update_interval = 1
                ),
                widget.TextBox(
                    text='',
                    mouse_callbacks={ 'Button1': lambda: qtile.cmd_spawn(f'/home/{getlogin()}/software/scripts/toggle_picom.sh') },
                    ),
                widget.WidgetBox(
                    widgets=[
                        widget.Systray(),
                        widget.TextBox(
                            text=' ',
                            fontsize=18,
                            mouse_callbacks={ 'Button1': lambda: qtile.cmd_spawn('arandr')},
                            padding=4,
                        ),
                        widget.TextBox(
                            text=' 禍',
                            fontsize=18,
                            mouse_callbacks={ 'Button1': lambda: qtile.cmd_spawn(f'/home/{getlogin()}/software/scripts/dmenu_serial')},
                            padding=4,
                        ),
                    ],
                    text_closed = "  ",
                    text_open = " > ",
                ),
                widget.TextBox(
                    text='襤 ',
                    fontsize=17,
                    mouse_callbacks={ 'Button1': lambda: qtile.cmd_spawn(power_menu) }
                    ),
            ],
            background=color["background"],
            margin = [4,6,0,6],
            opacity = 1,
            size=26
        ),
    ),
]



# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "QTILE"
