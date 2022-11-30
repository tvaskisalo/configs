from libqtile import bar
from .widgets import *
from libqtile.config import Screen
from .keys import terminal
from .colours import colours
from qtile_extras import widget
from qtile_extras.widget.decorations import RectDecoration

screens = [
    Screen(
        top=bar.Bar(
            [   
                widget.Sep(
                    padding=3,
                    linewidth=0,
                    background=colours["Grey"]),
                widget.CurrentLayoutIcon(
                    use_mask=True,
                    scale=0.85,
                    padding=10,
                    foreground=colours["Black"],
                    decorations = [
                        RectDecoration(
                            filled=True,
                            group=True,
                            radius=10,
                            colour=colours["Pink"]
                            )
                        ]
                    ),
                widget.Spacer(10),
                widget.GroupBox(
                    highlight_method='block',
                    this_current_screen_border=colours["Black"],
                    inactive=colours["Black"],
                    active=colours["Black"],
                    margin_x=5,
                    hide_unused=True,
                    block_highlight_text_color=colours["Yellow"],
                    decorations = [
                        RectDecoration(
                            filled = True,
                            group=True,
                            radius=10,
                            colour=colours["Yellow"]
                            )
                        ] 
                    ),
                widget.Spacer(),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Clock(
                    format='%Y-%m-%d %a %I:%M %p',
                    foreground=colours["Black"],
                    padding=60,
                    fontsize=15,
                    decorations = [
                        RectDecoration(
                            filled=True,
                            group=True,
                            radius=10,
                            colour=colours["Blue"]
                            )
                        ]),
                widget.Spacer(),
                widget.UPowerWidget(
                    battery_height=15,
                    border_colour=colours["Grey"],
                    border_charge_colour=colours["Grey"],
                    border_critical_colour=colours["Grey"],
                    text_display_time=2,
                    battery_width=30,
                    foreground=colours["Light-green"],
                    margin=5,
                    fill_normal=colours["Light-green"],
                    fill_low=colours["Yellow"],
                    fill_critical=colours["Pink"],
                    text_discharging="({percentage:.0f}%) {tte} remaining",
                    text_charging="({percentage:.0f}%) {ttf} to full",
                    decorations = [
                        RectDecoration(
                            filled=True,
                            group=True,
                            radius=10,
                            colour=colours["Black"]
                            )
                        ] 
                    ),
                widget.Spacer(15),
                widget.CheckUpdates(
                    update_interval=1800,
                    distro="Arch_yay",
                    display_format="{updates} Updates",
                    foreground="#ffffff",
                    mouse_callbacks={
                        'Button1':
                        lambda: qtile.cmd_spawn(terminal + ' -e yay -Syu')
                    },
                    background="#2f343f"),
                widget.Systray(icon_size = 20),
                widget.TextBox(
                       text = '',
                       padding = 0,
                       fontsize = 28,
                       foreground='#2f343f'
                       ), 
                volume,
            ],
            30,  # height in px
            background=colours["Grey"]# background color
        ), ),
]
