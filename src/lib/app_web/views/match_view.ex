defmodule DatingAppWeb.MatchView do
  use DatingAppWeb, :view
  alias DatingAppWeb.MatchView

  def render("index.json", %{matches: matches}) do
    %{data: render_many(matches, MatchView, "match.json")}
  end

  def render("show.json", %{match: match}) do
    %{data: render_one(match, MatchView, "match.json")}
  end

  def render("match.json", %{match: match}) do
    %{ matched: MapSet.to_list(match.matched), pending: MapSet.to_list(match.pending), received: MapSet.to_list(match.received)}
  end
end
