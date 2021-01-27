ActiveAdmin.register League do
  permit_params :name, :team_size, :first_team_size, :country_id
end
