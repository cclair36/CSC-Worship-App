import Config

# Note we also include the path to a cache manifest
# containing the digested version of static files. This
# manifest is generated by the `mix assets.deploy` task,
# which you should run after static files are built and
# before starting your production server.
config :csc_worship, CscWorshipWeb.Endpoint,
  cache_static_manifest: "priv/static/cache_manifest.json",
  force_ssl: [rewrite_on: [:x_forwarded_proto]]
  # https: [
  #   port: 443,
  #   cipher_suite: :strong,
  #   keyfile: Path.expand("priv/certs/server.key"),
  #   certfile: Path.expand("priv/certs/server.crt")
  #    Optionally include other SSL options here
  # ]

# Configures Swoosh API Client
config :swoosh, api_client: Swoosh.ApiClient.Finch, finch_name: CscWorship.Finch

# Disable Swoosh Local Memory Storage
config :swoosh, local: false

# Do not print debug messages in production
config :logger, level: :info

config :csc_worship, CscWorship.Repo,
adapter: Ecto.Adapters.Postgres,
url: System.get_env("DATABASE_URL"),
pool_size: 2 #String.to_integer(System.get_env("POOL_SIZE") || "20")
  #ssl: [verify: :verify_peer, cacertfile: Path.expand("priv/certs/rootCA.crt"),  keyfile: Path.expand("priv/certs/server.key"),
  #certfile: Path.expand("priv/certs/server.crt")]
# Runtime production configuration, including reading
# of environment variables, is done on config/runtime.exs.
