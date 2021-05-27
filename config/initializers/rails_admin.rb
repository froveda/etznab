RailsAdmin.config do |config|
  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    toggle
  end

  # Show empty fields
  config.compact_show_view = false
end
