defmodule CscWorshipWeb.UserRegistrationController do
  use CscWorshipWeb, :controller

  alias CscWorship.Accounts
  alias CscWorship.Accounts.User
  alias CscWorshipWeb.UserAuth

  def new(conn, _params) do
    changeset = Accounts.change_user_registration(%User{})
    render(conn, :new, changeset: changeset)
    #conn
    #|> put_flash(:error, "This page is prohibited. Please contact Cody if you need an account made.")
    #|> redirect(to:"/users/log_in")
  end

  def create(conn, %{"user" => user_params}) do
    IO.inspect(user_params)
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        {:ok, _} =
          Accounts.deliver_user_confirmation_instructions(
            user,
            &url(~p"/users/confirm/#{&1}")
          )

        conn
        |> put_flash(:info, "User created successfully.")
        |> UserAuth.log_in_user(user)

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end
end
