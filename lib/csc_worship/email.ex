defmodule CscWorship.Email do
  import Swoosh.Email

  #email, date, time, rehearsal_time_1, rehearsal_time_2
  def volunteer_notification_email(user) do
    new()
    |> to({user.name, user.email})
    |> from({"Cody Clair", "cr-clair@wiu.edu"})
    |> subject("CSC Notification Email")
    |> html_body("<h1>Hello #{user.name}!</h1> <p>This is an email notifying you that you are scheduled for #{to_string(user.instrument)} on #{p = to_string(user.date)
    String.slice(p, 5..7) <> String.slice(p, 8..9) <> "-" <> String.slice(p, 0..3)
    } at CSC. If you will be unable to fill this role, please let Jenna, Cody or Elyse know ASAP and update your availability in the office. </p>
    <h3> Our rehearsals are currently scheduled as follows:</h3>
    <p> #{p = to_string(user.rehearsal1)
    day = CscWorshipWeb.ServiceController.day_of_week(user.rehearsal1) <> ", " <> String.slice(p, 5..7) <> String.slice(p, 8..9) <> "-" <> String.slice(p, 0..3) <> ", "
    p2 = Integer.parse(String.slice(p, 11..12))
    if Kernel.elem(p2, 0) - 12 >= 0 do
      day <> "at " <> to_string(Kernel.elem(p2, 0)- 12) <> String.slice(p, 13..15) <> "PM"
    else
     day <> "at " <> to_string(Kernel.elem(p2, 0)) <> String.slice(p, 13..15) <> "AM"
    end} and </p> <p> #{p = to_string(user.rehearsal2)
    day = CscWorshipWeb.ServiceController.day_of_week(user.rehearsal2) <> ", " <> String.slice(p, 5..7) <> String.slice(p, 8..9) <> "-" <> String.slice(p, 0..3) <> ", "
    p2 = Integer.parse(String.slice(p, 11..12))
    if Kernel.elem(p2, 0) - 12 >= 0 do
    day <> "at " <> to_string(Kernel.elem(p2, 0)- 12) <> String.slice(p, 13..15) <> "PM"
    else
    day <> "at " <>  to_string(Kernel.elem(p2, 0)) <> String.slice(p, 13..15) <> "AM"
    end}. </p> <p> Again, if these do not work for any reason, please tell Jenna, Cody or Elyse ASAP. </p>
    <h2> Here are the songs we are playing this week: </h2>
    <p> #{for x <- user.songs, do: "<p>" <> x <> "-" <> Map.get(CscWorship.Repo.get_by!(CscWorship.Big.Song, name: x), :youtube) <> "</p>"}</p>
   <p> Click this link to access a step-by-step procedure of the service: #{user.doc_link} </p>
    <p> <span style='font-weight:bold'>Finally, here are some important notes for this service: </span> #{user.notes} </p>
    <h1> Thank you for serving! </h1>
    <p> In Christ, the CSC Worship Leadership Team (Jenna, Cody and Elyse) </p>
    ")
    |> text_body("Hello #{user.name}!\n This is an email notifying you that you are scheduled for #{to_string(user.instrument)} on #{p = to_string(user.date)
    String.slice(p, 5..7) <> String.slice(p, 8..9) <> "-" <> String.slice(p, 0..3)} at CSC. If you will be unable to fill this role, please let Jenna, Cody or Elyse know ASAP and update your availability at csc-worship-app-4.gigalixirapp.com. \n
      Our rehearsals are currently scheduled as follows: #{p = to_string(user.rehearsal1)
      day = CscWorshipWeb.ServiceController.day_of_week(user.rehearsal1) <> ", " <> String.slice(p, 5..7) <> String.slice(p, 8..9) <> "-" <> String.slice(p, 0..3) <> ", "
      p2 = Integer.parse(String.slice(p, 11..12))
      if Kernel.elem(p2, 0)- 12 >= 0 do
        day <> "at " <> to_string(Kernel.elem(p2, 0)- 12) <> String.slice(p, 13..15) <> "PM"
      else
       day <> "at " <> to_string(Kernel.elem(p2, 0)) <> String.slice(p, 13..15) <> "AM"
      end} and \n #{p = to_string(user.rehearsal2)
      day = CscWorshipWeb.ServiceController.day_of_week(user.rehearsal2) <> ", " <> String.slice(p, 5..7) <> String.slice(p, 8..9) <> "-" <> String.slice(p, 0..3) <> ", "
      p2 = Integer.parse(String.slice(p, 11..12))
      if Kernel.elem(p2, 0) - 12 >= 0 do
       day <> "at " <> to_string(Kernel.elem(p2, 0)- 12) <> String.slice(p, 13..15) <> "PM"
      else
       day <> "at " <> to_string(Kernel.elem(p2, 0)) <> String.slice(p, 13..15) <> "AM"
      end
      }
      . \n Again, if these do not work for any reason, please tell Jenna, Cody or Elyse ASAP. \n  Here are the songs we are playing this week: \n
      #{for x <- user.songs, do: x <> "\n"}
       Click this link to access a step-by-step procedure of the service: #{user.doc_link} \n
      Finally, here are some important notes for this week's service: #{user.notes}
       Thank you for serving! \n In Christ, the CSC Worship Leadership Team (Jenna, Cody and Elyse)
    ")
  #  |> attachment(%Swoosh.Attachment{
  #     path: "#{user.file}",
  #    filename: "#{user.date}.png",
  #    cid: "rehearsal_info",
  #  })
   end

  def rehearsal_update_email(user) do
    new()
    |> to({user.name, user.email})
    |> from({"Cody Clair", "cr-clair@wiu.edu"})
    |> subject("CSC Notification Email")
    |> html_body("<h1> Hello #{user.name}! </h1>
    <p> This email is to let you know that the service at CSC on #{p = to_string(user.date)
    String.slice(p, 5..7) <> String.slice(p, 8..9) <> "-" <> String.slice(p, 0..3)} has had a rehearsal time change. </p>
    <p> <span style='font-weight:bold'> The previous rehearsal time: </span> #{p = to_string(user.rehearsal1)
    day = CscWorshipWeb.ServiceController.day_of_week(user.rehearsal1) <> ", " <> String.slice(p, 5..7) <> String.slice(p, 8..9) <> "-" <> String.slice(p, 0..3) <> ", "
    p2 = Integer.parse(String.slice(p, 11..12))
    if Kernel.elem(p2, 0)- 12 >= 0 do
      day <> "at " <> to_string(Kernel.elem(p2, 0)- 12) <> String.slice(p, 13..15) <> "PM"
    else
     day <> "at " <> to_string(Kernel.elem(p2, 0)) <> String.slice(p, 13..15) <> "AM"
    end} </p> <p> <span style='font-weight:bold'> The new rehearsal time: </span> #{p = to_string(user.rehearsal2)
    day = CscWorshipWeb.ServiceController.day_of_week(user.rehearsal2) <> ", " <> String.slice(p, 5..7) <> String.slice(p, 8..9) <> "-" <> String.slice(p, 0..3) <> ", "
    p2 = Integer.parse(String.slice(p, 11..12))
    if Kernel.elem(p2, 0)- 12 >= 0 do
      day <> "at " <> to_string(Kernel.elem(p2, 0)- 12) <> String.slice(p, 13..15) <> "PM"
    else
     day <> "at " <> to_string(Kernel.elem(p2, 0)) <> String.slice(p, 13..15) <> "AM"
    end} </p> <p> Again, please let Jenna, Cody and Elyse know if there are any questions or concerns. </p> <h1> Thank you for serving! </h1> <p>  In Christ, the CSC Worship Leadership Team (Jenna, Cody and Elyse) </p>
    ")
    |> text_body("Hello #{user.name}! \n This email is to let you know that the service at CSC on #{p = to_string(user.date)
    String.slice(p, 5..7) <> String.slice(p, 8..9) <> "-" <> String.slice(p, 0..3)} has had a rehearsal time change. \n The previous rehearsal time: #{p = to_string(user.rehearsal1)
    day = CscWorshipWeb.ServiceController.day_of_week(user.rehearsal1) <> ", " <> String.slice(p, 5..7) <> String.slice(p, 8..9) <> "-" <> String.slice(p, 0..3) <> ", "
    p2 = Integer.parse(String.slice(p, 11..12))
    if Kernel.elem(p2, 0)- 12 >= 0 do
      day <> "at " <> to_string(Kernel.elem(p2, 0)- 12) <> String.slice(p, 13..15) <> "PM"
    else
     day <> "at " <> to_string(Kernel.elem(p2, 0)) <> String.slice(p, 13..15) <> "AM"
    end} \n The new rehearsal time: #{p = to_string(user.rehearsal2)
    day = CscWorshipWeb.ServiceController.day_of_week(user.rehearsal2) <> ", " <> String.slice(p, 5..7) <> String.slice(p, 8..9) <> "-" <> String.slice(p, 0..3) <> ", "
    p2 = Integer.parse(String.slice(p, 11..12))
    if Kernel.elem(p2, 0)- 12 >= 0 do
      day <> "at " <> to_string(Kernel.elem(p2, 0)- 12) <> String.slice(p, 13..15) <> "PM"
    else
     day <> "at " <> to_string(Kernel.elem(p2, 0)) <> String.slice(p, 13..15) <> "AM"
    end} \n Again, please let Jenna, Cody and Elyse know if there are any questions or concerns. \n Thank you for serving! \n In Christ, the CSC Worship Leadership Team (Jenna, Cody and Elyse)")
  end
    def volunteer_not_email(user) do
      new()
      |> to(user)
      |> from({"Cody Clair", "cr-clair@wiu.edu"})
      |> subject("Test")
      |> html_body("<p> TEST </p>")
      |> text_body("TEST")
    end

    def no_longer_serving(user) do
      new()
      |> to({user.name, user.email})
      |> from({"Cody Clair", "cr-clair@wiu.edu"})
      #|> cc([{"Jenna Bloodworth", "jc-bloodworth@wiu.edu"}, {"Elyse Hutchins", "em-hutchins@wiu.edu"}])
      |> subject("CSC Worship: You are no longer serving this week!")
      |> html_body("<p> This email is to inform you that you are no longer scheduled for '#{to_string(user.instrument)}' on #{p = to_string(user.date)
      String.slice(p, 5..7) <> String.slice(p, 8..9) <> "-" <> String.slice(p, 0..3)} at CSC. </p> <h3> If there is anything else we can do, please let us know! God bless. </h3> <p> In Christ, the CSC Worship Leadership Team (Jenna, Cody and Elyse) </p>")
      |> text_body("This email is to inform you that you are no longer scheduled for '#{to_string(user.instrument)}' on #{p = to_string(user.date)
      String.slice(p, 5..7) <> String.slice(p, 8..9) <> "-" <> String.slice(p, 0..3)} at CSC. \n If there is anything else we can do, please let Jenna, Cody or Elyse know! God bless. \n In Christ, the CSC Worship Leadership Team (Jenna, Cody and Elyse)")
      #|> attachment(%Swoosh.Attachment{
      #     path: "C:/Users/codyc/Downloads/csclogo.jpg",
      #     filename: "csclogo.jpg",
      #     cid: "csc_logo",
      #     type: :inline,
      #     content_type: "image/png"
      # })
    end
end
