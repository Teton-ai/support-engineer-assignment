-- RoomSense fleet database
-- A simplified, anonymized snapshot of two care facilities, for the support
-- engineer exercise.
--
-- This is the raw telemetry + configuration behind the Console (the web
-- dashboard). The Console *derives* its pretty "Online / Monitoring" view from
-- this data; here you work with the raw data directly.
--
-- Assume "now" is 2026-07-16 09:00:00 UTC. All timestamps are UTC, stored as
-- text in 'YYYY-MM-DD HH:MM:SS' format.

CREATE TABLE facilities (
  id    INTEGER PRIMARY KEY,
  name  TEXT NOT NULL
);

CREATE TABLE wings (
  id           INTEGER PRIMARY KEY,
  facility_id  INTEGER NOT NULL REFERENCES facilities(id),
  name         TEXT NOT NULL
);

CREATE TABLE rooms (
  id           INTEGER PRIMARY KEY,
  wing_id      INTEGER NOT NULL REFERENCES wings(id),
  room_number  TEXT NOT NULL,
  occupied     INTEGER NOT NULL   -- 1 = a resident lives here, 0 = empty
);

CREATE TABLE switches (
  id           INTEGER PRIMARY KEY,
  wing_id      INTEGER NOT NULL REFERENCES wings(id),  -- each switch lives in, and serves, one wing's comms cabinet
  name         TEXT NOT NULL,
  model        TEXT,
  poe_capable  INTEGER NOT NULL   -- 1 = provides Power over Ethernet, 0 = data only (no power)
);

CREATE TABLE devices (
  id                INTEGER PRIMARY KEY,
  serial            TEXT NOT NULL UNIQUE,
  model             TEXT NOT NULL,
  facility_id       INTEGER NOT NULL REFERENCES facilities(id),
  room_id           INTEGER REFERENCES rooms(id),      -- NULL = not assigned to a room
  switch_id         INTEGER REFERENCES switches(id),   -- the switch this unit is cabled into
  switch_port       INTEGER,
  firmware_version  TEXT,
  installed_at      TEXT,                              -- date the unit was installed
  last_seen_at      TEXT                               -- last successful cloud check-in (NULL = never seen)
);

CREATE TABLE device_events (
  id          INTEGER PRIMARY KEY,
  device_id   INTEGER NOT NULL REFERENCES devices(id),
  ts          TEXT NOT NULL,       -- UTC timestamp of the event
  event_type  TEXT NOT NULL,       -- 'boot' | 'heartbeat' | 'cloud_unreachable' | 'error'
  detail      TEXT
);
