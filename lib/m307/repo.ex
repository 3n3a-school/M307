defmodule M307.Repo do
  use Ecto.Repo,
    otp_app: :m307,
    adapter: Ecto.Adapters.MyXQL
end
