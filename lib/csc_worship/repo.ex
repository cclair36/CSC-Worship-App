defmodule CscWorship.Repo do
  use Ecto.Repo,
    otp_app: :csc_worship,
    adapter: Ecto.Adapters.Postgres
end
