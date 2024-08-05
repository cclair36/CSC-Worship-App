defmodule CscWorshipWeb.Router do
  use CscWorshipWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {CscWorshipWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CscWorshipWeb do
    pipe_through :browser

    get "/", PageController, :home
    resources "/services", ServiceController
    resources "/slides", SlideController
    resources "/sounds", SoundController
    resources "/keyboards", KeyboardController
    resources "/ac_guitar", AcousticController
    resources "/el_guitar", ElectricController
    resources "/speakers", SpeakerController
    resources "/vocalists", VocalistController
    resources "/drummers", DrummerController
    resources "/submitter_autocomplete", SubmiterAutocompleteController
    resources "/songs", SongController
    resources "/bassists", BassistController
  end

  # Other scopes may use custom stacks.
  # scope "/api", CscWorshipWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:csc_worship, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: CscWorshipWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
