defmodule BotV2 do
  def get_conf() do
    with {:ok, body} <- File.read(Path.expand("../bot_config/config.json")),
         {:ok, json} <- Poison.decode(body),
         do: {:ok, json}
  end

  def start do
    Application.put_env(:elixir, :ansi_enabled, true)
    :io.setopts(encoding: :latin1)
    {:ok, %{"channel" => channel, "token" => token, "nick" => user}} = get_conf()

    configs = [
      user: user,
      pass: token,
      chats: [channel],
      handler: CommandsHandler
    ]

    TMI.supervisor_start_link(configs)
  end
end
