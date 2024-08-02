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

  def day_of_week(date) do
   day = Date.day_of_week(date)
   dayday = case day do
    1 -> "Monday"
    2 -> "Tuesday"
    3 -> "Wednesday"
    4 -> "Thursday"
    5 -> "Friday"
    6 -> "Saturday"
    7 -> "Sunday"
   end
   dayday
  end

  def create(conn, %{"service" => service_params}) do
    case Big.create_service(service_params) do
      {:ok, service} ->
        IO.inspect(service)
        email_list = CscWorship.Big.Service.email_list(@changeset, service)
        if (service.email_sent == true) do
          for x <- email_list do
            if Kernel.elem(x, 1) != nil do
            IO.inspect(x)
            x2 = Kernel.elem(x, 1)
            x3 = CscWorship.Email.volunteer_notification_email(%{name: x2.name, email: x2.email, rehearsal1: service.rehearsal_time1, rehearsal2: service.rehearsal_time_2, instrument: "AN Instrument", date: service.date, notes: service.notes, songs: service.songs})
            IO.inspect(CscWorship.Mailer.deliver(x3))
          end
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
    past_service = Big.get_service!(id)
    case Big.update_service(past_service, service_params) do
      {:ok, service} ->
        email_list = CscWorship.Big.Service.email_list({@changeset}, service)
        if (service.email_sent == true) do
          for x <- email_list do
            if Kernel.elem(x, 1) != nil do
            IO.inspect(x)
            x2 = Kernel.elem(x, 1)
            x3 = CscWorship.Email.volunteer_notification_email(%{name: x2.name, email: x2.email, rehearsal1: service.rehearsal_time1, rehearsal2: service.rehearsal_time_2, instrument: "AN Instrument", date: service.date, notes: service.notes, songs: service.songs})
            IO.inspect(CscWorship.Mailer.deliver(x3))
          end
          end
        end
        if (service.updated == true) do
          for x <- email_list do
            if Kernel.elem(x, 1) != nil do
              assoc =
              Kernel.elem(x, 0)
              assoc2 = Map.get(past_service, assoc, %{})
              assoc3 = Map.get(service, assoc, %{})
              if assoc2 != %{} and assoc2.id != assoc3.id do
                email1 = CscWorship.Email.volunteer_notification_email(%{name: assoc3.name, email: assoc3.email, date: service.date, notes: service.notes, instrument: assoc, rehearsal1: service.rehearsal_time1, rehearsal2: service.rehearsal_time_2, songs: service.songs})
                email2 = CscWorship.Email.no_longer_serving(%{name: assoc2.name, email: assoc2.email, date: service.date, instrument: assoc})
                IO.inspect(CscWorship.Mailer.deliver(email1))
               IO.inspect(CscWorship.Mailer.deliver(email2))
              end
              end
            if past_service.rehearsal_time1 != service.rehearsal_time1 do
              x2 = Kernel.elem(x, 1)
              if (x2 != nil) do
              email = CscWorship.Email.rehearsal_update_email(%{name: x2.name, email: x2.email, date: service.date, rehearsal1: past_service.rehearsal_time1, rehearsal2: service.rehearsal_time1})
              CscWorship.Mailer.deliver(email)
            end
            end
            if past_service.rehearsal_time_2 != service.rehearsal_time_2 do
              x2 = Kernel.elem(x, 1)
              if x2 != nil do
                email = CscWorship.Email.rehearsal_update_email(%{name: x2.name, email: x2.email, date: service.date, rehearsal1: past_service.rehearsal_time_2, rehearsal2: service.rehearsal_time1})
                CscWorship.Mailer.deliver(email)
              end
            end
          end
        end
        conn
        |> put_flash(:info, "Service updated successfully.")
        |> redirect(to: ~p"/services/#{service}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, service: past_service, changeset: changeset)
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
