defmodule CscWorship.Email do
  import Swoosh.Email

  #email, date, time, rehearsal_time_1, rehearsal_time_2
  def volunteer_notification_email(user) do
    new()
    |> to({user.name, user.email})
    |> from({"Cody Clair", "cr-clair@wiu.edu"})
    |> subject("CSC Notification Email")
    |> html_body("<h1>Hello #{user.name}!</h1> <p>This is an email notifying you that you are scheduled for #{user.instrument} on #{user.date} at CSC. If you will be unable to fill this role, please let Cody or Elyse know ASAP and update your availability in the office. </p>
    <h3> Our rehearsals are currently scheduled as follows:</h3>
    <p> #{to_string(user.rehearsal1)} and #{to_string(user.rehearsal2)}. Again, if these do not work for any reason, please tell Cody or Elyse ASAP. </p>
    <h2> Here are the songs we are playing this week: </h2>
    <p> </p>
    <h1> Thank you for serving! </h1>
    <p> In Christ, the CSC Worship Leadership Team (Cody and Elyse) </p>
    ")
    |> text_body("Hello #{user.name}!\n This is an email notifying you that you are scheduled for #{user.instrument} on #{user.date} at CSC. If you will be unable to fill this role, please let Cody or Elyse know ASAP and update your availability in the office. /n
      Our rehearsals are currently scheduled as follows: #{to_string(user.rehearsal1)} and #{to_string(user.rehearsal2)}. Again, if these do not work for any reason, please tell Cody or Elyse ASAP. /n  Here are the songs we are playing this week: /n
       Thank you for serving! /n In Christ, the CSC Worship Leadership Team (Cody and Elyse)
    ")
  end
end
