defmodule CscWorshipWeb.ServiceController do
  use CscWorshipWeb, :controller

  alias CscWorship.Big
  alias CscWorship.Big.Service

  def index(conn, _params) do
    services = Big.list_services()
    services2 = Enum.sort_by(services, & &1.date, {:desc, DateTime})

    render(conn, :index, services: services2)
  end

  def new(conn, _params, date \\ nil) do
    changeset = Big.change_service(%Service{})
    render(conn, :new, changeset: changeset, date: nil)
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
        messages = []
        email_list = CscWorship.Big.Service.email_list(@changeset, service)
        if (service.email_sent == true) do
          for x <- email_list do
            if Kernel.elem(x, 1) != nil do
            x2 = Kernel.elem(x, 1)
            x3 = CscWorship.Email.volunteer_notification_email(%{name: x2.name, file: "booty", email: x2.email, doc_link: Map.get(service, :service_order, %{}), rehearsal1: service.rehearsal_time1, rehearsal2: service.rehearsal_time_2, instrument:  "'" <> to_string(Kernel.elem(x, 0)) <> "'", date: service.date, notes: service.notes, songs: service.songs})
            case IO.inspect(CscWorship.Mailer.deliver(x3)) do
              {:ok, _reason} -> ["Volunteer notification email sent successfully to " <> x2.email | messages]
              {:error, _reason} -> [ "Could not send volunteer notification email to " <> x2.email| messages]
          end
          end
        end
        end
        conn
        |> put_flash(:info, Enum.join(messages, "\n"))
        |> redirect(to: ~p"/services/#{service}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset, date: nil)
    end
  end

  def show(conn, %{"id" => id}) do
    service = Big.get_service!(id)
    render(conn, :show, service: service)
  end

  def edit(conn, %{"id" => id}) do
    service = Big.get_service!(id)
    date = Map.get(service, :date)
    changeset = Big.change_service(service)
    render(conn, :edit, service: service, changeset: changeset, date: date)
  end

  def update(conn, %{"id" => id, "service" => service_params}) do
    updated_params = case service_params["people"] do
      nil -> service_params
      _ -> Map.delete(service_params, service_params["people"])
    end
    past_service = Big.get_service!(id)
    case Big.update_service(past_service, updated_params) do
      {:ok, service} ->
        messages = []
        email_list = CscWorship.Big.Service.email_list({@changeset}, service)
        if (service.email_sent == true) do
          for x <- email_list do
            if Kernel.elem(x, 1) != nil do
            x2 = Kernel.elem(x, 1)
            x3 = CscWorship.Email.volunteer_notification_email(%{name: x2.name, file: service_params["people"], email: x2.email, doc_link: service.service_order, rehearsal1: service.rehearsal_time1, rehearsal2: service.rehearsal_time_2, instrument: Kernel.elem(x, 0), date: service.date, notes: service.notes, songs: service.songs})
            case CscWorship.Mailer.deliver(x3) do
              {:ok, _reason} -> IO.inspect("sent")#["Volunteer notification email sent successfully to " <> x2.email] ++ messages
              {:error, _reason} -> [ "Could not send volunteer notification email to " <> x2.email] ++ messages
            end
          end
          end
        end
        if (service.updated == true) do
          for x <- email_list do
            if Kernel.elem(x, 1) != nil do
              assoc =
              Kernel.elem(x, 0)
              assoc2 = Map.get(past_service, assoc, %{})
              assoc3 = Map.get(service, assoc)
              if assoc2.id != assoc3.id and assoc3 != nil do
                email1 = CscWorship.Email.volunteer_notification_email(%{name: assoc3.name, email: assoc3.email, date: service.date, doc_link: Map.get(service, :service_order, %{}), notes: service.notes, instrument: assoc, rehearsal1: service.rehearsal_time1, rehearsal2: service.rehearsal_time_2, songs: service.songs})
                if assoc2.id != %{} do
                  email2 = CscWorship.Email.no_longer_serving(%{name: assoc2.name, email: assoc2.email, date: service.date, instrument: assoc})
                  case IO.inspect(CscWorship.Mailer.deliver(email2)) do
                    {:ok, _reason} -> ["Volunteer notification email sent successfully to " <> assoc2.email | messages]
                    {:error, _reason} -> [ "Could not send volunteer notification email to " <> assoc2.email| messages]
                end
              end
              case IO.inspect(CscWorship.Mailer.deliver(email1)) do
                  {:ok, _reason} -> ["Volunteer notification email sent successfully to " <> assoc3.email | messages]
              {:error, _reason} -> [ "Could not send volunteer notification email to " <> assoc3.email| messages]
                end
              end
              end
            if past_service.rehearsal_time1 != service.rehearsal_time1 do
              x2 = Kernel.elem(x, 1)
              if (x2 != nil) do
              email = CscWorship.Email.rehearsal_update_email(%{name: x2.name, email: x2.email, date: service.date, rehearsal1: past_service.rehearsal_time1, rehearsal2: service.rehearsal_time1})
             case CscWorship.Mailer.deliver(email) do
                {:ok, _reason} -> ["Volunteer notification email sent successfully to " <> x2.email | messages]
              {:error, _reason} -> [ "Could not send volunteer notification email to " <> x2.email| messages]
              end
            end
            end
            if past_service.rehearsal_time_2 != service.rehearsal_time_2 do
              x2 = Kernel.elem(x, 1)
              if x2 != nil do
                email = CscWorship.Email.rehearsal_update_email(%{name: x2.name, email: x2.email, date: service.date, rehearsal1: past_service.rehearsal_time_2, rehearsal2: service.rehearsal_time_2})
                deliver = CscWorship.Mailer.deliver(email)
              case deliver do
                  {:ok, _reason} ->
                    ["Volunteer notification email sent successfully to " <> x2.email] ++ messages
              {:error, _reason} ->
                ["Could not send volunteer notification email to " <> x2.email] ++ messages
              _ -> messages
                end
              end
            end
          end
        end
        conn
        |> put_flash(:info, Enum.join(messages, "\n"))
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
