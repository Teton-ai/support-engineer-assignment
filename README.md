# Support Engineer — Practical Exercise

Thanks for taking the time to do this. Plan for **roughly 1.5–2 hours**. It's
layered on purpose — **we don't expect everyone to find everything.** We're more
interested in how you reason and communicate than in a perfect score, so show
your working.

The goal isn't to test whether you already know our product — you don't, and
that's fine. It's to see how you **learn a system from documentation**, **dig
into data to figure out what's wrong**, and **communicate with the people you'd
be supporting**.

Everything you need is in this repo:

| File                | What it is                                                      |
| ------------------- | -------------------------------------------------------------- |
| `system-brief.md`   | A one-page brief on the (fictional) "RoomSense" device & system. **Read this first.** |
| `rosewood.db`       | A small SQLite database — a snapshot of two care facilities' fleets. |
| `schema.sql`        | The database structure, with the columns explained.            |
| `TASKS.md`          | Four tasks.                                                     |

There's nothing to install or code, and no trick questions. Where the brief
doesn't answer something, that's on purpose — part of the job is knowing what
you'd still need to find out, and saying so.

## About the database

`rosewood.db` is the **raw telemetry and configuration behind the Console** (our
web dashboard). The Console normally shows a tidy "Online / Monitoring" view; for
this exercise you're working with the raw data it's built from, so you'll be
figuring some of that out yourself.

- **A unit checks in ("heartbeat") about every 5 minutes** when healthy. Treat a
  unit as **offline if its last check-in is more than 15 minutes old** (or it has
  never checked in).
- **Assume "now" is `2026-07-16 09:00:00 UTC`.** All timestamps are UTC. This
  matters for working out what's stale.

## Opening the database

Use whatever you're comfortable with:

- **Command line:** `sqlite3 rosewood.db` — then `.tables`, `.schema`, and SQL.
- **GUI:** [DB Browser for SQLite](https://sqlitebrowser.org/) (free), or any tool that opens SQLite.
- **Online:** any "SQLite viewer" site where you can upload the file.

```sql
.tables                 -- list the tables
.schema devices         -- see a table's columns
SELECT * FROM devices;  -- have a look around
```

## Handing it back

Send us a single document with your answers. Where a task involves the database,
**include the SQL you ran** and briefly explain what it told you. Bullet points
are fine — we care about your thinking, not polish. If anything in the brief or
data was unclear or looked wrong, tell us that too.
