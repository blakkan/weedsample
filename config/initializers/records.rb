#
# Runtime database initialization
#
# (could also do this with seeds)
#

begin
  default_data = [
{
  serial_number: "SAMPLESN",
  lon: -122.008973,
  lat: 37.334901,
  timestamp: "2019-01-22 22:00:48 UTC",
  radish: 437,
  pea: 0,
  marigold: 32,
  morning_glory: 8,
  unidentified: 66,
  pump_time: 20
},
{
  serial_number: "SAMPLESN2",
  lon: -122.008913,
  lat: 37.334921,
  timestamp: "2019-01-26 23:22:12 UTC",
  radish: 621,
  pea: 0,
  marigold: 44,
  morning_glory: 2,
  unidentified: 92,
  pump_time: 25
},
{
  serial_number: "SAMPLESN",
  lon: -122.008973,
  lat: 37.334901,
  timestamp: "2019-02-01 16:16:45 UTC",
  radish: 0,
  pea: 324,
  marigold: 12,
  morning_glory: 0,
  unidentified: 16,
  pump_time: 18
},
{
  serial_number: "SAMPLESN",
  lon: -122.008973,
  lat: 37.334901,
  timestamp: "2019-02-02 18:45:11 UTC",
  radish: 0,
  pea: 211,
  marigold: 66,
  morning_glory: 2,
  unidentified: 7,
  pump_time: 36
},
{
  serial_number: "SAMPLESN",
  lon: -122.008973,
  lat: 37.334901,
  timestamp: "2019-02-03 17:17:31 UTC",
  radish: 2,
  pea: 150,
  marigold: 3,
  morning_glory: 6,
  pump_time: 9
}
]
Record.destroy_all
default_data.each{ |record| Record.create!( entry: record.to_json) }

end
