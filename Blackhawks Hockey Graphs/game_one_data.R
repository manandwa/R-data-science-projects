goals <- CHI_Playoff_data %>% filter(event_type == "GOAL")

goals_by_team <- goals %>% group_by(goals$event_team)

rm(goals_by_team)
