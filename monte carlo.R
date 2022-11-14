## translating Monte Carlo example from class from Stata to R
## no need to write gen to define vars
## use <- rather than = to define vars

## base case parameters
population <- 164250
households <- 39050
initial_waste <- 3.6
waste_growth <- 0.02
capital_costs <- 1688000
scrap_value <- 0.2 * capital_costs
tipping_fee <- 45
paper_price <- 22
percent_paper <- 0.32
percent_separated <- 0.7
percent_saleable <- 0.8
collection_cost <- 6
return_cost <- 4
d <- 0.06

## household separation costs
cost_per_household <- 0
separation_cost <- cost_per_household * households

## calculate pv of capital costs minus scrap value
pv_capital_scrap <- capital_costs - scrap_value / (1 + d)^8

## calculate total waste generated in years 1 to 8 (tons per year)
total_waste1 <- initial_waste * population * 365 / 2000
added_waste <- waste_growth * population * 365 / 2000
total_waste2 <- total_waste1 + added_waste
total_waste3 <- total_waste2 + added_waste
total_waste4 <- total_waste3 + added_waste
total_waste5 <- total_waste4 + added_waste
total_waste6 <- total_waste5 + added_waste
total_waste7 <- total_waste6 + added_waste
total_waste8 <- total_waste7 + added_waste

## calculate total paper diverted each year (tons per year)
diverted_paper1 <- percent_paper * percent_separated * total_waste1
diverted_paper2 <- percent_paper * percent_separated * total_waste2
diverted_paper3 <- percent_paper * percent_separated * total_waste3
diverted_paper4 <- percent_paper * percent_separated * total_waste4
diverted_paper5 <- percent_paper * percent_separated * total_waste5
diverted_paper6 <- percent_paper * percent_separated * total_waste6
diverted_paper7 <- percent_paper * percent_separated * total_waste7
diverted_paper8 <- percent_paper * percent_separated * total_waste8

## calculate annual benefits from paper diverted and sold ($ per year)
recycling_b1 <- (tipping_fee + paper_price) * diverted_paper1 * percent_saleable
recycling_b2 <- (tipping_fee + paper_price) * diverted_paper2 * percent_saleable
recycling_b3 <- (tipping_fee + paper_price) * diverted_paper3 * percent_saleable
recycling_b4 <- (tipping_fee + paper_price) * diverted_paper4 * percent_saleable
recycling_b5 <- (tipping_fee + paper_price) * diverted_paper5 * percent_saleable
recycling_b6 <- (tipping_fee + paper_price) * diverted_paper6 * percent_saleable
recycling_b7 <- (tipping_fee + paper_price) * diverted_paper7 * percent_saleable
recycling_b8 <- (tipping_fee + paper_price) * diverted_paper8 * percent_saleable

## calculate annual costs from collecting paper ($ per year)
collection_c1 <- collection_cost * total_waste1
collection_c2 <- collection_cost * total_waste2
collection_c3 <- collection_cost * total_waste3
collection_c4 <- collection_cost * total_waste4
collection_c5 <- collection_cost * total_waste5
collection_c6 <- collection_cost * total_waste6
collection_c7 <- collection_cost * total_waste7
collection_c8 <- collection_cost * total_waste8

## calculate annual costs from returning paper to landfill ($ per year)
landfill_c1 <- return_cost * diverted_paper1 * (1 - percent_saleable)
landfill_c2 <- return_cost * diverted_paper2 * (1 - percent_saleable)
landfill_c3 <- return_cost * diverted_paper3 * (1 - percent_saleable)
landfill_c4 <- return_cost * diverted_paper4 * (1 - percent_saleable)
landfill_c5 <- return_cost * diverted_paper5 * (1 - percent_saleable)
landfill_c6 <- return_cost * diverted_paper6 * (1 - percent_saleable)
landfill_c7 <- return_cost * diverted_paper7 * (1 - percent_saleable)
landfill_c8 <- return_cost * diverted_paper8 * (1 - percent_saleable)

## calculate annual net benefits from paper waste diversions ($ per year)
b1 <- recycling_b1 - landfill_c1 - collection_c1 - separation_cost
b2 <- recycling_b2 - landfill_c2 - collection_c2 - separation_cost
b3 <- recycling_b3 - landfill_c3 - collection_c3 - separation_cost
b4 <- recycling_b4 - landfill_c4 - collection_c4 - separation_cost
b5 <- recycling_b5 - landfill_c5 - collection_c5 - separation_cost
b6 <- recycling_b6 - landfill_c6 - collection_c6 - separation_cost
b7 <- recycling_b7 - landfill_c7 - collection_c7 - separation_cost
b8 <- recycling_b8 - landfill_c8 - collection_c8 - separation_cost


## calculate present value of net benefits of the program ($)
PVNB <- b1 /(1+d) + b2/(1+d)^2 + b3/(1+d)^3 + b4/(1+d)^4 + b5/(1+d)^5 + b6/(1+d)^6 + b7/(1+d)^7 + b8/(1+d)^8 - pv_capital_scrap 


#this is bailie typing

madeupvar <- 0

#changes here
