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
