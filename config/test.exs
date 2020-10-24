use Mix.Config

config :bolt_sips, Bolt,
  hostname: 'localhost',
  basic_auth: [username: "neo4j", password: "puzzle-child-iris-saddle-gelatin-5416"],
  port: 7687,
  pool_size: 5,
  max_overflow: 1

z
