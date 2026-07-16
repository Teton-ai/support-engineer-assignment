# System Brief — the "RoomSense" Unit

*This is a simplified, anonymized version of a real product. Assume it's accurate
for this exercise.*

## What it is

RoomSense is a small device mounted high on the wall of a care resident's room.
It monitors the room and automatically detects falls, alerting care staff. It's
contactless — the resident doesn't wear anything. The units in this exercise are
model **RoomSense R2**.

## Power & network — one cable

Each unit connects with a **single Ethernet cable** that carries both power and
data using **PoE (Power over Ethernet)**. The cable runs to a **PoE-capable
network switch** in the wing's comms cabinet. There is **no separate power
adapter** — if the switch port doesn't provide PoE, the unit gets no power at all.

Each wing has its **own comms cabinet and switch(es)**, which serve the units in
that wing. A unit is always cabled to a switch in the wing it physically sits in.

## How it comes online

1. Mount the unit and plug in the Ethernet cable.
2. The unit powers on and boots (about **2 minutes**).
3. It gets an IP address automatically (DHCP) and connects out to our cloud over
   **HTTPS (port 443)**, at `cloud.roomsense.io`.
4. It appears in **the Console** — our web dashboard for support and care staff.
5. It must be **assigned to the correct room** in the Console to actually monitor.

Once healthy, a unit sends a **heartbeat** to the cloud **about every 5 minutes**.
The heartbeats, along with boots and errors, are recorded as events.

## Status LED (what on-site staff see)

Support works remotely from the data, but the people in the building see a single
status light on the front of each unit. It's useful to know what they're
describing when they call:

| LED                 | Meaning                                            |
| ------------------- | -------------------------------------------------- |
| Solid green         | Healthy — connected and monitoring                 |
| Slow blinking blue  | Booting / starting up (first ~2 minutes)           |
| Blinking amber      | Has power, but **no network / can't reach the cloud** |
| Blinking red        | Device fault — needs attention                     |
| Off                 | **No power**                                       |

## What "healthy" means

A healthy unit has **checked in within the last ~15 minutes**, is **assigned to a
room**, and is **cabled into a switch in its own wing**. A unit that hasn't
checked in for longer than that is effectively offline — and a room whose unit is
offline or unassigned **is not being monitored for falls**.

## Firmware

The current firmware is **2.4.1**. Anything **older than 2.2.0 is out of support**
and should be scheduled for an update — but firmware version on its own doesn't
take a unit offline.

## Network requirements

- A **PoE-capable switch port** for each unit (this is how it gets power).
- Outbound internet to the cloud over **HTTPS (443)**. Facility firewalls
  sometimes block this.
- **DHCP** available so each unit can get an IP address.

## The most common things that go wrong

1. Plugged into a **non-PoE** switch port → no power → never checks in.
2. Unit is online but **not assigned to a room** → it isn't actually monitoring.
3. Facility **firewall blocks outbound 443** → unit has power and boots, but can
   never reach the cloud → never comes online.
4. **Wrong room mapping** — the unit is assigned to the wrong room (or wing), so
   alerts are attributed to the wrong place.
5. **Shared network fault** — a switch, its uplink, or a cable run fails, taking
   **several units in the same area** offline at once.
6. A unit that **keeps rebooting** (e.g. a failing cable or power delivery) — it
   may look online between reboots but isn't reliably monitoring.
