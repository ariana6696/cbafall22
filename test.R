###
set.seed(2500)
n_trials <- 10000
track_trials <- data.frame(n = c(1:n_trials), population = 164250, households = 39050, initial_waste = 3.6, waste_growth = 0.02, capital_costs = 1688000, scrap_value = 0.2 * capital_costs, tipping_fee = 45, paper_price = 22, percent_paper = 0.32, percent_separated = 0.7, percent_saleable = 0.8, collection_cost = 6, return_cost = 4, d = 0.06)



