ActiveAdmin.register Contract do
  permit_params :participant_id, :team_id, :position_cd, :start_date, :end_date  
end
