Rails.application.config.assets.precompile += 
%w( staff.css admin.css customer.css visitor.css staff.js admin.js customer.js visitor.js )

Sprockets::Context.send(:include, Rails.application.routes.url_helpers)