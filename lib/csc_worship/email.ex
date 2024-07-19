defmodule CscWorship.Email do
  import Swoosh.Email

  #email, date, time, rehearsal_time_1, rehearsal_time_2
  def volunteer_notification_email(user) do
    new()
    |> to({user.name, user.email})
    |> from({"Dr B Banner", "cr-clair@wiu.edu"})
    |> subject("Hello, Avengers!")
    |> html_body("<h1>Hello #{user.name}</h1>")
    |> text_body("Hello #{user.name}\n")
  end
end
