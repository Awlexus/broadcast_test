defmodule BroadcastTestWeb.RoomChannel do
  use Phoenix.Channel

  intercept ["intercept_out"]

  def join("room:" <> _, _message, socket) do
    {:ok, assign(socket, :joined_room?, true)}
  end

  def handle_out("intercept_out", _msg, socket) do
    IO.puts("#{socket.id} has intercepted the message")
    {:noreply, socket}
  end
end
