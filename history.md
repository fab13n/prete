* User accounts (https://carsonrcole.com/blog/posts/rolling-your-own-authentication-in-rails-5):
    * enable bcrypt in Gemfile + `bundle`
    * Generate index `rails generate controller Home index`
    * Generate and migrate `users` table: `rails generate scaffold User email:uniq password:digest && rails db:migrate`
    * Add a model validator `validates :email, uniqueness: true`
