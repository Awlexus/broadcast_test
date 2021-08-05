defmodule BroadcastTestWeb.RoomChannelTest do
  use BroadcastTestWeb.ChannelCase

  alias BroadcastTestWeb.UserSocket

  test "intercepts broadcast" do
    this = self()

    socket = create_socket("Main")

    spawn_link(fn ->
      create_socket("Other")
      send(this, :ready)
      assert_broadcast("intercept_out", %{intercept: true})
      send(this, :received)
    end)

    assert_receive(:ready)
    Phoenix.Channel.broadcast(socket, "intercept_out", %{intercept: true})
    assert_broadcast("intercept_out", %{intercept: true})
    assert_receive(:received)
  end

  defp create_socket(id) do
    {:ok, _, socket} =
      UserSocket
      |> socket(id, %{})
      |> subscribe_and_join("room:welcome")

    assert socket.assigns.joined_room?

    socket
  end
end
