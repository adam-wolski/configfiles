from socket import gethostname 
import re

from i3pystatus import Status
from i3pystatus import IntervalModule

STATUS = Status(standalone=True)


class NetSpeed(IntervalModule):
    """Display network usage"""
    interval = 1

    last_down = 0
    last_up = 0

    proc = '/proc/net/dev'

    tmp_measure = False
    tmp_downstart = 0
    tmp_upstart = 0

    enabled = True

    on_leftclick = "toggle_tmp_measure"
    on_rightclick = "toggle"
    on_upscroll = "switch_device"

    device = 0

    def run(self):

        if self.enabled:
            d, u = self.read_proc()

            dspeed = d - self.last_down
            uspeed = u - self.last_up

            self.last_down = d
            self.last_up = u

            if self.tmp_measure:
                d = d - self.tmp_downstart
                u = u - self.tmp_upstart

            self.output = {
                "full_text": "{0}\\s {1}\\s  {2} {3}".format(
                    self.bytes_print(dspeed),
                    self.bytes_print(uspeed),
                    self.bytes_print(d),
                    self.bytes_print(u))
                }
        else:
            self.output = {
                "full_text": "_"
                }

    def toggle_tmp_measure(self):
        """
        Toggle temporary measure.
        Where you start measuring usage from chossen moment.
        """
        if self.tmp_measure:
            self.tmp_measure = False
        else:
            self.tmp_measure = True
            d, u = self.read_proc()
            self.tmp_downstart = d
            self.tmp_upstart = u

    def bytes_print(self, b):
        if b > 1000000000:
            gb = b / 1000000000
            return "{0:.2f} GB".format(gb)
        if b > 1000000:
            mb = b / 1000000
            return "{0:.2f} MB".format(mb)
        if b > 1000:
            kb = b / 1000
            return "{0:.2f} KB".format(kb)
        else:
            return "{0} B".format(b)

    def switch_device(self):
        self.device = self.device + 1

    def read_proc(self):
        dwn = 0
        up = 0
        with open(self.proc, "r") as proc_file:
            contents = proc_file.read()
            trys = 0
            while trys < 3:
                if self.device % 3 == 0:
                    m = re.search(r'^\s*wlp7s0:\s*(\d*)\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*(\d*)\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*$',
                            contents,
                            flags=re.MULTILINE)
                if self.device % 3 == 1:
                    m = re.search(r'^\s*enp8s0:\s*(\d*)\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*(\d*)\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*$',
                            contents,
                            flags=re.MULTILINE)
                if self.device % 3 == 2:
                    m = re.search(r'^\s*[wp]+p0.*:\s*(\d*)\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*(\d*)\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*$',
                            contents,
                            flags=re.MULTILINE)
                if self.device % 4 == 3:
                    m = re.search(r'^\s*enp0s20u2:\s*(\d*)\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*(\d*)\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*$',
                            contents,
                            flags=re.MULTILINE)
                if m:
                    dwn = int(m.group(1))
                    up = int(m.group(2))
                    break
                else:
                    dwn = -1
                    up = -1
                    self.switch_device()
                    trys = trys + 1
        return [dwn, up]

    def toggle(self):
        if self.enabled:
            self.enabled = False
            interval = 999
        else:
            self.enabled = True
            interval = 1


STATUS.register("clock", format="%a %-d %b %X",)

STATUS.register("load")

if gethostname() == 'miniucer':
    BATTERY = {
        "format": "{status}/{consumption:.2f}W {percentage:.2f}% {remaining:%E%hh:%Mm}",
        "alert": True,
        "alert_percentage": 10,
        "status": {
            "DIS": "↓",
            "CHR": "↑",
            "FULL": "=",
        },
    }
    STATUS.register("battery", BATTERY)


STATUS.register("pulseaudio", format="♪{volume}")

if gethostname() == 'miniucer':
    STATUS.register(NetSpeed)

SPOTIFY = {
    "format": "{title} by {artist}",
}
STATUS.register("spotify", SPOTIFY)

STATUS.run()
