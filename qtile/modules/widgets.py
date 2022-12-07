from qtile_extras import widget
from libqtile import qtile
from qtile_extras.widget.decorations import RectDecoration
from .colours import colours

widget_defaults = dict(
    font='Cantarell',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()
class MyVolume(widget.Volume):
    def _configure(self, qtile, bar):
        widget.Volume._configure(self, qtile, bar)
        self.volume = self.get_volume()
        if self.volume <= 0:
            self.text = ''
        elif self.volume <= 15:
            self.text = ''
        elif self.volume < 50:
            self.text = ''
        else:
            self.text = ''
        # drawing here crashes Wayland

    def _update_drawer(self, wob=False):
        if self.volume <= 0:
            self.text = ''
        elif self.volume <= 15:
            self.text = ''
        elif self.volume < 50:
            self.text = ''
        else:
            self.text = ''
        self.draw()

        if wob:
            with open(self.wob, 'a') as f:
                f.write(str(self.volume) + "\n")

volume = MyVolume(
    fontsize=22,
    font='Font Awesome 5 Free',
    foreground=colours["Black"],
    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("pavucontrol")},
    padding=10,
    decorations = [
        RectDecoration(
            filled=True,
            groups=True,
            radius=10,
            colour=colours["Pink"]
            )
        ]
)
