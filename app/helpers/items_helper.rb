module ItemsHelper
  def favorited_class(item, user)
    Favorite.find_by(item: item, user: user) ? "favorited" : ""

  end
end
