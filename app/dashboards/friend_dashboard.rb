require "administrate/base_dashboard"

class FriendDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    catchups: Field::HasMany,
    last_catchup: Field::HasOne.with_options(class_name: "Catchup"),
    id: Field::Number,
    name: Field::String,
    nickname: Field::String,
    avatar_url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :catchups,
    :last_catchup,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :catchups,
    :last_catchup,
    :id,
    :name,
    :nickname,
    :avatar_url,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :catchups,
    :last_catchup,
    :name,
    :nickname,
    :avatar_url,
  ].freeze

  # Overwrite this method to customize how friends are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(friend)
    "#{friend.display_name} (##{friend.id})"
  end
end
