* User accounts (https://carsonrcole.com/blog/posts/rolling-your-own-authentication-in-rails-5):
    * enable bcrypt in Gemfile + `bundle`
    * Generate index `rails generate controller Home index`
    * Generate and migrate `users` table: `rails generate scaffold User email:uniq password:digest && rails db:migrate`
    * Add a model validator `validates :email, uniqueness: true`
    * Generate sessions. Only controller, no need for a UI `rails generate controller sessions new create destroy`
    * Modify login (session/new) page and controller(sessions/{create,destroy}). `sessions` seems to be a magic Ruby word
      that persists in memory (disk? DB?) Answers this way: [https://www.justinweiss.com/articles/how-rails-sessions-work/]
      `session` is indeed special, stored by default in cookies, can be moved in memcache or in legit DB. It's setup in
      `config/anvironments/*.rb:config.cache_store`, and it's different in Rails < 5.0.
    * Force redirection to login/signup when not logged in, by tuning `application_controller.rb`; also, provide
      an always-accessible `current_user` method.
    * Exempt `sessions_controller` and parts of `users_controller` from session checking.
    * Display logged in user in `home#index`.

* My components: goods, loans and person.
    * goods have a owner, a name and a text description; images will be added later.
        * `rails generate scaffold Good name:string description:string owner:references`
        * `rails db:migrate`