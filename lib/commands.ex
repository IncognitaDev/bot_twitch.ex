defmodule CommandsHandler do
  use TMI.Handler

  @impl true
  def handle_join(chat) do
    TMI.message(chat, "To na área")
  end

  def handle_join(_chat, user) do
    IO.puts(IO.ANSI.green() <> ">>> #{user} deu uma bisbilhotada na live" <> IO.ANSI.white())
  end

  @impl true
  def handle_message(message, _sender, chat) do
    IO.puts(IO.ANSI.blue() <> "#{message}" <> IO.ANSI.white())

    if String.starts_with?(message, "!") do
      cond do
        message == "!funciona" ->
          TMI.message(chat, "/me funciona e dessa vez é de verdade")

        String.starts_with?(message, ["!github", "!gh"]) ->
          TMI.message(chat, "/me github.com/oincognita")

        message == "!instagram" ->
          TMI.message(chat, "/me instagram.com/lu_vss")

        String.starts_with?(message, ["!linkedin", "!in"]) ->
          TMI.message(chat, " /me linkedin.com/in/luisvsousa")

        message == "!so" ->
          TMI.message(chat, "/me Serio ?!")

        true ->
          TMI.message(chat, "/me Não conheço o comando")
      end
    end
  end

  @impl true
  def handle_part(_chat, user) do
    IO.puts(IO.ANSI.yellow() <> "<<< #{user} foi se " <> IO.ANSI.white())
  end
end
