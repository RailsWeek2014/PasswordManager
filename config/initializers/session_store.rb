# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_passwordmanager_session'

#Term for searching
Rails.application.config.session_store :cookie_store, key: 'search_string'

#Where to search
#1: everywhere
#2: login
#3: url
Rails.application.config.session_store :cookie_store, key: 'search_where'

#orderBy
#1 login ASC
#2 login DESC
#3 url ASC
#4 url DESC
Rails.application.config.session_store :cookie_store, key: 'order_by'