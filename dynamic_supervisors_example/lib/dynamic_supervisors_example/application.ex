defmodule DynamicSupervisorsExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: DynamicSupervisorsExample.Worker.start_link(arg)
      # {DynamicSupervisorsExample.Worker, arg}
      {DynamicSupervisor,
       strategy: :one_for_one, name: DynamicSupervisorsExample.DynamicSupervisor}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    # opts = [strategy: :one_for_one, name: DynamicSupervisorsExample.Supervisor]
    # Supervisor.start_link(children, opts)
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
