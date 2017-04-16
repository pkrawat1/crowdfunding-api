# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CrowdfundingApi.Repo.insert!(%CrowdfundingApi.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

[
	"Art", "Comics", "Crafts", "Dance", "Community", "Fashion", "Film", "Video",
	"Food", "Games", "Music", "Photography", "Publishing", "Technology", "Theater"
]
|> Enum.map(
	fn(name) ->
		CrowdfundingApi.Repo.insert!(%CrowdfundingApi.Category{
			name: name
		})
	end
)
