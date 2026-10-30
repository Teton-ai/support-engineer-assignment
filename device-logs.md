# Device-side logs (RoomSense R2)

These are short excerpts from what a RoomSense unit sends back about itself when
asked (its own `smithd`-equivalent service log and link state) — not anything
from the facility's network or IT team. This is the same kind of raw material
support pulls directly off a unit when its database status alone isn't enough
to tell what's going on.

Two units below: one that's been flaky, one healthy neighbour in the same wing
for comparison.

---

## RS-2005 (Brookfield Manor, First Floor) — last ~4 hours

```
Jul 16 05:04:58 roomsense-RS-2005 kernel: eth0: Link is Down
Jul 16 05:05:00 roomsense-RS-2005 smithd[612]: INFO smith::boot: cold start, uptime 0s
Jul 16 05:05:02 roomsense-RS-2005 kernel: eth0: Link is Up - 100Mbps/Full - PoE: power good
Jul 16 05:05:03 roomsense-RS-2005 NetworkManager[611]: <info> dhcp4 (eth0): state changed bound -> DHCPACK, address 10.20.4.41
Jul 16 05:05:09 roomsense-RS-2005 smithd[612]: INFO smith::postman: Posting successful
Jul 16 05:12:41 roomsense-RS-2005 kernel: eth0: Link is Down
Jul 16 05:12:44 roomsense-RS-2005 kernel: eth0: Link is Up - 100Mbps/Full - PoE: power good
Jul 16 05:12:45 roomsense-RS-2005 NetworkManager[611]: <info> device (eth0): carrier re-established, no reconfiguration needed
Jul 16 05:19:40 roomsense-RS-2005 kernel: eth0: Link is Down
Jul 16 05:19:40 roomsense-RS-2005 smithd[612]: WARN smith::police: link lost, Restarting in 15s (schedule 1)
Jul 16 05:25:00 roomsense-RS-2005 kernel: eth0: Link is Up - 100Mbps/Full - PoE: power good
Jul 16 05:25:01 roomsense-RS-2005 smithd[612]: INFO smith::boot: cold start, uptime 0s
Jul 16 05:25:02 roomsense-RS-2005 NetworkManager[611]: <info> dhcp4 (eth0): state changed bound -> DHCPACK, address 10.20.4.41
Jul 16 05:25:08 roomsense-RS-2005 smithd[612]: INFO smith::postman: Posting successful
Jul 16 05:39:31 roomsense-RS-2005 kernel: eth0: Link is Down
Jul 16 05:39:31 roomsense-RS-2005 smithd[612]: WARN smith::police: link lost, Restarting in 15s (schedule 1)
Jul 16 05:45:00 roomsense-RS-2005 kernel: eth0: Link is Up - 100Mbps/Full - PoE: power good
Jul 16 05:45:01 roomsense-RS-2005 smithd[612]: INFO smith::boot: cold start, uptime 0s
Jul 16 05:45:02 roomsense-RS-2005 NetworkManager[611]: <info> dhcp4 (eth0): state changed bound -> DHCPACK, address 10.20.4.41
Jul 16 05:45:07 roomsense-RS-2005 smithd[612]: INFO smith::postman: Posting successful
Jul 16 05:52:17 roomsense-RS-2005 kernel: eth0: Link is Down
Jul 16 05:52:19 roomsense-RS-2005 kernel: eth0: Link is Up - 100Mbps/Full - PoE: power good
Jul 16 05:52:20 roomsense-RS-2005 NetworkManager[611]: <info> device (eth0): carrier re-established, no reconfiguration needed
Jul 16 05:59:31 roomsense-RS-2005 kernel: eth0: Link is Down
Jul 16 05:59:31 roomsense-RS-2005 smithd[612]: WARN smith::police: link lost, Restarting in 15s (schedule 1)
Jul 16 06:00:00 roomsense-RS-2005 kernel: eth0: Link is Up - 100Mbps/Full - PoE: power good
Jul 16 06:00:01 roomsense-RS-2005 smithd[612]: INFO smith::boot: cold start, uptime 0s
Jul 16 06:00:02 roomsense-RS-2005 NetworkManager[611]: <info> dhcp4 (eth0): state changed bound -> DHCPACK, address 10.20.4.41
Jul 16 06:04:52 roomsense-RS-2005 kernel: eth0: Link is Down
Jul 16 06:04:52 roomsense-RS-2005 smithd[612]: WARN smith::police: link lost, Restarting in 15s (schedule 1)
Jul 16 06:05:00 roomsense-RS-2005 kernel: eth0: Link is Up - 100Mbps/Full - PoE: power good
Jul 16 06:05:01 roomsense-RS-2005 smithd[612]: INFO smith::boot: cold start, uptime 0s
Jul 16 06:05:02 roomsense-RS-2005 NetworkManager[611]: <info> dhcp4 (eth0): state changed bound -> DHCPACK, address 10.20.4.41

-- pattern continues: a full restart (kernel Link Down/Up + "cold start" + fresh
   DHCPACK) at 06:25, 06:45, 07:05, 07:25, 07:45, 08:05, 08:25 and 08:45, each
   preceded by a "link lost, Restarting in 15s" line, each followed by heartbeats
   every ~5 min ("Posting successful") until the next drop --

Jul 16 06:18:03 roomsense-RS-2005 kernel: eth0: Link is Down
Jul 16 06:18:06 roomsense-RS-2005 kernel: eth0: Link is Up - 100Mbps/Full - PoE: power good
Jul 16 06:18:07 roomsense-RS-2005 NetworkManager[611]: <info> device (eth0): carrier re-established, no reconfiguration needed
Jul 16 07:12:50 roomsense-RS-2005 kernel: eth0: Link is Down
Jul 16 07:12:53 roomsense-RS-2005 kernel: eth0: Link is Up - 100Mbps/Full - PoE: power good
Jul 16 07:12:54 roomsense-RS-2005 NetworkManager[611]: <info> device (eth0): carrier re-established, no reconfiguration needed
Jul 16 07:38:16 roomsense-RS-2005 kernel: eth0: Link is Down
Jul 16 07:38:19 roomsense-RS-2005 kernel: eth0: Link is Up - 100Mbps/Full - PoE: power good
Jul 16 07:38:20 roomsense-RS-2005 NetworkManager[611]: <info> device (eth0): carrier re-established, no reconfiguration needed
Jul 16 08:12:04 roomsense-RS-2005 kernel: eth0: Link is Down
Jul 16 08:12:07 roomsense-RS-2005 kernel: eth0: Link is Up - 100Mbps/Full - PoE: power good
Jul 16 08:12:08 roomsense-RS-2005 NetworkManager[611]: <info> device (eth0): carrier re-established, no reconfiguration needed
Jul 16 08:38:51 roomsense-RS-2005 kernel: eth0: Link is Down
Jul 16 08:38:54 roomsense-RS-2005 kernel: eth0: Link is Up - 100Mbps/Full - PoE: power good
Jul 16 08:38:55 roomsense-RS-2005 NetworkManager[611]: <info> device (eth0): carrier re-established, no reconfiguration needed
Jul 16 08:45:00 roomsense-RS-2005 kernel: eth0: Link is Down
Jul 16 08:45:00 roomsense-RS-2005 smithd[612]: WARN smith::police: link lost, Restarting in 15s (schedule 1)
Jul 16 08:45:00 roomsense-RS-2005 kernel: eth0: Link is Up - 100Mbps/Full - PoE: power good
Jul 16 08:45:01 roomsense-RS-2005 smithd[612]: INFO smith::boot: cold start, uptime 0s
Jul 16 08:45:02 roomsense-RS-2005 NetworkManager[611]: <info> dhcp4 (eth0): state changed bound -> DHCPACK, address 10.20.4.41
Jul 16 08:45:34 roomsense-RS-2005 smithd[612]: INFO smith::postman: Posting successful
Jul 16 08:50:34 roomsense-RS-2005 smithd[612]: INFO smith::postman: Posting successful
Jul 16 08:55:34 roomsense-RS-2005 smithd[612]: INFO smith::postman: Posting successful
```

Two different patterns in there, worth telling apart:

- A **full restart** (`Link is Down` → several seconds → `Link is Up`, then
  `smith::boot: cold start` and a fresh `DHCPACK`): happens on a regular ~20
  minute cycle. Each of these is also recorded in the database as a `boot` row.
- A **brief flap** (`Link is Down` → 2–3 seconds → `Link is Up`, no reboot, no
  new DHCP lease): happens between the full restarts, more often than the
  reboots alone suggest. These don't last long enough to interrupt a heartbeat
  and never produce a `boot` row in the database at all — they're only visible
  here.

---

## RS-2004 (Brookfield Manor, First Floor — same wing as RS-2005) — same window, for comparison

```
Jul 16 05:00:00 roomsense-RS-2004 kernel: eth0: Link is Up - 100Mbps/Full - PoE: power good
Jul 16 05:00:34 roomsense-RS-2004 smithd[598]: INFO smith::postman: Posting successful
Jul 16 05:05:34 roomsense-RS-2004 smithd[598]: INFO smith::postman: Posting successful
Jul 16 05:10:34 roomsense-RS-2004 smithd[598]: INFO smith::postman: Posting successful
Jul 16 05:15:34 roomsense-RS-2004 smithd[598]: INFO smith::postman: Posting successful
Jul 16 05:20:34 roomsense-RS-2004 smithd[598]: INFO smith::postman: Posting successful
...
Jul 16 08:50:34 roomsense-RS-2004 smithd[598]: INFO smith::postman: Posting successful
```

No link drops, no restarts, steady ~5 minute posting interval the whole window.
