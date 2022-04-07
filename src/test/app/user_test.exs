defmodule DatingApp.UserTest do
  use DatingApp.DataCase

  alias DatingApp.User

  describe "profiles" do
    alias DatingApp.User.Profile

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def profile_fixture(attrs \\ %{}) do
      {:ok, profile} =
        attrs
        |> Enum.into(@valid_attrs)
        |> User.create_profile()

      profile
    end

    test "list_profiles/0 returns all profiles" do
      profile = profile_fixture()
      assert User.list_profiles() == [profile]
    end

    test "get_profile!/1 returns the profile with given id" do
      profile = profile_fixture()
      assert User.get_profile!(profile.id) == profile
    end

    test "create_profile/1 with valid data creates a profile" do
      assert {:ok, %Profile{} = profile} = User.create_profile(@valid_attrs)
    end

    test "create_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = User.create_profile(@invalid_attrs)
    end

    test "update_profile/2 with valid data updates the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{} = profile} = User.update_profile(profile, @update_attrs)
    end

    test "update_profile/2 with invalid data returns error changeset" do
      profile = profile_fixture()
      assert {:error, %Ecto.Changeset{}} = User.update_profile(profile, @invalid_attrs)
      assert profile == User.get_profile!(profile.id)
    end

    test "delete_profile/1 deletes the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{}} = User.delete_profile(profile)
      assert_raise Ecto.NoResultsError, fn -> User.get_profile!(profile.id) end
    end

    test "change_profile/1 returns a profile changeset" do
      profile = profile_fixture()
      assert %Ecto.Changeset{} = User.change_profile(profile)
    end
  end

  describe "likes" do
    alias DatingApp.User.Like

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def like_fixture(attrs \\ %{}) do
      {:ok, like} =
        attrs
        |> Enum.into(@valid_attrs)
        |> User.create_like()

      like
    end

    test "list_likes/0 returns all likes" do
      like = like_fixture()
      assert User.list_likes() == [like]
    end

    test "get_like!/1 returns the like with given id" do
      like = like_fixture()
      assert User.get_like!(like.id) == like
    end

    test "create_like/1 with valid data creates a like" do
      assert {:ok, %Like{} = like} = User.create_like(@valid_attrs)
    end

    test "create_like/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = User.create_like(@invalid_attrs)
    end

    test "update_like/2 with valid data updates the like" do
      like = like_fixture()
      assert {:ok, %Like{} = like} = User.update_like(like, @update_attrs)
    end

    test "update_like/2 with invalid data returns error changeset" do
      like = like_fixture()
      assert {:error, %Ecto.Changeset{}} = User.update_like(like, @invalid_attrs)
      assert like == User.get_like!(like.id)
    end

    test "delete_like/1 deletes the like" do
      like = like_fixture()
      assert {:ok, %Like{}} = User.delete_like(like)
      assert_raise Ecto.NoResultsError, fn -> User.get_like!(like.id) end
    end

    test "change_like/1 returns a like changeset" do
      like = like_fixture()
      assert %Ecto.Changeset{} = User.change_like(like)
    end
  end

  describe "matches" do
    alias DatingApp.User.Match

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def match_fixture(attrs \\ %{}) do
      {:ok, match} =
        attrs
        |> Enum.into(@valid_attrs)
        |> User.create_match()

      match
    end

    test "list_matches/0 returns all matches" do
      match = match_fixture()
      assert User.list_matches() == [match]
    end

    test "get_match!/1 returns the match with given id" do
      match = match_fixture()
      assert User.get_match!(match.id) == match
    end

    test "create_match/1 with valid data creates a match" do
      assert {:ok, %Match{} = match} = User.create_match(@valid_attrs)
    end

    test "create_match/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = User.create_match(@invalid_attrs)
    end

    test "update_match/2 with valid data updates the match" do
      match = match_fixture()
      assert {:ok, %Match{} = match} = User.update_match(match, @update_attrs)
    end

    test "update_match/2 with invalid data returns error changeset" do
      match = match_fixture()
      assert {:error, %Ecto.Changeset{}} = User.update_match(match, @invalid_attrs)
      assert match == User.get_match!(match.id)
    end

    test "delete_match/1 deletes the match" do
      match = match_fixture()
      assert {:ok, %Match{}} = User.delete_match(match)
      assert_raise Ecto.NoResultsError, fn -> User.get_match!(match.id) end
    end

    test "change_match/1 returns a match changeset" do
      match = match_fixture()
      assert %Ecto.Changeset{} = User.change_match(match)
    end
  end

  describe "messages" do
    alias DatingApp.User.Messages

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def messages_fixture(attrs \\ %{}) do
      {:ok, messages} =
        attrs
        |> Enum.into(@valid_attrs)
        |> User.create_messages()

      messages
    end

    test "list_messages/0 returns all messages" do
      messages = messages_fixture()
      assert User.list_messages() == [messages]
    end

    test "get_messages!/1 returns the messages with given id" do
      messages = messages_fixture()
      assert User.get_messages!(messages.id) == messages
    end

    test "create_messages/1 with valid data creates a messages" do
      assert {:ok, %Messages{} = messages} = User.create_messages(@valid_attrs)
    end

    test "create_messages/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = User.create_messages(@invalid_attrs)
    end

    test "update_messages/2 with valid data updates the messages" do
      messages = messages_fixture()
      assert {:ok, %Messages{} = messages} = User.update_messages(messages, @update_attrs)
    end

    test "update_messages/2 with invalid data returns error changeset" do
      messages = messages_fixture()
      assert {:error, %Ecto.Changeset{}} = User.update_messages(messages, @invalid_attrs)
      assert messages == User.get_messages!(messages.id)
    end

    test "delete_messages/1 deletes the messages" do
      messages = messages_fixture()
      assert {:ok, %Messages{}} = User.delete_messages(messages)
      assert_raise Ecto.NoResultsError, fn -> User.get_messages!(messages.id) end
    end

    test "change_messages/1 returns a messages changeset" do
      messages = messages_fixture()
      assert %Ecto.Changeset{} = User.change_messages(messages)
    end
  end
end
