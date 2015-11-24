from i3pystatus import Status
from i3pystatus import IntervalModule
import re

status = Status(standalone=True)


class NetSpeed(IntervalModule):
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


# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
    format="%a %-d %b %X",)

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
# status.register("load")

# Shows your CPU temperature, if you have a Intel CPU
# status.register("temp",
#     format="{temp:.0f}°C",)

# The battery monitor has many formatting options, see README for details

# This would look like this, when discharging (or charging)
# ↓14.22W 56.15% [77.81%] 2h:41m
# And like this if full:
# =14.22W 100.0% [91.21%]
#
# This would also display a desktop notification (via D-Bus) if the percentage
# goes below 5 percent while discharging. The block will also color RED.
# If you don't have a desktop notification demon yet, take a look at dunst:
#   http://www.knopwob.org/dunst/
status.register("battery",
#    format="{status}/{consumption:.2f}W {percentage:.2f}% [{percentage_design:.2f}%] {remaining:%E%hh:%Mm}",
    format="{status}/{consumption:.2f}W {percentage:.2f}% {remaining:%E%hh:%Mm}",
    alert=True,
    alert_percentage=5,
    status={
        "DIS": "↓",
        "CHR": "↑",
        "FULL": "=",
    },)

# This would look like this:
# Discharging 6h:51m
#status.register("battery",
#    format="{status} {remaining:%E%hh:%Mm}",
#    alert=True,
#    alert_percentage=5,
#    status={
#        "DIS":  "Discharging",
#        "CHR":  "Charging",
#        "FULL": "Bat full",
#    },)

# Displays whether a DHCP client is running
#status.register("runwatch",
#    name="DHCP",
#    path="/var/run/dhclient*.pid",)

# Shows the address and up/down state of eth0. If it is up the address is shown in
# green (the default value of color_up) and the CIDR-address is shown
# (i.e. 10.10.10.42/24).
# If it's down just the interface name (eth0) will be displayed in red
# (defaults of format_down and color_down)
#
# Note: the network module requires PyPI package netifaces
#status.register("network",
#    interface="eth0",
#    format_up="{v4cidr}",)

# Note: requires both netifaces and basiciw (for essid and quality)
#status.register("network",
#    interface="wlan0",
#    format_up="{essid} {quality:03.0f}%",)

# Shows disk usage of /
# Format:
# 42/128G [86G]
#status.register("disk",
#    path="/",
#    format="{used}/{total}G [{avail}G]",)

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
status.register("pulseaudio",
    format="♪{volume}",
    )

# Shows mpd status
# Format:
# Cloud connected▶Reroute to Remain
#status.register("mpd",
#    format="{title}{status}{album}",
#    status={
#        "pause": "▷",
#        "play": "▶",
#        "stop": "◾",
#    },)

status.register(NetSpeed)

status.run()
