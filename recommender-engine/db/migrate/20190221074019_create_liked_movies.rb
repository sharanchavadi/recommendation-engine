class CreateLikedMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :liked_movies do |t|
      t.integer :user_id
      t.integer :movie_id
    end
  end
end
