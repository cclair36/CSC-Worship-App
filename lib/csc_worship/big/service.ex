defmodule CscWorship.Big.Service do
  use Ecto.Schema
  import Ecto.Changeset

  schema "services" do
    field :date, :utc_datetime
    field :songs, {:array, :string}
    field :notes, :string
    field :submitter, :string
    field :rehearsal_time1, :utc_datetime
    field :rehearsal_time_2, :utc_datetime
    belongs_to :drums, CscWorship.Musicians.Drummer, foreign_key: :drummer
    belongs_to :piano, CscWorship.Musicians.Keyboard, foreign_key: :keyboard
    belongs_to :acoustic_guitar, CscWorship.Musicians.Acoustic, foreign_key: :acoustic
    belongs_to :electric_guitar, CscWorship.Musicians.Electric, foreign_key: :electric
    belongs_to :singer, CscWorship.Musicians.Vocalist, foreign_key: :vocalist1
    belongs_to :singer2, CscWorship.Musicians.Vocalist, foreign_key: :vocalist2
    belongs_to :singer3, CscWorship.Musicians.Vocalist, foreign_key: :vocalist3
    belongs_to :singer4, CscWorship.Musicians.Vocalist, foreign_key: :vocalist4
    belongs_to :projection, CscWorship.Musicians.Slide, foreign_key: :slides
    belongs_to :sounds, CscWorship.Musicians.Sound, foreign_key: :sound
    belongs_to :sound_board, CscWorship.Musicians.Sound, foreign_key: :sound2
    belongs_to :speaker, CscWorship.Musicians.Speaker, foreign_key: :preacher
    belongs_to :bass, CscWorship.Musicians.Bassist, foreign_key: :bassist_id
    field :email_sent, :boolean
    field :updated, :boolean
    field :service_order, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(service, attrs) do
    service
    |> cast(attrs, [:songs, :notes, :bassist_id, :submitter, :service_order, :rehearsal_time1, :rehearsal_time_2, :date, :drummer, :keyboard, :electric, :acoustic, :vocalist1, :vocalist2, :vocalist3, :vocalist4, :slides, :sound, :sound2, :preacher, :email_sent, :updated])
    |> validate_required([:date])
    |> foreign_key_constraint(:drummer)
    |> foreign_key_constraint(:keyboard)
    |> foreign_key_constraint(:electric)
    |> foreign_key_constraint(:acoustic)
    |> foreign_key_constraint(:vocalist1)
    |> foreign_key_constraint(:vocalist2)
    |> foreign_key_constraint(:vocalist3)
    |> foreign_key_constraint(:vocalist4)
    |> foreign_key_constraint(:slides)
    |> foreign_key_constraint(:sound)
    |> foreign_key_constraint(:preacher)
    |> foreign_key_constraint(:bassist_id)
    |> foreign_key_constraint(:sounds2)
  end

    def email_list(_changeset, attrs) do
      special_fields = Map.take(attrs, [:drums, :piano, :bass, :acoustic_guitar, :electric_guitar, :singer, :singer4, :singer2, :singer3, :speaker, :projection, :sounds, :sound_board])
    end
  end
