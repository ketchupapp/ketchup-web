module FriendsHelper
  def time_ago(time)
    time ? time_ago_in_words(time) + " ago" : "not yet"
  end
end
