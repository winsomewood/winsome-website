# # These 2 requires are needed for this to run on staging and production
# # https://github.com/sferik/rails_admin/issues/887#issuecomment-636622362
# require "nested_form/engine"
# require "nested_form/builder_mixin"

# RailsAdmin.config do |c|
#   c.excluded_models = ["Comment", "Replacement"]

#   if Rails.env == 'production'
#     c.authorize_with do
#       authenticate_or_request_with_http_basic('Site Password is Required') do |username, password|
#         username == 'root' && password == ENV["WINSOME_WEBSITE_RAILS_ADMIN_PASSWORD"]
#       end
#     end
#   end
# end