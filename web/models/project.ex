defmodule CrowdfundingApi.Project do
  use CrowdfundingApi.Web, :model
  require IEx

  schema "projects" do
    field :title, :string
    field :image_url, :string
    field :video_url, :string
    field :goal_amount, :integer
    field :funding_model, :string
    field :start_date, Ecto.DateTime
    field :duration, :integer
    field :approved, :boolean
    belongs_to :category, CrowdfundingApi.Category

    has_many :rewards, CrowdfundingApi.Reward, on_delete: :delete_all
    has_many :faqs, CrowdfundingApi.Faq, on_delete: :delete_all
    has_many :links, CrowdfundingApi.Link, on_delete: :delete_all
    has_many :events, CrowdfundingApi.Event, on_delete: :delete_all
    has_one :story, CrowdfundingApi.Story, on_delete: :delete_all

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    Map.put(params, :image_url, upload_image(params))
    struct
    |> cast(params, [:title, :image_url, :video_url, :goal_amount, :funding_model, :start_date, :duration, :approved])
    # |> validate_required([:title, :image_url, :video_url, :goal_amount, :funding_model, :start_date, :duration])
    # |> validate_url(:image_url, %{ message: "invalid image url" })
    # |> validate_url(:video_url, %{ message: "invalid image url" })
    |> cast_assoc(:rewards)
    |> cast_assoc(:faqs)
    |> cast_assoc(:links)
    |> cast_assoc(:events)
    |> cast_assoc(:story)
  end

  def validate_url(changeset, field, options \\ []) do
    validate_change changeset, field, fn _, url ->
      case url |> String.to_char_list |> :http_uri.parse do
        {:ok, _} -> []
        {:error, msg} -> [{field, options[:message] || "invalid url: #{inspect msg}"}]
      end
    end
  end

  def upload_image(params) do
    
    cld_api_key = System.get_env("CLOUDINARY_API_KEY")
    cld_cloud_name = System.get_env("CLOUDINARY_CLOUD_NAME")
    timestamp = :os.system_time(:second)
    
    sha1hash =
      :crypto.hash(:sha, "public_id=project_image&timestamp=#{timestamp}#{cld_api_key}")
      |> Base.encode16
      |> String.downcase
    
    resp = HTTPotion.post(
      "https://api.cloudinary.com/v1_1/#{cld_cloud_name}/image/upload",
      [
        body: "file=#{params["image_data"]}&signature=#{sha1hash}"
      ]
    )

    resp
  end
end
