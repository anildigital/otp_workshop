# DynamicSupervisorsExample

This Elixir app demonstrates use of DynamicSupervisors in Elixir
[https://hexdocs.pm/elixir/DynamicSupervisor.html
](https://hexdocs.pm/elixir/DynamicSupervisor.html)

Try following comands to test DynamicSupervisors behavior

``` bash
iex(1)> {:ok, agent1} = DynamicSupervisor.start_child(DynamicSupervisorsExample.DynamicSupervisor, {Agent, fn -> %{} end})

iex(2)> {:ok, agent2} = DynamicSupervisor.start_child(DynamicSupervisorsExample.DynamicSupervisor, {Agent, fn -> %{} end})
{:ok, #PID<0.144.0>}

iex(3)> Agent.update(agent1, &Map.put(&1, :key, "agent1: value1"))
:ok

iex(4)> Agent.get(agent1, & &1)
%{key: "agent1: value1"}

iex(5)> Agent.update(agent2, &Map.put(&1, :key, "agent2: value2"))
:ok

iex(6)> Agent.get(agent2, & &1)
%{key: "agent2: value2"}

```

