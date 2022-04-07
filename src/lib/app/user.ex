defmodule DatingApp.User do
  @moduledoc """
  The User context.
  """
  alias DatingApp.Profile
  alias DatingApp.Matches

  @doc """
  Returns the list of profiles.

  ## Examples

      iex> list_profiles()
      [%Profile{}, ...]

  """
  def list_profiles do
    []
  end


  @doc """
  Creates a profile.

  ## Examples

      iex> create_profile(%{field: value})
      {:ok, %Profile{}}

      iex> create_profile(%{field: bad_value})
      {:error, ...}

  """
  def create_profile(id) do
    Profile.open(id)
  end

  @doc """
  Creates a like.

  ## Examples

      iex> create_like(%{field: value})
      {:ok, %Like{}}

      iex> create_like(%{field: bad_value})
      {:error, ...}

  """
  def create_like(attrs) do
    Profile.like(attrs.id, attrs.liked_id)
  end

  @doc """
  Returns the list of matches.

  ## Examples

      iex> list_matches()
      [%Match{}, ...]

  """
  def list_matches(id) do
    [Matches.get(id)]
  end

  @doc """
  Gets a single messages.

  Raises if the Messages does not exist.

  ## Examples

      iex> get_messages!(123)
      %Messages{}

  """
  def get_messages!(id) do
    DatingApp.Messages.get(id)
  end

  def create_message(from, to, message) do
    DatingApp.Messenger.message(from, to, message)
  end
end
