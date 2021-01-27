ActiveAdmin.register Participant do
  permit_params :first_name, :last_name, :date_of_birth, :country_id, :caree_start, :caree_end  
end
