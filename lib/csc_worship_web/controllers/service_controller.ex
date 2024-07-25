defmodule CscWorshipWeb.ServiceController do
  use CscWorshipWeb, :controller

  alias CscWorship.Big
  alias CscWorship.Big.Service

  def index(conn, _params) do
    services = Big.list_services()
    render(conn, :index, services: services)
  end

  def new(conn, _params) do
    changeset = Big.change_service(%Service{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"service" => service_params}) do
    case Big.create_service(service_params) do
      {:ok, service} ->
        IO.inspect(service)
        email_list = CscWorship.Big.Service.email_list(@changeset, service)
        if (service.email_sent == true) do
          emails = for x <- email_list do
          end
        end
        conn
        |> put_flash(:info, "Service created successfully.")
        |> redirect(to: ~p"/services/#{service}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    service = Big.get_service!(id)
    render(conn, :show, service: service)
  end

  def edit(conn, %{"id" => id}) do
    service = Big.get_service!(id)
    changeset = Big.change_service(service)
    render(conn, :edit, service: service, changeset: changeset)
  end

  def update(conn, %{"id" => id, "service" => service_params}) do
    service = Big.get_service!(id)
    case Big.update_service(service, service_params) do
      {:ok, service} ->
        email_list = CscWorship.Big.Service.email_list({@changeset}, service)
        if (service.email_sent == true) do
          Enum.each(email_list, fn {k, v} ->
          if k != nil do
          email_to_send = CscWorship.Email.volunteer_notification_email(%{name: v.name, email: v.email, instrument: k, date: service.date, rehearsal1: service.rehearsal_time1, rehearsal2: service.rehearsal_time_2})
          Swoosh.Mailer.deliver(email_to_send)
          end
          end)
        end
        conn
        |> put_flash(:info, "Service updated successfully.")
        |> redirect(to: ~p"/services/#{service}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, service: service, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    service = Big.get_service!(id)
    {:ok, _service} = Big.delete_service(service)

    conn
    |> put_flash(:info, "Service deleted successfully.")
    |> redirect(to: ~p"/services")
  end
end
