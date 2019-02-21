module Recommendation
  def recommend_movies
    other_users = self.class.all.where.not(id: self.id)
    recommended = Hash.new(0)
    other_users.each do |user|
      common_movies = user.movies & self.movies
      weight = common_movies.size.to_f / user.movies.size
      (user.movies - common_movies).each do |movie|
        recommended[movie] += weight
      end
    end
    sorted_recommended = recommended.sort_by { |key, value| value }.reverse
  end
end