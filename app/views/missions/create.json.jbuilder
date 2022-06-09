if @mission.persisted?
  json.form json.partial!("mission_completed.html.erb", missions: @missions, missionSetup: MissionSetup.new)
else
  # json.form json.partial!("mission/index", missions: @missions, missions: @mission_setup)
end
