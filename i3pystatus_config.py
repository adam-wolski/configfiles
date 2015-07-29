from i3pystatus import Status
from i3pystatus import IntervalModule
import re

status = Status(standalone=True)

class Netspeed(IntervalModule):
    interval = 1

    lastDown = 0
    lastUp = 0

    proc = '/proc/net/dev'

    tmpMeasure = False
    tmpDownStart = 0
    tmpUpStart = 0

    enabled = True

    on_leftclick = "toggleTmpMeasure"
    on_rightclick = "toggle"

    def run(self):

        if self.enabled:
            d, u = self.readProc()

            dSpeed = d - self.lastDown
            uSpeed = u - self.lastUp

            self.lastDown = d
            self.lastUp = u

            if self.tmpMeasure:
                d = d - self.tmpDownStart
                u = u - self.tmpUpStart

            self.output = {
                    "full_text": "{0}\\s {1}\\s  {2} {3}".format(self.bytesPrint(dSpeed), self.bytesPrint(uSpeed), self.bytesPrint(d), self.bytesPrint(u))
                    }
        else:
            self.output = {
                    "full_text": "_"
                    }


    def toggleTmpMeasure(self):
        if self.tmpMeasure:
            self.tmpMeasure = False
        else:
            self.tmpMeasure = True
            d, u = self.readProc()
            self.tmpDownStart = d
            self.tmpUpStart = u


    def bytesPrint(self, b):
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


    def readProc(self):
        dwn = 0
        up = 0
        with open(self.proc, "r") as procFile:
            m = re.search(r'^\s*[wp]+p0.*:\s*(\d*)\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*(\d*)\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*\s*\d*$', procFile.read(), flags=re.MULTILINE)
            if m:
                dwn = int(m.group(1))
                up = int(m.group(2))
            else:
                dwn = -1
                up = -1
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

status.register(Netspeed)

status.run()
