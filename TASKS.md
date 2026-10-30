# Tasks

Read `system-brief.md` and the "About the database" section of `README.md` first.
For anything involving the database, include the SQL you ran and a short note on
what it told you. You won't necessarily find everything — show your reasoning.

---

## Task 1 — Getting new units installed

A care facility, **Rosewood Care Home**, has just received **6 new RoomSense
units** for a wing they're expanding. The PoE switch in that wing is already
installed and working. Your on-site contact is **Maria, a nurse who is not
technical**. You're helping her over the phone.

**Write the step-by-step instructions you'd give Maria** to get all 6 units
installed and confirmed working — from "the boxes are here" to "everything is
running."

Then briefly note: **what would you personally check** before you consider the
job finished and hang up?

---

## Task 2 — Audit the fleet

The team suspects not everything across the two facilities is healthy. The full
picture is in `rosewood.db`.

**Using the database, find every unit that is _not_ fully healthy**, and for each
one give:

1. **What's wrong** — your diagnosis in plain language.
2. **The evidence** — the query (or queries) you ran and what they showed.
3. **The fix** — what you'd do, or ask someone on-site to do, to resolve it.

A few things worth keeping in mind:

- "Healthy" isn't a single column — you'll need to work it out from the data
  (see the rules in `README.md`).
- Some units are clearly offline. Others **look fine at a glance but aren't** —
  it's worth checking configuration and history, not just the latest status.
- Not everything that looks alarming in the logs is an active problem. Say what
  you think is a real fault versus noise, and why.

`device-logs.md` has device-side logs for two units in this set (one, plus a
healthy neighbour for comparison). If your audit turns up a unit whose heartbeat
history alone doesn't tell the full story, check whether its log is one of the
two included.

**2a.** For the unit whose log shows a repeating problem: write a one-liner
(`grep`/`awk`, or a few lines of Python — whatever you're comfortable with) that
counts how many times its network link dropped in the window shown — not just
how many times it fully restarted. You don't need to run it anywhere real; just
show the command and what it would output, and say in a sentence what the gap
between those two counts tells you.

---

## Task 3 — Reply to the customer

This message just came in from Rosewood's **ward manager**:

> "Two of the units in our **east wing** have had a **blinking orange light**
> since this morning. The other units around the building seem fine. Can you take
> a look?"

Using what the data tells you:

1. Which units are these, and what's your **most likely explanation**? (Tie the
   "blinking orange light" back to what you can see in the data.)
2. **Write the reply** you'd send the ward manager right now — the actual message,
   in your own words.

---

## Task 4 — Prioritise

You realistically can't fix everything from Task 2 before the end of the day, and
some of it needs people on-site at each facility.

**Put the problems you found in the order you'd tackle them, and explain your
reasoning in a sentence or two each.** There isn't one correct order — we want to
see *how* you weigh things up (think about what the product is actually for, and
who is and isn't affected right now).

If there's anything else you'd flag to the team while you're in here — even if
it's not an outright fault — mention it at the end.

---

## Task 5 — One more scenario (no database needed)

A third facility, **Oakford Grange**, is having a new wing wired up for RoomSense
units. You're told:

- The wing has its own PoE switch, freshly installed, uplinked back to the
  building's core switch.
- DHCP for the whole building is handled by one server in the comms room, on
  the other side of the core switch from this wing.
- The building's firewall sits between the core switch and the internet.

On install day, 8 of the 10 new units never appear in the Console. The other 2
come up fine. You pull the device-side log off one of each (this is all the
unit itself reports — nothing from the building's network):

```
-- OG-02 (one of the two that came up fine) --
kernel: eth0: Link is Up - 100Mbps/Full - PoE: power good
dhclient: DHCPDISCOVER on eth0 - interval 3
dhclient: DHCPOFFER from 10.40.0.1
dhclient: DHCPACK from 10.40.0.1, lease 10.40.0.133 for 43200 seconds
smithd: INFO smith::postman: Posting successful

-- OG-07 (one of the eight that never appeared) --
kernel: eth0: Link is Up - 100Mbps/Full - PoE: power good
dhclient: DHCPDISCOVER on eth0 - interval 3
dhclient: DHCPDISCOVER on eth0 - interval 6
dhclient: DHCPDISCOVER on eth0 - interval 11
dhclient: DHCPDISCOVER on eth0 - interval 20
dhclient: No DHCPOFFERS received.
```

**What does this rule in and out, and what's your best guess at what's actually
wrong?** Then **say what you'd check or ask the building's IT team for** to
confirm it — you don't control the DHCP server, the VLAN config, or the
firewall, so be specific about what you'd need from them versus what you can
verify yourself from the device side. You don't need a definitive answer; we
want to see how you reason about a network you don't fully control.
