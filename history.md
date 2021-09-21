* User accounts:
    * enable bcrypt in Gemfile + `bundle`
    * Generate index `rails generate controller Home index`
    * Generate and migrate `users` table: `rails generate scaffold User email:uniq password:digest && rails db:migrate`
    