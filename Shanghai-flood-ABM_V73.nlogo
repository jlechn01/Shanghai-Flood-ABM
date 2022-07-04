extensions [csv bitmap]

;//////////////////////////////////////////////////////////////////////////////////GLOBAL PARAMETERS
globals [
  ;Results from binary logistics regression for 13 variables for measures elevation, wet-proofing, dry-proofing
  Oddsratio_fl_prob_percpt        ;number list: Odds ratios perceived flood probability of adaptation measure
  Oddsratio_fl_dam_percpt         ;number list: Odds ratios perceived flood damage of adaptation measure
  Oddsratio_worry                 ;number list: Odds ratios worry of adaptation measure
  Oddsratio_Resp_Eff              ;number list: Odds ratios response efficacy of adaptation measure
  Oddsratio_Self_Eff              ;number list: Odds ratios self efficacy of adaptation measure
  Oddsratio_cost_percpt           ;number list: Odds ratios perceived cost of adaptation measure
  Oddsratio_UG_other              ;number list: Odds ratios undergone other measures of adaptation measure
  Oddsratio_fl_exp                ;number list: Odds ratios flood experience of adaptation measure
  Oddsratio_age                   ;number list: Odds ratios age of adaptation measure
  Oddsratio_edu                   ;number list: Odds ratios education level of adaptation measure
  Oddsratio_CC_belief             ;number list: Odds ratios personal beliefs on effects of climate change of adaptation measure
  Oddsratio_soc_inf               ;number list: Odds ratios effect of social netowrk on household adaptation of adaptation measure
  Oddsratio_soc_media             ;number list: Odds ratios effect of social media on household adaptation of adaptation measure
  Constant                        ;number list: Odds ratio constant/intercept for adaption measure

  Stochasticity_fl_exp_OR?        ;binary: Indicates if the flood experience odds ratio is varied between the mean and the standard deviation
  odds_ratio_fl_exp_low           ;number list: odds ratio lower bound (exp(b - sd))
  odds_ratio_fl_exp_high          ;number list: odds ratio lower bound (exp(b + sd))

  ;Result from linear regression for the influence of the social network size on the social influence parameter
  Beta_soc_inf                    ;number: Beta factor of the regressionn
  Intercept_soc_inf               ;number: Intercept/Constant of the regression

  ;Adaptation effectiveness
  Effectiv                        ;number list: Effectivness in reducing building and content damage (this parameter is used by the behaviourspace in order to vary both building and content damage at the same time!)
  Effectiv_build                  ;number list: Effectiveness in reducing building damage of adaptation measure
  Effectiv_cont                   ;number list: Effectiveness in reducing content damage of adaptation measure
  Effectiv_lvl                    ;number list: Inundation level below which adaptation measure is effective

  ;Cost
  Cost_fix                        ;number list: Fixed implementation cost in EUR of the adaptation measure
  Cost_var                        ;number list: Variable implementation cost of the adaptation measure (for dry- and wet-proofing in EUR/m2 and for elevation in EUR/m3)

  ;Time: (1 year = 1 tick)
  ;Time_horizon                   ;number: Simulation time in years - Declared and initiated VIA GUI!
  Life_time                       ;number list: Lifetime in years of the adaptation measure
  Implement_time                  ;number list: Implementation time in years of the adaptation measure
  Time_horizon_prec_implement     ;number: Captures the time-horizon in number of years in which households could have implemented a measure preceding the start of the simulation

  ;Damage
  ;Foundation_height               ;number: Height of the building foundation in meter - Setup in GUI
  Depth_dam_build                 ;number list: Stepwise depth-damage function for building structure for different inundation depth ranges
  Depth_dam_cont                  ;number list: Stepwise depth-damage function for building content for different inundation depth ranges
  Perc_cont                       ;number: Percentage of content value of building value
  Sqm_value                       ;number list: Value for building structure and content in EUR/m2

  ;Flood
  fl_scenario                     ;number list: Flood scenario per year with one of following scenarios mentioned in flood scenario names or "no_flood"
  fl_scenario_names               ;string list: List with names of the predetemrined flood scenarios from Yin et al. (2020) -> names loaded from csv
  position_fl_scenario            ;number: position of the flood-scenario in the list fl_scenario names which allows us to determine position of the flood inundation value in the inund list that we need to choose

  ;General
  Selected_districts              ;string list: List with names of districts which are selected for the simulation run from the switches on the interface

  ;Social network
  Max_social_network_size         ;number: Maximum amount of predetermined nearest neighbours available per Household
  Difference_soc_net_adapted_soc_net ;number: This value captures by how much larger the social network of a household is compared to the portion of the social network which adapted. E.g., value 3 would mean that if 4 hhs in my social network adapted a measure, my entire social network size is 12

  ;Verfication & Debugging
  Total_adapt_count_change_indirect_NNs ;counts the changes at the indirect nearest neighbour level
  Total_adapt_count_change_HHs          ;counts the changes at the household level

  ;Tracker variables for output analysis declared in the following:

  ;Adaptation diffusion -> what is the adaptation diffusion of different adaptation measures
  ;Percentage of households that...
  Adapted_none
  Adapted_elev
  Adapted_wet
  Adapted_dry
  Adapted_elev_wet
  Adapted_elev_dry
  Adapted_wet_dry
  Adapted_all
  Adapted_at_least_one

  ;Total flood dmage
  Sum_fl_dam_build
  Sum_fl_dam_cont

  ;Adaptation effectiveness -> how effective are adaptation measures in reducing flood damage
  Benefit_all_elev
  Benefit_all_elev_build
  Benefit_all_elev_cont
  Benefit_all_wet
  Benefit_all_wet_build
  Benefit_all_wet_cont
  Benefit_all_dry
  Benefit_all_dry_build
  Benefit_all_dry_cont

  ;Total adaptation cost of measures.
  Cost_all_elev
  Cost_all_wet
  Cost_all_dry

  ;Total savings of households.
  Total_savings

  ;Total number of households that cannot afford adaptation but want to adapt.
  Cannot_afford

  ;Number of households with flood experience level
  No_Fl_Exp
  Very_Low_Fl_Exp
  Low_Fl_Exp
  Medium_Fl_Exp
  High_Fl_Exp
  Very_High_Fl_Exp

  ;In the following we define the tracker variables for worry, self efficacy, social network, and income the number of households within each attribute level group for each measure category the number of households that adapted the measure, the mitigated damage by the measure, and the total flood damage

  ;Worry
  Adapted_elev_worry_low
  Adapted_elev_worry_medium
  Adapted_elev_worry_high

  Adapted_wet_worry_low
  Adapted_wet_worry_medium
  Adapted_wet_worry_high

  Adapted_dry_worry_low
  Adapted_dry_worry_medium
  Adapted_dry_worry_high

  Benefit_elev_worry_low
  Benefit_elev_worry_medium
  Benefit_elev_worry_high

  Benefit_wet_worry_low
  Benefit_wet_worry_medium
  Benefit_wet_worry_high

  Benefit_dry_worry_low
  Benefit_dry_worry_medium
  Benefit_dry_worry_high

  fl_dam_worry_low
  fl_dam_worry_medium
  fl_dam_worry_high

  ;Self efficacy
  Adapted_elev_self_eff_low
  Adapted_elev_self_eff_medium
  Adapted_elev_self_eff_high

  Adapted_wet_self_eff_low
  Adapted_wet_self_eff_medium
  Adapted_wet_self_eff_high

  Adapted_dry_self_eff_low
  Adapted_dry_self_eff_medium
  Adapted_dry_self_eff_high

  Benefit_elev_self_eff_low
  Benefit_elev_self_eff_medium
  Benefit_elev_self_eff_high

  Benefit_wet_self_eff_low
  Benefit_wet_self_eff_medium
  Benefit_wet_self_eff_high

  Benefit_dry_self_eff_low
  Benefit_dry_self_eff_medium
  Benefit_dry_self_eff_high

  fl_dam_elev_self_eff_low
  fl_dam_elev_self_eff_medium
  fl_dam_elev_self_eff_high

  fl_dam_wet_self_eff_low
  fl_dam_wet_self_eff_medium
  fl_dam_wet_self_eff_high

  fl_dam_dry_self_eff_low
  fl_dam_dry_self_eff_medium
  fl_dam_dry_self_eff_high

  ;Social network
  Adapted_elev_soc_net_small
  Adapted_elev_soc_net_medium
  Adapted_elev_soc_net_large

  Adapted_wet_soc_net_small
  Adapted_wet_soc_net_medium
  Adapted_wet_soc_net_large

  Adapted_dry_soc_net_small
  Adapted_dry_soc_net_medium
  Adapted_dry_soc_net_large

  Benefit_elev_soc_net_small
  Benefit_elev_soc_net_medium
  Benefit_elev_soc_net_large

  Benefit_wet_soc_net_small
  Benefit_wet_soc_net_medium
  Benefit_wet_soc_net_large

  Benefit_dry_soc_net_small
  Benefit_dry_soc_net_medium
  Benefit_dry_soc_net_large

  fl_dam_soc_net_small
  fl_dam_soc_net_medium
  fl_dam_soc_net_large

  ;Income
  Adapted_Elev_Income_Low
  Adapted_Elev_Income_Medium
  Adapted_Elev_Income_High
  Adapted_wet_Income_Low
  Adapted_wet_Income_Medium
  Adapted_wet_Income_High
  Adapted_dry_Income_Low
  Adapted_dry_Income_Medium
  Adapted_dry_Income_High

  benefit_Elev_Income_Low
  benefit_Elev_Income_Medium
  benefit_Elev_Income_High
  benefit_wet_Income_Low
  benefit_wet_Income_Medium
  benefit_wet_Income_High
  benefit_dry_Income_Low
  benefit_dry_Income_Medium
  benefit_dry_Income_High

  fl_dam_Income_Low
  fl_dam_Income_Medium
  fl_dam_Income_High

]

;//////////////////////////////////////////////////////////////////////////////////HOUSEHOLD PARAMETERS
turtles-own [

  ;PMT variables
  Fl_prob_percpt                  ;number: Perceived flood probability with value range: (1) My house is completely safe - (9) More frequent than once per year
  Fl_dam_percpt                   ;number: Perceived flood damage with value range: (1) Not at all severe – (5) Very severe
  Worry                           ;number: Worry with value range: (1) Not at all worried – (5) Very worried
  Resp_Eff                        ;number list: Perceived response efficacy of measure with value range: (1) Extremely ineffective – (5) Extremely effective
  Self_Eff                        ;number list: Perceived self efficacy of measure with value range: (1) I am unable – (5) I am very able
  Cost_percpt                     ;number list: Perceived cost of measure with value range: (1) Very cheap – (5) Very expensive
  UG                              ;number list: Previously undertaken measure with value range: (1) At least one adaptation measures has been implemented within the category & (0) No adaptation measures have been implemented within the category
  UG_other                        ;number list: Previously undertaken measures within the other categories with value range: (1) At least one adaptation measure has been implemented within other measure categories & (0) No adaptation measure has been implemented within other measure categories
  Fl_exp                          ;number: Personal experienced in terms of flood damage caused by the last experienced flood: (0) 0 (1) Very Low Damage (2) Low Damage (3) Medium Damage (4) Large Damage (5) Very Large Damage
  Age                             ;number: Age with value range: (1) [16-24], (2) [25-34], (3) [35-44], (4) [45-54], (5) [55-64], (6) [65+]
  Edu                             ;number: Education level with value range: (1) < High School, (2) High School, (3) College Degree, (4) Post Graduate
  CC_belief                       ;number: Personal beliefs on effects of climate change with value range: (1) Climate change is happening & (0) Else
  Soc_inf                         ;number: Effect of social network on household adaptation with value range: (1) They do NOT expect me to prepare for flooding - (5) They strongly expect me to prepare for flooding
  Soc_media                       ;number: Effect of social media on household adaptation  with value range: (1) Very unfrequently & no trust - (5) Very frequently & trust completely

  ;Decision-making
  Odds                            ;number list: Odds of adaptation intention for each measure with value range
  Prob_implement                  ;number list: Probability of adaptation implementation for each measure computed from the odds ratios and attribute levels and adjusted by the Intention gap (therefore not called probabiltiy intention!)
  Implement_threshold             ;number list: Implementation threshold between 0 and 1 which is randomly generated every tick for every agent and measure. If a household’s probability to implement is higher or equal to the threshold, the household starts the adaptation implementation.
  Hindered_by_savings             ;binary: If households wants to implement measure but cannot do so because of missing savings: (0) No - (1) yes

  ;Building
  HH_status                       ;number: Accommodation status of household  with value range: (0) Own & (1) Rent
  Build_type                      ;string: Building type with value range: "House" & "Apartment"
  Build_size                      ;number: Size of the building in m2 with value range: (40), (63), (88), (113), (138), (181)
  Value                           ;number list: Building/Content value in EUR
  District                        ;string: District in which the residential building of the household is located

  ;Neighbourhood:

  ;Important to understand: The neighbourhood is set up of the N closest residential buildings to the household. This means that within the ABM, the neighbourhoods are onedirectional. This means that if household A is direct neighbour to household B, household B does not necessarily need to be a direct neighbour of household A, as B might have other neighbours which are closer than A: You might be closest to me and hence I am in your neighbourhood, but I might be closer to somebody else and hence you are not in mine.
  ;The reason why we include the distance to the neighbours is because location matters in flooding. If people who are phyiscally close to me adapt, then I am likely influenced by their actions compared to households which are further away and have other physical conditions (e.g., live on a hill).
  ;Therefore, we need 2 lists:
  ;One first list that captures the direct neigbhourhood, which I am influenced by (we call this list Direct_NN_IDs). TLDR: THe ones I am influenced by
  ;A second list which captures the indirect neighbourhood. These are the housholds which consider me a neighbour and hence , which I influence with my actions (Indirect_NN_IDs). TLDR: THe ones I influence
  ;Furthermore, it is important to note that only households of the same districts can be neighbours. This has the advantage that when removing a district from the simulation plan, neighbours of households do not suddenly "disappear"

  ID                              ;Number: ID of building to identify next neighbours from QGIS
  ID_survey                       ;Number: Survey ID to verify calculations
  Direct_NN_IDs                   ;Number list: IDs of the direct nearested neighbours of a household: The N closest househoolds to my household by distance within the same district to the household -> A household feels social pressure to adapt by these neighbours and is influenced by their action
  Indirect_NN_IDs                 ;Number list: IDs of the indirect nearest neighbours of a household: The households which consider myself their neighbour, as I am closest to them. My actions influence the their behaviour.
  NN_adapt                        ;Number list: Number of nearest neighbours that adapted at least one measure for each period t
  Soc_net                         ;Number: Size of social network of a household in number of households

  ;Flood
  Inund                          ;number list: Inundation level of household in meter for following flood scenarios (year-probability-RCP scenario): 20101000_both	2010100_both	201010_both	21001000_rcp8.5	20501000_rcp8.5	20301000_rcp8.5	2100100_rcp8.5	2050100_rcp8.5	2030100_rcp8.5	210010_rcp8.5	205010_rcp8.5	203010_rcp8.5	21001000_rcp2.6	20501000_rcp2.6	20301000_rcp2.6	2100100_rcp2.6	2050100_rcp2.6	2030100_rcp2.6	210010_rcp2.6	205010_rcp2.6	203010_rcp2.6	5000_Du	1000_Du	500_Du	200_Du	

  ;Cost-Benefit
  Fl_dam_build                   ;number list: Building damage from flooding at tick t in EUR
  Fl_dam_cont                    ;number list: Content damage from flooding at tick t in EUR
  B_elev                         ;number list: Benefit of elevation measure (avoided annual damage) at tick t
  B_elev_build                   ;number list: ... in reducing building damage
  B_elev_cont                    ;number list: ... in reducing content damage
  B_wet                          ;number list: Benefit of wet-proofing measure (avoided annual damage) at tick t
  B_wet_build                    ;number list: ... in reducing building damage
  B_wet_cont                     ;number list: ... in reducing content damage
  B_dry                          ;number list: Benefit of dry-proofing measure (avoided annual damage) at tick t
  B_dry_build                    ;number list: ... in reducing building damage
  B_dry_cont                     ;number list: ... in reducing content damage
  C_elev                         ;number list: Cost of elevation measure at tick t
  C_wet                          ;number list: Cost of wet-proofing measure at tick t
  C_dry                          ;number list: Cost of dry-proofing measure at tick t
  Income                         ;number: Yearly income of household
  Savings                        ;number list: Savings of household at tick t in EUR
  Yearly_change_savings          ;number: Yearly change in savings dervied from survey data

  ;Time
  Implement_start                ;number list: Starting time in ticks of implementation for each measure
  Implement_end                  ;number list: Finish time in ticks of implementation for each measure
  Life_time_indiv                ;number list: Lifetime in years of the adaptation measure for households

  ;States
  Adapt_status                   ;nested number list: Adaptation status for each measure with value range: (0) Do nothing, (1) Measure implementation is started, (2) Measure is implemented - for each of the ticks t: [ [] [] [] ]
  Flooded?                       ;boolean: Residential building is flooded (if inundation depth > foundation_height) (not taking into account the effect of adaptation measures such as elevation) with value range: (TRUE) Building is flooded & (FALSE) Building is not flooded
]

;//////////////////////////////////////////////////////////////////////////////////PATCH PARAMETERS
patches-own [
  District_name                    ;string: Name of the district
]

;//////////////////////////////////////////////////////////////////////////////////SETUP
to setup
  clear-all
  ;clear-ticks
  ;clear-output
  ;clear-all-plots
  print ("-------------")
  print (word "Setup started at " date-and-time)
  quick-setup-flood-scenarios
  quick-setup-sensitivity-scenarios
  quick-setup-effectiveness
  quick-setup-effectiveness-level
  reset-ticks; normally reset ticks is done at the end of the setup procedure. However, within the setup functions are used that require the current tick level (e.g. setup cost). Therefore, it is placed here!
  initiate-global-parameters
  setup-map
  initiate-households-parameters
  update-agent-and-global-parameters
  print (word "Agent and Global Parameters updated")
  print-configuration
  print (word "Setup finished at " date-and-time)
  print ("-------------")
end

to quick-setup-flood-scenarios ;this function helps for simulating pre-determined flood scenarios via the behaviourspace
  (ifelse
    (Quick_Flood_Scenario_Selector = "No flood") [; No flood occurs
      Set Flood_1? FALSE
      Set Flood_2? FALSE
      Set Flood_3? FALSE
    ]
    (Quick_Flood_Scenario_Selector = "2021_100_RCP8.5") [; one 100 year flood occurs for the rcp 8.5 scenario in year 2021
      Set Flood_1? TRUE
      Set Flood_2? FALSE
      Set Flood_3? FALSE

      Set Occurance_flood_1 2021
      Set Probability_flood_1 "100-year flood (1%)"
      Set Representative-Concentration-Pathway "rcp8.5"
    ]
    (Quick_Flood_Scenario_Selector = "2021_1000_RCP8.5") [; one 1000 year flood occurs for the rcp 8.5 scenario in year 2021
      Set Flood_1? TRUE
      Set Flood_2? FALSE
      Set Flood_3? FALSE

      Set Occurance_flood_1 2021
      Set Probability_flood_1 "1000-year flood (0.1%)"
      Set Representative-Concentration-Pathway "rcp8.5"
    ]
    (Quick_Flood_Scenario_Selector = "2040_100_RCP8.5") [; one 100 year flood occurs for the rcp 8.5 scenario in year 2040
      Set Flood_1? TRUE
      Set Flood_2? FALSE
      Set Flood_3? FALSE

      Set Occurance_flood_1 2040
      Set Probability_flood_1 "100-year flood (1%)"
      Set Representative-Concentration-Pathway "rcp8.5"
    ]
    (Quick_Flood_Scenario_Selector = "2040_1000_RCP8.5") [; one 1000 year flood occurs for the rcp 8.5 scenario in year 2040
      Set Flood_1? TRUE
      Set Flood_2? FALSE
      Set Flood_3? FALSE

      Set Occurance_flood_1 2040
      Set Probability_flood_1 "1000-year flood (0.1%)"
      Set Representative-Concentration-Pathway "rcp8.5"
    ]
    (Quick_Flood_Scenario_Selector = "2040_1000_RCP2.6") [; one 1000 year flood occurs for the rcp 2.6 scenario in year 2040
      Set Flood_1? TRUE
      Set Flood_2? FALSE
      Set Flood_3? FALSE

      Set Occurance_flood_1 2040
      Set Probability_flood_1 "1000-year flood (0.1%)"
      Set Representative-Concentration-Pathway "rcp2.6"
    ]
    (Quick_Flood_Scenario_Selector = "2021_100_RCP8.5 + 2040_1000_RCP8.5") [; one 100 year flood occurs for the rcp 8.5 scenario in year 2021 and one 1000 year flood occurs for the rcp 8.5 scenario in year 2040
      Set Flood_1? TRUE
      Set Flood_2? TRUE
      Set Flood_3? FALSE

      Set Occurance_flood_1 2021
      Set Probability_flood_1 "100-year flood (1%)"

      Set Occurance_flood_2 2040
      Set Probability_flood_2 "1000-year flood (0.1%)"

      Set Representative-Concentration-Pathway "rcp8.5"
    ]
    ;in any other case, the flood scenario is determined via the individual levers
  )
end

to quick-setup-effectiveness; This function sets the effectiveness of the measures based on the inputs of the quick setup selectors
  (ifelse
    (Quick_Effectiv_Selector = "Normal") [
      Set Effectiveness_elev 1
      Set Effectiveness_wet 0.4
      Set Effectiveness_dry 0.85
    ]
    (Quick_Effectiv_Selector = "Low") [
      Set Effectiveness_elev 1
      Set Effectiveness_wet 0.2
      Set Effectiveness_dry 0.5
    ]
    (Quick_Effectiv_Selector = "High") [
      Set Effectiveness_elev 1
      Set Effectiveness_wet 0.6
      Set Effectiveness_dry 1
    ]
  )
end

to quick-setup-effectiveness-level ; This function sets the effectiveness levels of the measures based on the inputs of the quick setup selectors
  (ifelse
    (Quick_Effectiv_Lvl_Selector = "Normal") [
      Set Effectiveness_lvl_elev 0.3
      Set Effectiveness_lvl_wet 3
      Set Effectiveness_lvl_dry 1
    ]
    (Quick_Effectiv_Lvl_Selector  = "Low") [
      Set Effectiveness_lvl_elev 0
      Set Effectiveness_lvl_wet 1.8
      Set Effectiveness_lvl_dry 0.5
    ]
  )
end

to quick-setup-sensitivity-scenarios;function to simplify simulation-runs for one-factor-at-a-time sensitvitity analysis in behaviourspace
  if NOT((sensitivity = "individual")) [
    Set foundation_height 0.1
    Set Depth-damage-function "Wang (2001)"
    Set Building_Sqm_Value_EUR 861
    Set Economic_model? true
    set cost_source "Survey data"
    set Quick_Effectiv_Selector "Normal"
    Set Quick_Effectiv_Lvl_Selector "Normal"
    Set Intention_gap 0.278
  ]

  (ifelse
    (sensitivity = "Foundation Height - 0 m")                [Set foundation_height 0]
    (sensitivity = "Foundation Height - 0.2m")               [Set foundation_height 0.2]
    (sensitivity = "Depth Damage - Yu et al. (2012)")        [set Depth-damage-function "Yu et al. (2012)"]
    (sensitivity = "Depth Damage - Z. Yin et al. (2011)")    [set Depth-damage-function "Z. Yin et al. (2011)"]
    (sensitivity = "Asset Value - Building Price")           [set Building_Sqm_Value_EUR 6764]
    (sensitivity = "Measure Cost - Fully subsidized")        [set Economic_model? false]
    (sensitivity = "Measure Cost - Du et al. (2020)")        [set cost_source "Du et al. (2020)"]
    (sensitivity = "Measure Effectiveness - Low")            [set Quick_Effectiv_Selector "Low"]
    (sensitivity = "Measure Effectiveness - High")           [set Quick_Effectiv_Selector "High"]
    (sensitivity = "Measure Effectiveness Level - Low")      [set Quick_Effectiv_Lvl_Selector "Low"]
    (sensitivity = "Intention Gap - 13.9%")                  [set Intention_gap 0.139]
    (sensitivity = "Intention Gap - 41.7%")                  [set Intention_gap 0.417]
    (sensitivity = "Intention Gap - 100%")                   [set Intention_gap 1]
  )

end

to initiate-global-parameters ;Function to initiate global parameters
  ;Odds ratios for elevation, wet-proofing, dry-proofing
  Set Oddsratio_fl_prob_percpt       [1.046 1.223 1.208]
  Set Oddsratio_fl_dam_percpt        [0.918 1.007 0.987]
  Set Oddsratio_worry                [1.575 1.680 1.698]
  Set Oddsratio_Resp_Eff             [1.053 1.003 1.129]
  Set Oddsratio_Self_Eff             [1.871 1.647 2.415]
  Set Oddsratio_cost_percpt          [0.411 0.930 0.857]
  Set Oddsratio_UG_other             [0.431 1.100 0.981]
  Set Oddsratio_fl_exp               [1.213 1.078 1.209]
  Set Oddsratio_age                  [0.794 0.827 0.782]
  Set Oddsratio_edu                  [1.284 1.254 1.659]
  Set Oddsratio_CC_belief            [0.467 0.797 0.680]
  Set Oddsratio_soc_inf              [1.813 1.500 1.848]
  Set Oddsratio_soc_media            [1.616 1.369 1.508]
  Set Constant                       [0.085 0.023 0.001]

  Set odds_ratio_fl_exp_low          [1.321 1.218 1.398]
  Set odds_ratio_fl_exp_high         [1.114 0.953 1.045]
  Set Stochasticity_fl_exp_OR?   TRUE

  if ((Intention_gap > 1) OR (Intention_gap < 0)) [
    user-message (word "ERROR: The intention gap needs to be a value between 0 and 1!")
    print (word "ERROR: The intention gap needs to be a value between 0 and 1!")
    stop
  ]

  ;Social network
  Set Max_social_network_size 15   ;we determined the nearest 15 neighours in QGIS - this is the maximum limit available
  Set Difference_soc_net_adapted_soc_net 3 ;based on calculation (see ODD)

  ;Linear regression model for social influence
  Set Beta_soc_inf 0.263
  Set Intercept_soc_inf 2.385

  ;Adaptation effectiveness for elevation, wet-proofing, dry-proofing
  Set effectiv [0 0 0]; in this case, building damage equals content damage effectiveness
  Set effectiv replace-item 0 effectiv (effectiveness_elev);set value from slider
  Set effectiv replace-item 1 effectiv (effectiveness_wet);set value from slider
  Set effectiv replace-item 2 effectiv (effectiveness_dry);set value from slider

  Set effectiv_build effectiv
  Set effectiv_cont effectiv
  Set effectiv_lvl [0 0 0] ;[0.3 3 1] ;Note: Value for elevation is a dummy value as it is determined later for each household individually based on the 100-year flood level
  Set effectiv_lvl replace-item 0 effectiv_lvl (effectiveness_lvl_elev) ;set value from slider
  Set effectiv_lvl replace-item 1 effectiv_lvl (effectiveness_lvl_wet) ;set value from slider
  Set effectiv_lvl replace-item 2 effectiv_lvl (effectiveness_lvl_dry) ;set value from slider

  ;Cost for elevation, wet-proofing, dryp-proofing
  (ifelse; Based on selector choice for the cost source set the measure cost
    (Cost_source = "Survey data") [
      set cost_fix [4040 4026 1706]
      set cost_var [0 0 0]
    ]
    (Cost_source = "Du et al. (2020)") [
      set cost_fix [0 15323 1036]
      set cost_var [153.2 0 33.2]
    ]
  )

  ;Time
  set implement_time [3 2 2]
  Set Time_horizon_prec_implement 10 ;we assume households have implemented measures in the 10 years preceeding the start of the simulation

  set life_time [0 0 0]
  set life_time replace-item 0 life_time (time_horizon + Time_horizon_prec_implement + 1 ) ;Elevation measure is infinite
  set life_time replace-item 1 life_time (time_horizon + Time_horizon_prec_implement + 1 ) ;Wet-proofing measure is infinite
  set life_time replace-item 2 life_time (20)

  ;Damage
  initiate-depth-damage-function
  ;Set Foundation_height 0.1  Setup in GUI!                  ;We assume that residential buildings have a floor elevation of 10 cm (= 0.1 meter) - similar to Abebe et al. (2020)
  Set Perc_cont 0.242937469
  Set Sqm_value [0 0];[860.823240551783 209.126218950]   ;in EUR/m2
  Set Sqm_value replace-item 0 Sqm_value (Building_Sqm_Value_EUR)
  Set Sqm_value replace-item 1 Sqm_value (Building_Sqm_Value_EUR * Perc_cont)

  ;Flood -> uses inputs from user interface to set up flood scenario list
  initiate-floods
  set fl_scenario_names ["2010_1000"	"2010_100"	"2010_10"	"2100_1000_rcp8.5"	"2050_1000_rcp8.5"	"2030_1000_rcp8.5"	"2100_100_rcp8.5"	"2050_100_rcp8.5"	"2030_100_rcp8.5"	"2100_10_rcp8.5"	"2050_10_rcp8.5"	"2030_10_rcp8.5"	"2100_1000_rcp2.6"	"2050_1000_rcp2.6"	"2030_1000_rcp2.6"	"2100_100_rcp2.6"	"2050_100_rcp2.6"	"2030_100_rcp2.6"	"2100_10_rcp2.6"	"2050_10_rcp2.6"	"2030_10_rcp2.6"	"5000_Du"	"1000_Du"	"500_Du"	"200_Du"]
  ;the order of this list needs to be eqaul to the order of the respective column names in the macro-level csv file.
  set position_fl_scenario 0

  ;General: Add selected districts from the switches to the list which captures which districts are selected
  Set Selected_districts []
  IF Huangpu [set Selected_districts lput ("Huangpu District") Selected_districts]
  IF Xuhui [set Selected_districts lput ("Xuhui District") Selected_districts]
  IF Changning [set Selected_districts lput ("Changning District") Selected_districts]
  IF Jing'an [set Selected_districts lput ("Jing'an District") Selected_districts]
  IF Putuo [set Selected_districts lput ("Putuo District") Selected_districts]
  IF Hongkou [set Selected_districts lput ("Hongkou District") Selected_districts]
  IF Yangpu [set Selected_districts lput ("Yangpu District") Selected_districts]

  print ("Initiation Global Parameters finished")

end

to initiate-depth-damage-function
  ;The depth damage parameter lists contain the fractional damage values for building structure/content for the inundation depths in m:
  ;[<0.5 0.5-1 1-1.5 1.5-2 2-2.5 2.5-3 >3]

  (ifelse
    Depth-damage-function = "Wang (2001)"
    [
      set Depth_dam_build [0.03 0.06 0.09 0.12 0.16 0.19 0.22]
      set Depth_dam_cont [0.09 0.19 0.26 0.33 0.38 0.46 0.58]
    ]
    Depth-damage-function = "Yu et al. (2012)"
    [
      set Depth_dam_build [0.02 0.05	0.08	0.12	0.16	0.19	0.22]
      set Depth_dam_cont [0.03	0.08	0.16	0.23	0.27	0.31	0.41]
    ]
    Depth-damage-function = "Z. Yin et al. (2011)"
    ;The continuous functions of Yin et al. were transformed into a discrete function for a better comparison between the different damage functions
    [
      set Depth_dam_build [0.157658157	0.551709602	0.9402445024	1.00	1.00	1.00	1.00]
      set Depth_dam_cont [0.035	0.08258983512	0.1213639868	0.1561712259	0.1884654987	0.2189507088	0.2480388783]
    ]
    Depth-damage-function = "Huizinga et al. (2017)"
    ;The discrete values of Huizinga et al. (2017) were adjusted to the discrete values of the other discrete damage functions.
    [
      set Depth_dam_build [0.1633	0.4103	0.5553	0.6686	0.7579	0.8323	0.9462]
      set Depth_dam_cont [0.1633	0.4103	0.5553	0.6686	0.7579	0.8323	0.9462]
    ]
    [
      user-message ("ERROR: initialization depth-damage function: Selected source not specified!")
      print ("ERROR: initialization depth-damage function: Selected source not specified!")
      STOP
  ])

  ;Verfication
  if (max depth_dam_build > 1 OR min depth_dam_build < 0 )[;the damage cannot be greater than the value of the building AND the damage cannot be negative
    user-message ("ERROR: The depth damage function for the building structure contains values which are outside the logical range (> 1 or < 0)!")
    print ("ERROR: The depth damage function for the building structure contains values which are outside the logical range (> 1 or < 0)!")
    stop
  ]
  if (max depth_dam_cont > 1 OR min depth_dam_cont < 0 )[;the damage cannot be greater than the value of the building AND the damage cannot be negative
    user-message ("ERROR: The depth damage function for the building content contains values which are outside the logical range (> 1 or < 0)!")
    print ("ERROR: The depth damage function for the building content contains values which are outside the logical range (> 1 or < 0)!")
    stop
  ]

end

to initiate-floods ;Function to initate floods from input selectors
  verify-flood-calibrations

  set fl_scenario n-values (Time_horizon + 1) ["No_flood"]; We start with an "empty" list - first year is the starting_year e.g., 2020. However, this represents tick 0 and in tick 0 no flood can occur.
  ;That's why the sliders on the interface start for the flood_occurance start at starting_year + 1

  ;If flood scenarios are selected in the interfact, floods at the respective year are set up: The user interface allows to add up to 3 floods
  let fl_intensity 0;Captures the intensity of the flood
  let fl_map_year 0;Captures the year of the flood map which is used for the scenario e.g., 2010, 2030, 2050, 2100 - years are predetermined by flood maps from Yin et al. (2020)
  let name_fl_scenario "";Captures the entire name of the flood scenario in a year, with similar names as Yin et al. (2020)

  ;Flood-1-----------------------------------------------------------------------------
  if flood_1? [;if flood 1 is selected
    ;Determine Fl_intensity
    (ifelse
      (Probability_flood_1 = "10-year flood (10%)") [ set fl_intensity 10]
      (Probability_flood_1 = "100-year flood (1%)") [set fl_intensity 100]
      (Probability_flood_1 = "1000-year flood (0.1%)") [set fl_intensity 1000]
    )

    ;Determine Fl_map_year
    (ifelse
      (Occurance_flood_1 < 2020) [;if flood is set to occur before 2020
        set fl_map_year 2010;use values from the 2010 flood maps
      ]
      ((Occurance_flood_1 >= 2020) AND (Occurance_flood_1 < 2040)) [;if flood is set to occur between 2020 and 2039
        set fl_map_year 2030;use values from the 2030 flood maps
      ]
      ((Occurance_flood_1 >= 2040) AND (Occurance_flood_1 < 2075)) [;if flood is set to occur between 2040 and 2074
        set fl_map_year 2050;use values from the 2050 flood maps
      ]
      (Occurance_flood_1 >= 2075) [;if flood is set to occur after 2074
        set fl_map_year 2100;use values from the 2100 flood maps
      ]
    )

    ;Determine name_fl_scenario
    (ifelse
      (fl_map_year = 2010) [;when the year 2010 is set, the rcp pathway has no influence as current values are used
        set name_fl_scenario (word fl_map_year "_" fl_intensity);determine the name of flood scenario: year of flood map + intensity
      ]
      [;for all other years the rcp has an influence and hence needs to be included in the name
        set name_fl_scenario (word fl_map_year "_" fl_intensity "_" Representative-Concentration-Pathway);determine the name of flood scenario: year of flood map + intensity + rcp
      ]
     )
    ;Update global fl_scenario list
    set fl_scenario replace-item (Occurance_flood_1 - starting_year) fl_scenario (name_fl_scenario) ;adjust the list fl_scenario accordingly by adding the name of the scenario for the respective tick in which the flood is set to occur (which is the occoruance of the flood minus the starting year)
    ; e.g., flood occurs at year 2040 -> the starting year is 2020, then the flood is placed at item 20 (position 21 as count starts with 0) of the list. The list fl_scenario has values for each year. So item 0 is the starting year e.g., 2020. Then item 20 would be year 2040.
  ]

  ;Flood-2-----------------------------------------------------------------------------
  if flood_2? [;if flood 2 (a second flood) is selected
    ;Determine Fl_intensity
    (ifelse
      (Probability_flood_2 = "10-year flood (10%)") [ set fl_intensity 10]
      (Probability_flood_2 = "100-year flood (1%)") [set fl_intensity 100]
      (Probability_flood_2 = "1000-year flood (0.1%)") [set fl_intensity 1000]
    )

    ;Determine Fl_map_year
    (ifelse
      (Occurance_flood_2 < 2020) [;if flood is set to occur before 2020
        set fl_map_year 2010;use values from the 2010 flood maps
      ]
      ((Occurance_flood_2 >= 2020) AND (Occurance_flood_2 < 2040)) [;if flood is set to occur between 2020 and 2039
        set fl_map_year 2030;use values from the 2030 flood maps
      ]
      ((Occurance_flood_2 >= 2040) AND (Occurance_flood_2 < 2075)) [;if flood is set to occur between 2040 and 2074
        set fl_map_year 2050;use values from the 2050 flood maps
      ]
      (Occurance_flood_2 >= 2075) [;if flood is set to occur after 2074
        set fl_map_year 2100;use values from the 2100 flood maps
      ]
    )

    ;Determine name_fl_scenario
    (ifelse
      (fl_map_year = 2010) [;when the year 2010 is set, the rcp pathway has no influence as current values are used
        set name_fl_scenario (word fl_map_year "_" fl_intensity);determine the name of flood scenario: year of flood map + intensity
      ]
      [;for all other years the rcp has an influence and hence needs to be included in the name
        set name_fl_scenario (word fl_map_year "_" fl_intensity "_" Representative-Concentration-Pathway);determine the name of flood scenario: year of flood map + intensity + rcp
      ]
     )
    ;Update global fl_scenario list
    set fl_scenario replace-item (Occurance_flood_2 - starting_year) fl_scenario (name_fl_scenario) ;adjust the list fl_scenario accordingly by adding the name of the scenario for the respective tick in which the flood is set to occur (which is the occoruance of the flood minus the starting year)
    ; e.g., flood occurs at year 2040 -> the starting year is 2020, then the flood is placed at item 20 (position 21 as count starts with 0) of the list. The list fl_scenario has values for each year. So item 0 is the starting year e.g., 2020. Then item 20 would be year 2040.
  ]

  ;Flood-3-----------------------------------------------------------------------------
  if flood_3? [;if flood 3 (a third flood) is selected
    ;Determine Fl_intensity
    (ifelse
      (Probability_flood_3 = "10-year flood (10%)") [ set fl_intensity 10]
      (Probability_flood_3 = "100-year flood (1%)") [set fl_intensity 100]
      (Probability_flood_3 = "1000-year flood (0.1%)") [set fl_intensity 1000]
    )

    ;Determine Fl_map_year
    (ifelse
      (Occurance_flood_3 < 2020) [;if flood is set to occur before 2020
        set fl_map_year 2010;use values from the 2010 flood maps
      ]
      ((Occurance_flood_3 >= 2020) AND (Occurance_flood_3 < 2040)) [;if flood is set to occur between 2020 and 2039
        set fl_map_year 2030;use values from the 2030 flood maps
      ]
      ((Occurance_flood_3 >= 2040) AND (Occurance_flood_3 < 2075)) [;if flood is set to occur between 2040 and 2074
        set fl_map_year 2050;use values from the 2050 flood maps
      ]
      (Occurance_flood_3 >= 2075) [;if flood is set to occur after 2074
        set fl_map_year 2100;use values from the 2100 flood maps
      ]
    )

    ;Determine name_fl_scenario
    (ifelse
      (fl_map_year = 2010) [;when the year 2010 is set, the rcp pathway has no influence as current values are used
        set name_fl_scenario (word fl_map_year "_" fl_intensity);determine the name of flood scenario: year of flood map + intensity
      ]
      [;for all other years the rcp has an influence and hence needs to be included in the name
        set name_fl_scenario (word fl_map_year "_" fl_intensity "_" Representative-Concentration-Pathway);determine the name of flood scenario: year of flood map + intensity + rcp
      ]
     )
    ;Update global fl_scenario list
    set fl_scenario replace-item (Occurance_flood_3 - starting_year) fl_scenario (name_fl_scenario) ;adjust the list fl_scenario accordingly by adding the name of the scenario for the respective tick in which the flood is set to occur (which is the occoruance of the flood minus the starting year)
    ; e.g., flood occurs at year 2040 -> the starting year is 2020, then the flood is placed at item 20 (position 21 as count starts with 0) of the list. The list fl_scenario has values for each year. So item 0 is the starting year e.g., 2020. Then item 20 would be year 2040.
  ]

  if debug? [
    print (word "initiate-depth-damage-function: fl_scenario: " Fl_scenario )
  ]

end

to verify-flood-calibrations ;Verifies that no two floods occur in the same year
  if (
    ((Occurance_flood_1 = Occurance_flood_2 ) AND flood_1? AND flood_2?) OR
    ((Occurance_flood_1 = Occurance_flood_3 ) AND flood_1? AND flood_3?) OR
    ((Occurance_flood_2 = Occurance_flood_3 ) AND flood_2? AND flood_3?) )
  [
    user-message (word "Two floods are selected in the same year - this is not supported by the model! Please change the calibration!")
    print (word "Two floods are selected in the same year - this is not supported by the model! Please change the calibration!")
    stop
  ]

end

to initiate-households-parameters ;Function to initate household parameters
  load-macro-level-parameters ;first load the macrolevel data
  assign-households-to-buildings ;match micro and macrolevel data
  ask turtles [
  ;The following  functions need to be executed for every turtle
    determine-value
    determine-undergone-other
    initiate-direct-neighbourhood
  ]
  ask turtles [;second loop required, because in order to determine the indirect neighbours, the direct neighbours of all turtles need to be defined
    initiate-indirect-neighbourhood
    initiate-remaining-household-parameters
  ]
  ;procedures to verify correct initiation of household parameters
  verify-visualization
  verify-direct-neighbourhood
  verify-indirect-neighbourhood
  verify-cost-calculation
  verify-agent-state
  verify-time
  print ("Initiation Household Parameters finished")
end

to load-macro-level-parameters ;function to load in the macro-level paramters (from QGIS and inundation maps)
  ;Source/idea this function comes partially from https://github.com/NetLogo/models/blob/master/Code%20Examples/Extensions%20Examples/csv/CSV%20Example.nlogo
  file-close-all;Closes all files (if any) that have been opened previously with file-open.
  if not file-exists? "Macrolevel_data.csv" [
    user-message "Error: No file 'Macrolevel_data.csv' is found!"
    print "Error: No file 'Macrolevel_data.csv' is found!"
    stop
  ]

  file-open "Macrolevel_data.csv"; open file with macrolevel data

  ;go through all the rows and for each row create one household agent and initiate the respective household attributes

  let headings csv:from-row file-read-line; To skip the header row in the while loop, read the header row here to move the cursordown to the next line.

  while [not file-at-end?] [
    let row csv:from-row file-read-line ;the CSV extensions looks at one single line and puts it into the read data
    ;column titles of row: fid	Building type	District	20101000_both	2010100_both	201010_both	21001000_rcp8.5	20501000_rcp8.5	20301000_rcp8.5	2100100_rcp8.5	2050100_rcp8.5	2030100_rcp8.5	210010_rcp8.5	205010_rcp8.5	203010_rcp8.5	21001000_rcp2.6	20501000_rcp2.6	20301000_rcp2.6	2100100_rcp2.6	2050100_rcp2.6	2030100_rcp2.6	210010_rcp2.6	205010_rcp2.6	203010_rcp2.6	5000_Du	1000_Du	500_Du	200_Du	FID_NN1	FID_NN2	NN3	NN4	NN5	NN6	NN7	NN8	NN9	NN10
    if (member? item 2 row selected_districts) [; Only if the row includes a residential building which is located within one of the districts which are selected for the simulation on the interface, then the data is loaded. Otherwise, the row is "skipped"
      create-turtles 1 [ ;for each row in the CSV a trutle is created and the values of this row are loaded in as the agent parameters
        set ID item 0 row
        set build_type item 1 row
        set district item 2 row

        ;loading inundation data for different scenarios
        set inund [];starting with an empty list
        let y 2
        while [y < 27] [ ;Inundation data is in columns 3 till 27 (colum start at 0) - filling up the list with the inundations levels of the different scenarios one scenario after the other from the end
          set y y + 1
          set inund lput (item y row) inund
        ]

        ;loading IDs of direct nearest neighbours
        set Direct_NN_IDs []
        let x 27
        while [x < 27 + max_social_network_size] [
          ;the size of the list Direct_NN_IDs is determined by the max network size: If the max network size is 0, the while loop is not entered and hence no direct next neighbours are loaded. At maximum 15 direct NN can be loaded
          set x x + 1
          set Direct_NN_IDs lput (item x row) Direct_NN_IDs
        ]
      ]
    ]
  ]
  file-close

  ; Verification of data loading procedure!
  if NOT((count turtles with [build_type = "Apartment"] + count turtles with [build_type = "House"]) = (count turtles)) [
    user-message "Error: Number of turtles living in houses and apartments does not add up to total number of turtles!"
    print "Error: Number of turtles living in houses and apartments does not add up to total number of turtles!"
    Stop
  ]
  print ("Loading Macrolevel_data.csv finished")
end

to assign-households-to-buildings; randomly matches households with buildings
  file-close-all;Closes all files (if any) that have been opened previously with file-open.
  if not file-exists? "Microlevel_data.csv" [
    user-message "Error: No file 'Microlevel_data.csv' is found!"
    print "Error: No file 'Microlevel_data.csv' is found!"
    stop
  ]
  file-open "Microlevel_data.csv"; open file with microlevel data from survey
  let headings csv:from-row file-read-line; To skip the header row in the while loop, read the header row here to move the cursordown to the next line.

  while [not file-at-end?] [
    let row csv:from-row file-read-line ;the CSV extensions looks at one single line and puts it into the read data
    ;column titles of row: ID Popu,ID survey,fl_prob,fl_dam,worry,elev_RE_avg,wet_RE_avg,dry_RE_avg,elev_SE_avg,wet_SE_avg,dry_SE_avg,elev_cost_avg,wet_cost_avg,dry_cost_avg,elev_UG,wet_UG,dry_UG,fl_exp,age,edu,CC_belief_new,soc_exp,s_media_avg,HH_size_new,HH_status_new,Build_type

    ;The following if statement checks if the household from the microlevel data is living in an apartment or house and then matches it with a random residential building with the same building type (apartment, house)
    (ifelse
      (item 25 row = 1) [; If the household of the respective row is living in an apartment (Build_type=1)
        if any? (turtles with [(build_type = "Apartment") AND (Fl_prob_percpt < 1)]) [;if there are still agents which live in an apartment and have not been assigned yet! Otherwise, row is skipped
          ask one-of turtles with [(build_type = "Apartment") AND (Fl_prob_percpt < 1)] [;Choose a random apartment building which has not yet been assigned yet to a household
            Set ID_survey item 1 row

            ;Threat appraisal
            (Ifelse
              (change_fl_prob >= 0) [Set Fl_prob_percpt min list 9 (item 2 row + change_fl_prob)] ;if the change via the policy is positive, then the fl_prob level is the level from the populated data plus the change taking into consideration that it cannot be larger than 9 which is the maximum value for the attribute
              (change_fl_prob < 0 ) [Set Fl_prob_percpt max list 1 (item 2 row + change_fl_prob)] ;if the change via the policy is negative, then the fl_prob level is the level from the populated data plus the change (which would be negative) taking into consideration that it cannot be smaller than 1 which is the minimum value for the attribute
            )
            (Ifelse
              (change_fl_dam >= 0) [Set Fl_dam_percpt min list 5 (item 3 row + change_fl_dam)] ;max level is 5
              (change_fl_dam < 0)  [Set Fl_dam_percpt max list 1 (item 3 row + change_fl_dam)] ;min level is 1
            )
            (Ifelse
              (change_worry >= 0) [Set Worry min list 5 (item 4 row + change_worry)] ;max level is 5
              (change_worry < 0)  [Set Worry max list 1 (item 4 row + change_worry)] ;min level is 1
            )

            ;Coping appraisal
            ;Initiating Response efficacy for elevation,wet-proofing, dry-proofing
            Set Resp_Eff []
            let Resp_Count 4
            while [Resp_Count < 7] [
              Set Resp_Count Resp_Count + 1
              (ifelse
                (change_resp_eff >= 0) [Set Resp_Eff lput (min list 5 (item Resp_Count row + change_resp_eff)) Resp_Eff] ;max level is 5
                (change_resp_eff < 0)  [Set Resp_Eff lput (max list 1 (item Resp_Count row + change_resp_eff)) Resp_Eff] ;min level is 1
              )
            ]

            ;Initiating Self efficacy for elevation,wet-proofing, dry-proofing
            Set Self_Eff []
            let Self_Count 7
            while [Self_Count < 10] [
              Set Self_Count Self_Count + 1
              (ifelse
                (change_self_eff >= 0) [Set Self_Eff lput (min list 5 (item Self_Count row + change_self_eff)) Self_Eff] ;max level is 5
                (change_self_eff < 0)  [Set Self_Eff lput (max list 1 (item Self_Count row + change_self_eff)) Self_Eff] ;min level is 1
              )
            ]

            ;Initiating Cost perception for elevation,wet-proofing, dry-proofing
            Set Cost_percpt []
            let Cost_Count 10
            while [Cost_Count < 13] [
              Set Cost_Count Cost_Count + 1
              (ifelse
                (change_cost >= 0) [Set Cost_percpt lput (min list 5 (item Cost_Count row + change_cost)) Cost_percpt] ;max level is 5
                (change_cost < 0)  [Set Cost_percpt lput (max list 1 (item Cost_Count row + change_cost)) Cost_percpt] ;min level is 1
                )
            ]

            ;Initiating Undergone for elevation,wet-proofing, dry-proofing
            Set UG []
            let UG_Count 13
            while [UG_Count < 16] [
              Set UG_Count UG_Count + 1
              Set UG lput (item UG_Count row) UG
            ]

            Set Fl_exp item 17 row
            Set Age item 18 row
            Set Edu item 19 row

            (Ifelse
              (Change_CC_belief >= 0) [Set CC_belief min list 1 (item 20 row + change_cc_belief)]  ;max level is 1
              (Change_CC_belief < 0)  [Set CC_belief max list 0 (item 20 row + change_cc_belief)]  ;min level is 0
            )
            (Ifelse
              (Change_soc_inf >= 0) [Set Soc_inf min list 5 (item 21 row + change_soc_inf)] ;max level is 5
              (Change_soc_inf < 0)  [Set Soc_inf max list 1 (item 21 row + change_soc_inf)] ;min level is 1
            )
            (Ifelse
              (Change_soc_media >= 0) [Set Soc_media min list 5 (item 22 row + change_soc_media)] ;max level is 5
              (Change_soc_media < 0)  [Set Soc_media max list 1 (item 22 row + change_soc_media)] ;min level is 1
            )

            ;Building
            Set Build_size item 23 row
            Set HH_status item 24 row

            ;Social network
            Set Soc_net (item 26 row * Difference_soc_net_adapted_soc_net)
            ; the value from the survey data depicts the number of HHs in the network of a HH which adapt.
            ;We use this as a proxi for the size of the social network of a household.
            ;This is calculated by adding the value with the factor Difference_NNadapt_NN.


            ;Income + Saving
            Set Income precision (item 27 row) 0
            Set Savings n-values (Time_horizon + 1) [0]
            Set Savings replace-item 0 savings (precision (item 28 row) 0)
            (ifelse
              (item 29 row < 0) [set Yearly_change_savings 0]
              [Set Yearly_change_savings precision (item 29 row) 0]
            )
          ]
        ]
      ]
      [; If the household of the respective row is living in an apartment (Build_type=0)
        if any? (turtles with [(build_type = "House") AND (Fl_prob_percpt < 1)]) [;if there are still agents which live in a house and have not been assigned yet! Otherwise, row is skipped
          ask one-of turtles with [(build_type = "House") AND (Fl_prob_percpt < 1)] [;Select a random house which has not yet been assigned yet to a household
            Set ID_survey item 1 row

            ;Threat appraisal
            (Ifelse
              (change_fl_prob >= 0) [Set Fl_prob_percpt min list 9 (item 2 row + change_fl_prob)] ;if the change via the policy is positive, then the fl_prob level is the level from the populated data plus the change taking into consideration that it cannot be larger than 9 which is the maximum value for the attribute
              (change_fl_prob < 0 ) [Set Fl_prob_percpt max list 1 (item 2 row + change_fl_prob)] ;if the change via the policy is negative, then the fl_prob level is the level from the populated data plus the change (which would be negative) taking into consideration that it cannot be smaller than 1 which is the minimum value for the attribute
            )
            (Ifelse
              (change_fl_dam >= 0) [Set Fl_dam_percpt min list 5 (item 3 row + change_fl_dam)] ;max level is 5
              (change_fl_dam < 0)  [Set Fl_dam_percpt max list 1 (item 3 row + change_fl_dam)] ;min level is 1
            )
            (Ifelse
              (change_worry >= 0) [Set Worry min list 5 (item 4 row + change_worry)] ;max level is 5
              (change_worry < 0)  [Set Worry max list 1 (item 4 row + change_worry)] ;min level is 1
            )

            ;Coping appraisal
            ;Initiating Response efficacy for elevation,wet-proofing, dry-proofing
            Set Resp_Eff []
            let Resp_Count 4
            while [Resp_Count < 7] [
              Set Resp_Count Resp_Count + 1
              (ifelse
                (change_resp_eff >= 0) [Set Resp_Eff lput (min list 5 (item Resp_Count row + change_resp_eff)) Resp_Eff] ;max level is 5
                (change_resp_eff < 0)  [Set Resp_Eff lput (max list 1 (item Resp_Count row + change_resp_eff)) Resp_Eff] ;min level is 1
              )
            ]

            ;Initiating Self efficacy for elevation,wet-proofing, dry-proofing
            Set Self_Eff []
            let Self_Count 7
            while [Self_Count < 10] [
              Set Self_Count Self_Count + 1
              (ifelse
                (change_self_eff >= 0) [Set Self_Eff lput (min list 5 (item Self_Count row + change_self_eff)) Self_Eff] ;max level is 5
                (change_self_eff < 0)  [Set Self_Eff lput (max list 1 (item Self_Count row + change_self_eff)) Self_Eff] ;min level is 1
              )
            ]

            ;Initiating Cost perception for elevation,wet-proofing, dry-proofing
            Set Cost_percpt []
            let Cost_Count 10
            while [Cost_Count < 13] [
              Set Cost_Count Cost_Count + 1
              (ifelse
                (change_cost >= 0) [Set Cost_percpt lput (min list 5 (item Cost_Count row + change_cost)) Cost_percpt] ;max level is 5
                (change_cost < 0)  [Set Cost_percpt lput (max list 1 (item Cost_Count row + change_cost)) Cost_percpt] ;min level is 1
                )
            ]

            ;Initiating Undergone for elevation,wet-proofing, dry-proofing
            Set UG []
            let UG_Count 13
            while [UG_Count < 16] [
              Set UG_Count UG_Count + 1
              Set UG lput (item UG_Count row) UG
            ]

            Set Fl_exp item 17 row
            Set Age item 18 row
            Set Edu item 19 row

            (Ifelse
              (Change_CC_belief >= 0) [Set CC_belief min list 1 (item 20 row + change_cc_belief)]  ;max level is 1
              (Change_CC_belief < 0)  [Set CC_belief max list 0 (item 20 row + change_cc_belief)]  ;min level is 0
            )
            (Ifelse
              (Change_soc_inf >= 0) [Set Soc_inf min list 5 (item 21 row + change_soc_inf)] ;max level is 5
              (Change_soc_inf < 0)  [Set Soc_inf max list 1 (item 21 row + change_soc_inf)] ;min level is 1
            )
            (Ifelse
              (Change_soc_media >= 0) [Set Soc_media min list 5 (item 22 row + change_soc_media)] ;max level is 5
              (Change_soc_media < 0)  [Set Soc_media max list 1 (item 22 row + change_soc_media)] ;min level is 1
            )

            ;Building
            Set Build_size item 23 row
            Set HH_status item 24 row

            ;Social network
            Set Soc_net (item 26 row * Difference_soc_net_adapted_soc_net)
            ; the value from the survey data depicts the number of HHs in the network of a HH which adapt.
            ;We use this as a proxi for the size of the social network of a household.
            ;This is calculated by adding the value with the factor Difference_NNadapt_NN

            ;Income + Saving
            Set Income precision (item 27 row) 0
            Set Savings n-values (Time_horizon + 1) [0]
            Set Savings replace-item 0 savings (precision (item 28 row) 0)
            (ifelse
              (item 29 row < 0) [set Yearly_change_savings 0];assumption: People
              [Set Yearly_change_savings precision (item 29 row) 0]
            )
          ]
        ]
    ])
  ]
  ;Verification that no unmatched building is left!
  if ( ( Count turtles with [(build_type = "Apartment") AND (Fl_prob_percpt < 1)] > 0 ) OR (Count turtles with [(build_type = "House") AND (Fl_prob_percpt < 1)] > 0)) [
    print (word "Unmatched apartment buildings: " Count turtles with [(build_type = "Apartment") AND (Fl_prob_percpt < 1)])
    print (word "Unmatched houses: " Count turtles with [(build_type = "House") AND (Fl_prob_percpt < 1)])
  ]
  file-close
  print ("Loading Microlevel_data.csv finished")
end

to determine-value; Function to determine asset value
  set value [0 0]
  foreach [ 0 1 ] [ x -> ; 0 = building structure, 1 = building content
    set value replace-item x value (Build_size * (item x sqm_value)) ;determine the value for both structure and content by multiplying the buildign size in sqm with the building/content value per sqm
  ]
  if debug? [
    print (word "Determine-value: Value of household "who" with ID "ID" and building size "build_size" set to " value)
  ]

end

to determine-undergone-other ;function to determine undergone other
  set UG_other [0 0 0]
  if (item 0 UG = 1) [;If elevation is undergone
    set UG_other replace-item 1 UG_other 1; set undergone_other of wet-proofing 1
    set UG_other replace-item 2 UG_other 1; set undergone_other of dry-proofing 1
  ]
  if (item 1 UG = 1) [;If wet-proofing is undergone
    set UG_other replace-item 0 UG_other 1; set undergone_other of elevation 1
    set UG_other replace-item 2 UG_other 1; set undergone_other of dry-proofing 1
  ]
  if (item 2 UG = 1) [;If wet-proofing is undergone
    set UG_other replace-item 0 UG_other 1; set undergone_other of elevation 1
    set UG_other replace-item 1 UG_other 1; set undergone_other of wet-proofing 1
  ]
end

to initiate-direct-neighbourhood ; function to initiate direct neighbourhood
  ;We first load all 15 (max_social_network_size) nearest neighbours into Direct_NN_IDs in the load-macro-level-parameters procedure
  ;However, not every HH has a network size of 15, which is included in the soc_net parameter from the survey data
  ;Therefore, we now need to reduce the length of Direct_NN_IDs so that it matches the individual network size variable soc_net
  ;When doing so it is importortant the most remote nearest neighbours are removed from the list. This is can be done by reducing the list form the right, as the list Direct_NN_IDs is sorted by increasing distance
  (ifelse
    (soc_net < Max_social_network_size) [ ;if the size of the social network is smaller than max_social_network_size, it needs to be reduced
      let i (max_social_network_size - 1) ;i as a local variable to iterate through Direct_NN_IDs. As it is a list and lists start their items at position four, we need a counter which starts at position max_social_network_size - 1
      while [i >= soc_net] [;as long as the list is not the size of the social network parameter (important >=, as the lists start at item 0!)- this while loop is no longer entered when the length of the list Direct_NN_IDs is the length of soc_net
        set Direct_NN_IDs remove-item i Direct_NN_IDs; Remove the item from the right
        set i (i - 1); reduce the local counter
      ]
    ]
    (soc_net > Max_social_network_size) [ ;if the size of the social network is larger than max_social_network_size, we have a problem, as for each household we only have the ids for the clostest 15 nearest neighbours
      user-message (word "ERROR: Size of the social network of household with ID: " ID " is " soc_net " and therefore larger than the maximum social network size of " max_social_network_size "!")
      print (word "ERROR: Size of the social network of household with ID: " ID " is " soc_net " and therefore larger than the maximum social network size of " max_social_network_size "!")
      Stop
    ]
    []; soc_net = Max_social_network_size, then they are already aligned and you don't need to do anything ]
    )

  set NN_adapt n-values (Time_horizon + 1) [0] ;-> this lists capture values per tick. To initiate it, we create a list with the length of the time-horizon plus 1 (year 0) and fill it up with 0
  ;households check whether their direct neighbours have adapated at least one measure and adjust counter for number of direct neighbours which did so
  let list_NNs Direct_NN_IDs
  let count_adapted_NNs 0 ;local variable to count the number of direct nearest neighbours of a household which implemented an adaptation measure (the global variable count_adapted_NNs cannot be used as other turtles are called)
  ask turtles with [member? ID list_NNs] [ ;ask all the nearest neighbours of a household based on the ID from QGIS
    if ((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1)) [; If a direct neighbour has undergone any adaptation measure
      set count_adapted_NNs (count_adapted_NNs + 1) ;increase local counter by one
    ]
  ]
  set NN_adapt replace-item ticks NN_adapt count_adapted_NNs ;set the agent variable in tick 0 to the state of the local counter for each houehold
end

to initiate-indirect-neighbourhood; Function to iniate indirect neighbourhood
  let loc_Indirect_NN_IDs [];local variable necessary as it does not appear possible to use myself in this occasion for setting the list
  ask turtles with [member? ([ID] of myself) Direct_NN_IDs] [ ;ask the households where I am included in the list of the direct nearest neighbours
    Set loc_Indirect_NN_IDs lput ID loc_Indirect_NN_IDs                ;if you are influenced by me, then you are my indirect neighbour, so put your ID in this list
  ]
  set Indirect_NN_IDs loc_Indirect_NN_IDs ;load local list into the global agent parameter
end

to initiate-remaining-household-parameters ;function to initate the remaining household parameters that have not been initated yet
  ;decision-making
  set implement_threshold [0 0 0]
  set odds [0 0 0]
  set prob_implement [0 0 0]

  set life_time_indiv [0 0 0]
  set life_time_indiv replace-item 0 life_time_indiv (item 0 life_time)
  set life_time_indiv replace-item 1 life_time_indiv (item 1 life_time)
  set life_time_indiv replace-item 2 life_time_indiv (precision (random-normal (item 2 life_time) 2) 0 )

  ;cost-benefit -> these lists capture values per tick. To initiate them, we create lists with the length of the time-horizon plus 1 (year 0) and fill them up with 0
  set fl_dam_build n-values (Time_horizon + 1) [0]
  set fl_dam_cont n-values  (Time_horizon + 1) [0]

  set b_elev n-values (Time_horizon + 1) [0]
  set b_elev_build n-values (Time_horizon + 1) [0]
  set b_elev_cont n-values (Time_horizon + 1) [0]

  set b_wet n-values (Time_horizon + 1) [0]
  set b_wet_build n-values (Time_horizon + 1) [0]
  set b_wet_cont n-values (Time_horizon + 1) [0]

  set b_dry n-values (Time_horizon + 1) [0]
  set b_dry_build n-values (Time_horizon + 1) [0]
  set b_dry_cont n-values (Time_horizon + 1) [0]

  set c_elev n-values (Time_horizon + 1) [0]
  set c_wet n-values (Time_horizon + 1) [0]
  set c_dry n-values (Time_horizon + 1) [0]

  set Hindered_by_savings n-values (Time_horizon + 1) [0]

  ;time
  set implement_start [0 0 0]
  set implement_end [0 0 0]

  ;agent state:
  ;adaptation status is a nested list [ [] [] [] ] -> within adaptation status, there are three lists (one for elevation, one for wet-proofing, one for dry-proofing).
  ;The number of items per "measure" list is determined by the time-horizon, so that for each tick the adaptation status of measure x can be captured
  set adapt_status [0 0 0]
  foreach [0 1 2] [x ->; for all measures: Elevation, wet-proofing, dry-proofing
    set adapt_status replace-item x adapt_status (n-values (Time_horizon + 1) [0]); make a seperate list to capture the status per tick
  ]


  foreach [0 1 2] [ x ->; for all measures: Elevation, wet-proofing, dry-proofing
    if ((item x UG) =  1 ) [ ;if a measure is already undergone
      set implement_end replace-item x implement_end ( - random Time_horizon_prec_implement); if household indicated in the survey that they already adapted a measure, then we need to set the implementation end time of the measure. As measures have a lifetime, they expire based on when the implementation was started. Hence, it is important for the adaptation diffusion of households to generate a realistic expiration pattern.
                                                                                           ;Thus, we assume that households that implemented a measure before, did so in the 10 previous year (captured in the parameter Time_horizon_prec_implement).
                                                                                           ;By using random, we generate a uniform distribution
                                                                                           ;We use minus, as the measures were implemented in the past
      set adapt_status replace-subitem x ticks adapt_status (2);if they implemented, set the status of the measure x at tick t (=0) to 2 (adapted)
      set-cost x;if household indicated in the survey that they already adapted a measure, then the cost of this measure x arise are noted for tick 0

      ;Verification and debug
      if debug? [
        print (word "Initiate-remaining-household-parameters: Household "who" with ID "ID" set adaptation status of measure " x " in tick "ticks" to 2 (adapted)")
      ]
    ]
  ]
  ;Visualization
  If Visualization? [
    (ifelse
      (Build_type = "House") [set shape "house"]
      (Build_type = "Apartment") [set shape "apartment"]
    )
    set size 1.3
    set color 9.9
    move-to one-of patches with [([district] of myself = district_name) AND (count turtles-here = 0)] ;move turtle to a random free patch within it's district. It is important to note that the location on the user interface does not reflect. It is solely there to have something to look at. No information for the model is drawn from the visualization.
  ]
end

;Function that replaces the subitem within a nested list
;source of function: https://stackoverflow.com/questions/23182872/how-to-do-replacing-item-in-use-nested-list
;replace the item x of a sublist which itself is item y of a list with a new value
to-report replace-subitem [index_list index_sublist lists new_value]
  let old-sublist item index_list lists
  report replace-item index_list lists (replace-item index_sublist old-sublist new_value)
end

to update-agent-and-global-parameters ;Function to update agent parameters (and global tracking parameters)
  ask turtles [
    set flooded? FALSE; flooded is reset in each tick (year)
    if visualization? [
      set-color
    ]
    ;Social interaction
    if (ticks >= 1) [; the social interaction is active from tick 1

      let change_NN_adapt (item ticks NN_adapt - item (ticks - 1) NN_adapt);Determine change in number of adapted neighbours from last tick to the current tick

      if debug? [print (word "update-agent-and-global-parameters: Household with ID: " ID " has changed the adaptation count of the neighbours (change_NN_adapt) in this tick by " change_NN_adapt)]

      ;Verification and debugging start
      Set Total_adapt_count_change_HHs (Total_adapt_count_change_HHs + change_NN_adapt)
      ;Verificaiton and debuggin end

      (ifelse
        change_NN_adapt > 0 [;Positive value: The number of neighbours which adapted increased
          let new_soc_inf [0 0];list that includes the min boundaries and the new value
          set new_soc_inf replace-item 0 new_soc_inf 5; social influence can be max 5
          set new_soc_inf replace-item 1 new_soc_inf (soc_inf + change_NN_adapt * Beta_soc_inf);adjust the social influence value by adding the change mulitplied with the factor which determines by how much the social influence changes if the number of neighbours that adapted in the social network changes by 1 (from linear regression analysis)

          ;Verification and debugging start
          if (debug?) [
            print (word "update-agent-and-global-parameters: neighours(s) of household with ID " ID " adapted in tick " ticks " and soc influence increases from " soc_inf " to " min new_soc_inf )
          ]
          ;Verification and debugging end

          set soc_inf min new_soc_inf; set the social influence value the minimum value in the list. This makes sure that the max value of 5 is not exceeded!

        ]
        change_NN_adapt < 0 [;Negative value: The number of neigbhours which adapted decreased e.g., due to expiration of measures
          (ifelse
            (item ticks NN_adapt < 10) [
              ;just because the number of neighbours decreases, does not mean that soc inf needs to be changed. If you have soc inf 5 and if you have a lot of neighbours and all of them adapted and now one of them no longer has any active adaptation, this does not necessarily mean that your soc influence decreases below 5
              ;the threshold can be determined using the linear regression: 2.385 + 0.263*NN_adapt = soc_inf -> set soc_inf 5 (maximum), then 0.263*NN_adapt = 2.615 -> This means that if NN_adapt = 9.94 (~ 10), soc_inf is at its maximum (5)
              ;Hence, if NN_adapt drops below 10, the soc_inf can decrease.

              let new_soc_inf [0 0];list that includes the max boundaries and the new value
              set new_soc_inf replace-item 0 new_soc_inf 1; social influence must be minimum 1
              set new_soc_inf replace-item 1 new_soc_inf (soc_inf + change_NN_adapt * Beta_soc_inf);adjust the social influence value by adding the change mulitplied with the factor which determines by how much the social influence changes if the number of neighbours that adapted in the social network changes by 1 (from linear regression analysis)

              ;Verification and debugging start
              if (debug?) [
                print (word "update-agent-and-global-parameters: neighours(s) of household with ID " ID " abanondend back to 0 measures in tick " ticks " and soc influence decreases from " soc_inf " to " max new_soc_inf )
              ]
              ;Verification and debugging end

              set soc_inf max new_soc_inf; set the social influence value the maximum value in the list. This makes sure that the min value of 1 is not exceeded!
            ]
            [;Else:
              if (debug?) [
                print (word "update-agent-and-global-parameters: Soc inf is not reduced as NN_adapt is larger or equal to 10")
              ]
            ]
            )
        ]
        [;if no change in number of neighbours that adapted, then soc_inf stays the same
          if (debug?) [
            print (word "update-agent-and-global-parameters: No change in adapted neighbours of household " ID )
          ]
        ]

      )
    ]
    ;Probability to implement
    foreach [0 1 2] [x -> ;for all the measures elevation [0], wet-proofing [1], dry-proofing [2]
      if Stochasticity_fl_exp_OR? [;if the stochasiticty is enabled for the fl_exp odds ratio, then for each household and for each measure the odds ratio is chosen as a random number between the odds ratio and +- its standard deviation
        set Oddsratio_fl_exp replace-item x Oddsratio_fl_exp (item x odds_ratio_fl_exp_low + random-float (item x odds_ratio_fl_exp_high - item x odds_ratio_fl_exp_low))
      ]
      set implement_threshold replace-item x implement_threshold (random-float 1) ;each tick for each household for each measure a random number between 0 and 1 is generated as a treshold against the probabiltiy to implement a measures
      set odds replace-item x odds (;Calculation of Odds based on intercept, odds ratios, and attribute levels
        (item x Constant) * (
        ((item x Oddsratio_fl_prob_percpt) ^ fl_prob_percpt) *
        ((item x Oddsratio_fl_dam_percpt) ^ fl_dam_percpt) *
        ((item x Oddsratio_worry) ^ worry) *
        ((item x Oddsratio_resp_Eff) ^ (item x resp_eff)) *
        ((item x Oddsratio_self_Eff) ^ (item x self_eff)) *
        ((item x Oddsratio_cost_percpt) ^ (item x cost_percpt)) *
        ((item x Oddsratio_UG_other) ^ (item x UG_other)) *
        ((item x Oddsratio_fl_exp) ^ fl_exp) *
        ((item x Oddsratio_age) ^ age) *
        ((item x Oddsratio_edu) ^ edu) *
        ((item x Oddsratio_CC_belief) ^ CC_belief) *
        ((item x Oddsratio_soc_inf) ^ soc_inf) *
        ((item x Oddsratio_soc_media) ^ soc_media)
        )
      )

      ;probabiltiy to "intent" = odds / (1 + odds) -> by multiplying it with the Intention gap parameter we get the probability to "implement"!
      set prob_implement replace-item x prob_implement ((item x odds / (1 + item x odds)) * Intention_gap )

      if (((item x prob_implement) > 1) OR ((item x prob_implement) < 0));Verification that value range of probability makes sense
      [
        user-message (word "ERROR: probability to implement measure of turtle with ID " ID "is out of bounds!")
        print (word "ERROR: probability to implement measure of turtle with ID " ID "is out of bounds!")
        stop
      ]
    ]
  ]
  if behaviourspace? [ ;only if the behaviourspace is used we need to update the global tracking variables
    update-global-tracking-variables
  ]
end

to set-color ;function to set the colour of the residential building in the visualization on the gui
  (ifelse
    ((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1)) [set color 54] ;At least one measure is adapted -> set green
    [set color 15] ;no measure is adapted -> set red
    )
end

to set-cost [measure_id]; sets the cost in a tick t of a measure
  (ifelse
    ;The cost within a certain tick for a certain measure are determined via the ticks
    ;Costs are made of fixed and variable costs
    (measure_id = 0) [; If elevation measure
      set C_elev replace-item ticks c_elev ((item measure_Id cost_fix) + (item measure_id cost_var) * build_size * ( (item 8 inund) + item measure_id effectiv_lvl))
      ;replace the item of the list c_elev at the position of the ticks (currently 0) with the costs for the measure
      ;the costs for the elevation measure are the fixed cost plus the variable cost.
      ;The variable cost however are per m3. Therefore, we need to mulitply the building size (m2) with the elevation level (m).
      ;The elevation measure increases the floor elevation to a level which is 30 cm higher than a current 100-year flood-level
      ;We choose the 100-year flood level from the 2030 scenario, as this can be considered a “current” flood-level from a 2020 perspective. Moreover, we choose the RCP8.5 scenario, which is considered more likely than the RCP2.6 (source).
      ;This gives us the 2030100_rcp8.5 scenario, which is the item 8 of the inundation list.
    ]
    (measure_id = 1) [; If wet-proofing measure
      set c_wet replace-item ticks c_wet ((item measure_Id cost_fix) + (item measure_id cost_var) * build_size)
      ;For wet-and dry-proofing the variable cost are per m2. Therefore, it only needs to be multiplied with the building size!
    ]
    (measure_id = 2) [; If dry-proofing measure
      set c_dry replace-item ticks c_dry ((item measure_Id cost_fix) + (item measure_id cost_var) * build_size)
    ]
    [;else: If neither elevation, wet-proofing, nor dry-proofing measure
     user-message (word "Error: function set-cost received wrong input!")
     print (word "Error: function set-cost received wrong input!")
     stop
    ]
  )
end

to-report get-cost [measure_id]; gives back the potential cost of a measure, this is a add-on as part of the inclusion of the effect of household savings on the decision to adapt
  (ifelse
    ;The cost within a certain tick for a certain measure are determined via the ticks
    ;Costs are made of fixed and variable costs
    (measure_id = 0) [; If elevation measure
      report ((item measure_Id cost_fix) + (item measure_id cost_var) * build_size * ( (item 8 inund) + item measure_id effectiv_lvl))
      ;replace the item of the list c_elev at the position of the ticks (currently 0) with the costs for the measure
      ;the costs for the elevation measure are the fixed cost plus the variable cost.
      ;The variable cost however are per m3. Therefore, we need to mulitply the building size (m2) with the elevation level (m).
      ;The elevation measure increases the floor elevation to a level which is 30 cm higher than a current 100-year flood-level
      ;We choose the 100-year flood level from the 2030 scenario, as this can be considered a “current” flood-level from a 2020 perspective. Moreover, we choose the RCP8.5 scenario, which is considered more likely than the RCP2.6 (source).
      ;This gives us the 2030100_rcp8.5 scenario, which is the item 8 of the inundation list.
    ]
    (measure_id = 1) [; If wet-proofing measure
      report ((item measure_Id cost_fix) + (item measure_id cost_var) * build_size)
      ;For wet-and dry-proofing the variable cost are per m2. Therefore, it only needs to be multiplied with the building size!
    ]
    (measure_id = 2) [; If dry-proofing measure
      report ((item measure_Id cost_fix) + (item measure_id cost_var) * build_size)
    ]
  )
end

to update-global-tracking-variables; Function to update global tracking variables for output on behaviourspace
  ;Tracking adaptation diffusion for measure combinations
  Set Adapted_none         count turtles with [(item 0 UG = 0) AND (item 1 UG = 0) AND (item 2 UG = 0) ]
  Set Adapted_elev         count turtles with [(item 0 UG = 1) AND (item 1 UG = 0) AND (item 2 UG = 0) ]
  Set Adapted_wet          count turtles with [(item 0 UG = 0) AND (item 1 UG = 1) AND (item 2 UG = 0) ]
  Set Adapted_dry          count turtles with [(item 0 UG = 0) AND (item 1 UG = 0) AND (item 2 UG = 1) ]
  Set Adapted_elev_wet     count turtles with [(item 0 UG = 1) AND (item 1 UG = 1) AND (item 2 UG = 0) ]
  Set Adapted_elev_dry     count turtles with [(item 0 UG = 1) AND (item 1 UG = 0) AND (item 2 UG = 1) ]
  Set Adapted_wet_dry      count turtles with [(item 0 UG = 0) AND (item 1 UG = 1) AND (item 2 UG = 1) ]
  Set Adapted_all          count turtles with [(item 0 UG = 1) AND (item 1 UG = 1) AND (item 2 UG = 1) ]
  Set Adapted_at_least_one count turtles with [(item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1) ]

 ;Adaptation effectiveness --> Can be used to calcuate potential flood damage without adaptation as well as remaining flood damage after adaptation
  Set Sum_fl_dam_build sum [item ticks fl_dam_build] of turtles
  Set Sum_fl_dam_cont sum [item ticks fl_dam_cont] of turtles

  Set Benefit_all_elev sum [item ticks b_elev] of turtles
  Set Benefit_all_elev_build sum [item ticks b_elev_build] of turtles
  Set Benefit_all_elev_cont  sum [item ticks b_elev_cont] of turtles

  Set Benefit_all_wet sum [item ticks b_wet] of turtles
  Set Benefit_all_wet_build sum [item ticks b_wet_build] of turtles
  Set Benefit_all_wet_cont  sum [item ticks b_wet_cont] of turtles

  Set Benefit_all_dry sum [item ticks b_dry] of turtles
  Set Benefit_all_dry_build sum [item ticks b_dry_build] of turtles
  Set Benefit_all_dry_cont  sum [item ticks b_dry_cont] of turtles

  ;Adaptation efficiency -> Together with benefit can be used to calculate cost/benefit of adaptation measures
  Set Cost_all_elev sum [item ticks c_elev] of turtles
  Set Cost_all_wet sum [item ticks c_wet] of turtles
  Set Cost_all_dry sum [item ticks c_dry] of turtles

  ; Savings
  Set Total_savings sum [item ticks savings] of turtles
  Set Cannot_afford sum [item ticks hindered_by_savings] of turtles

  ;Flood Experience
  Set No_Fl_Exp count turtles with [fl_exp = 0]
  Set Very_Low_Fl_Exp count turtles with [fl_exp = 1]
  Set Low_Fl_Exp count turtles with [fl_exp = 2]
  Set Medium_Fl_Exp count turtles with [fl_exp = 3]
  Set High_Fl_Exp count turtles with [fl_exp = 4]
  Set Very_High_Fl_Exp count turtles with [fl_exp = 5]

  ;Worry
  Set Adapted_elev_worry_low        (count turtles with [(item 0 UG = 1) AND (worry <= 2.33) ] / count turtles with [(worry <= 2.33)])
  Set Adapted_elev_worry_medium     (count turtles with [(item 0 UG = 1) AND (worry > 2.33) AND (worry <= 3.67) ] / count turtles with [(worry > 2.33) AND (worry <= 3.67)])
  Set Adapted_elev_worry_high       (count turtles with [(item 0 UG = 1) AND (worry > 3.67)] / count turtles with [worry > 3.67])

  Set Adapted_wet_worry_low        (count turtles with [(item 1 UG = 1) AND (worry <= 2.33) ] / count turtles with [(worry <= 2.33)])
  Set Adapted_wet_worry_medium     (count turtles with [(item 1 UG = 1) AND (worry > 2.33) AND (worry <= 3.67) ] / count turtles with [(worry > 2.33) AND (worry <= 3.67)])
  Set Adapted_wet_worry_high       (count turtles with [(item 1 UG = 1) AND (worry > 3.67)] / count turtles with [worry > 3.67])

  Set Adapted_dry_worry_low        (count turtles with [(item 2 UG = 1) AND (worry <= 2.33) ] / count turtles with [(worry <= 2.33)])
  Set Adapted_dry_worry_medium     (count turtles with [(item 2 UG = 1) AND (worry > 2.33) AND (worry <= 3.67) ] / count turtles with [(worry > 2.33) AND (worry <= 3.67)])
  Set Adapted_dry_worry_high       (count turtles with [(item 2 UG = 1) AND (worry > 3.67)] / count turtles with [worry > 3.67])

  Set Benefit_elev_worry_low       sum [item ticks b_elev] of turtles with [worry <= 2.33]
  Set Benefit_elev_worry_medium    sum [item ticks b_elev] of turtles with [(worry > 2.33) AND (worry <= 3.67)]
  Set Benefit_elev_worry_high      sum [item ticks b_elev] of turtles with [worry > 3.67]

  Set Benefit_wet_worry_low       sum [item ticks b_wet] of turtles with [worry <= 2.33]
  Set Benefit_wet_worry_medium    sum [item ticks b_wet] of turtles with [(worry > 2.33) AND (worry <= 3.67)]
  Set Benefit_wet_worry_high      sum [item ticks b_wet] of turtles with [worry > 3.67]

  Set Benefit_dry_worry_low       sum [item ticks b_dry] of turtles with [worry <= 2.33]
  Set Benefit_dry_worry_medium    sum [item ticks b_dry] of turtles with [(worry > 2.33) AND (worry <= 3.67)]
  Set Benefit_dry_worry_high      sum [item ticks b_dry] of turtles with [worry > 3.67]

  Set fl_dam_worry_low       sum [item ticks fl_dam_build + item ticks fl_dam_cont] of turtles with [(worry <= 2.33)]
  Set fl_dam_worry_medium    sum [item ticks fl_dam_build + item ticks fl_dam_cont] of turtles with [(worry > 2.33) AND (worry <= 3.67)]
  Set fl_dam_worry_high      sum [item ticks fl_dam_build + item ticks fl_dam_cont] of turtles with [(worry > 3.67)]

  ;Self efficacy
  Set Adapted_elev_self_eff_low        (count turtles with [(item 0 UG = 1) AND (item 0 self_eff <= 2.33) ] / count turtles with [(item 0 self_eff <= 2.33)])
  Set Adapted_elev_self_eff_medium     (count turtles with [(item 0 UG = 1) AND (item 0 self_eff > 2.33) AND (item 0 self_eff <= 3.67) ] / count turtles with [(item 0 self_eff > 2.33) AND (item 0 self_eff <= 3.67)])
  Set Adapted_elev_self_eff_high       (count turtles with [(item 0 UG = 1) AND (item 0 self_eff > 3.67)] / count turtles with [item 0 self_eff > 3.67])

  Set Adapted_wet_self_eff_low        (count turtles with [(item 1 UG = 1) AND (item 1 self_eff <= 2.33) ] / count turtles with [(item 1 self_eff <= 2.33)])
  Set Adapted_wet_self_eff_medium     (count turtles with [(item 1 UG = 1) AND (item 1 self_eff > 2.33) AND (item 1 self_eff <= 3.67) ] / count turtles with [(item 1 self_eff > 2.33) AND (item 1 self_eff <= 3.67)])
  Set Adapted_wet_self_eff_high       (count turtles with [(item 1 UG = 1) AND (item 1 self_eff > 3.67)] / count turtles with [item 1 self_eff > 3.67])

  Set Adapted_dry_self_eff_low        (count turtles with [(item 2 UG = 1) AND (item 2 self_eff <= 2.33) ] / count turtles with [(item 2 self_eff <= 2.33)])
  Set Adapted_dry_self_eff_medium     (count turtles with [(item 2 UG = 1) AND (item 2 self_eff > 2.33) AND (item 2 self_eff <= 3.67) ] / count turtles with [(item 2 self_eff > 2.33) AND (item 2 self_eff <= 3.67)])
  Set Adapted_dry_self_eff_high       (count turtles with [(item 2 UG = 1) AND (item 2 self_eff > 3.67)] / count turtles with [item 2 self_eff > 3.67])

  Set Benefit_elev_self_eff_low       sum [item ticks b_elev] of turtles with [item 0 self_eff <= 2.33]
  Set Benefit_elev_self_eff_medium    sum [item ticks b_elev] of turtles with [(item 0 self_eff > 2.33) AND (item 0 self_eff <= 3.67)]
  Set Benefit_elev_self_eff_high      sum [item ticks b_elev] of turtles with [item 0 self_eff > 3.67]

  Set Benefit_wet_self_eff_low       sum [item ticks b_wet] of turtles with [item 1 self_eff <= 2.33]
  Set Benefit_wet_self_eff_medium    sum [item ticks b_wet] of turtles with [(item 1 self_eff > 2.33) AND (item 1 self_eff <= 3.67)]
  Set Benefit_wet_self_eff_high      sum [item ticks b_wet] of turtles with [item 1 self_eff > 3.67]

  Set Benefit_dry_self_eff_low       sum [item ticks b_dry] of turtles with [item 2 self_eff <= 2.33]
  Set Benefit_dry_self_eff_medium    sum [item ticks b_dry] of turtles with [(item 2 self_eff > 2.33) AND (item 2 self_eff <= 3.67)]
  Set Benefit_dry_self_eff_high      sum [item ticks b_dry] of turtles with [item 2 self_eff > 3.67]

  Set fl_dam_elev_self_eff_low       sum [item ticks fl_dam_build + item ticks fl_dam_cont] of turtles with [(item 0 self_eff <= 2.33)]
  Set fl_dam_elev_self_eff_medium    sum [item ticks fl_dam_build + item ticks fl_dam_cont] of turtles with [(item 0 self_eff > 2.33) AND (item 0 self_eff <= 3.67)]
  Set fl_dam_elev_self_eff_high      sum [item ticks fl_dam_build + item ticks fl_dam_cont] of turtles with [(item 0 self_eff > 3.67)]

  Set fl_dam_wet_self_eff_low       sum [item ticks fl_dam_build + item ticks fl_dam_cont] of turtles with [(item 1 self_eff <= 2.33)]
  Set fl_dam_wet_self_eff_medium    sum [item ticks fl_dam_build + item ticks fl_dam_cont] of turtles with [(item 1 self_eff > 2.33) AND (item 1 self_eff <= 3.67)]
  Set fl_dam_wet_self_eff_high      sum [item ticks fl_dam_build + item ticks fl_dam_cont] of turtles with [(item 1 self_eff > 3.67)]

  Set fl_dam_dry_self_eff_low       sum [item ticks fl_dam_build + item ticks fl_dam_cont] of turtles with [(item 2 self_eff <= 2.33)]
  Set fl_dam_dry_self_eff_medium    sum [item ticks fl_dam_build + item ticks fl_dam_cont] of turtles with [(item 2 self_eff > 2.33) AND (item 2 self_eff <= 3.67)]
  Set fl_dam_dry_self_eff_high      sum [item ticks fl_dam_build + item ticks fl_dam_cont] of turtles with [(item 2 self_eff > 3.67)]

  ;Soc network
  Set Adapted_elev_soc_net_small   (count turtles with [(item 0 UG = 1) AND (soc_net <= 1 * Difference_soc_net_adapted_soc_net) ] / count turtles with [(soc_net <= 1 * Difference_soc_net_adapted_soc_net)])
  Set Adapted_elev_soc_net_medium  (count turtles with [(item 0 UG = 1) AND (soc_net > 1 * Difference_soc_net_adapted_soc_net) AND (soc_net <= 3 * Difference_soc_net_adapted_soc_net) ] / count turtles with [(soc_net > 1 * Difference_soc_net_adapted_soc_net) AND (soc_net <= 3 * Difference_soc_net_adapted_soc_net)])
  Set Adapted_elev_soc_net_large   (count turtles with [(item 0 UG = 1) AND (soc_net >= 4 * Difference_soc_net_adapted_soc_net) ] / count turtles with [(soc_net >= 4 * Difference_soc_net_adapted_soc_net)])

  Set Adapted_wet_soc_net_small   (count turtles with [(item 1 UG = 1) AND (soc_net <= 1 * Difference_soc_net_adapted_soc_net) ] / count turtles with [(soc_net <= 1 * Difference_soc_net_adapted_soc_net)])
  Set Adapted_wet_soc_net_medium  (count turtles with [(item 1 UG = 1) AND (soc_net > 1 * Difference_soc_net_adapted_soc_net) AND (soc_net <= 3 * Difference_soc_net_adapted_soc_net) ] / count turtles with [(soc_net > 1 * Difference_soc_net_adapted_soc_net) AND (soc_net <= 3 * Difference_soc_net_adapted_soc_net)])
  Set Adapted_wet_soc_net_large   (count turtles with [(item 1 UG = 1) AND (soc_net >= 4 * Difference_soc_net_adapted_soc_net) ] / count turtles with [(soc_net >= 4 * Difference_soc_net_adapted_soc_net)])

  Set Adapted_dry_soc_net_small   (count turtles with [(item 2 UG = 1) AND (soc_net <= 1 * Difference_soc_net_adapted_soc_net) ] / count turtles with [(soc_net <= 1 * Difference_soc_net_adapted_soc_net)])
  Set Adapted_dry_soc_net_medium  (count turtles with [(item 2 UG = 1) AND (soc_net > 1 * Difference_soc_net_adapted_soc_net) AND (soc_net <= 3 * Difference_soc_net_adapted_soc_net) ] / count turtles with [(soc_net > 1 * Difference_soc_net_adapted_soc_net) AND (soc_net <= 3 * Difference_soc_net_adapted_soc_net)])
  Set Adapted_dry_soc_net_large   (count turtles with [(item 2 UG = 1) AND (soc_net >= 4 * Difference_soc_net_adapted_soc_net) ] / count turtles with [(soc_net >= 4 * Difference_soc_net_adapted_soc_net)])

  Set Benefit_elev_soc_net_small     sum [item ticks b_elev] of turtles with [soc_net <= 1 * Difference_soc_net_adapted_soc_net]
  Set Benefit_elev_soc_net_medium    sum [item ticks b_elev] of turtles with [(soc_net > 1 * Difference_soc_net_adapted_soc_net) AND (soc_net <= 3 * Difference_soc_net_adapted_soc_net)]
  Set Benefit_elev_soc_net_large     sum [item ticks b_elev] of turtles with [soc_net >= 4 * Difference_soc_net_adapted_soc_net]

  Set Benefit_wet_soc_net_small     sum [item ticks b_wet] of turtles with [soc_net <= 1 * Difference_soc_net_adapted_soc_net]
  Set Benefit_wet_soc_net_medium    sum [item ticks b_wet] of turtles with [(soc_net > 1 * Difference_soc_net_adapted_soc_net) AND (soc_net <= 3 * Difference_soc_net_adapted_soc_net)]
  Set Benefit_wet_soc_net_large     sum [item ticks b_wet] of turtles with [soc_net >= 4 * Difference_soc_net_adapted_soc_net]

  Set Benefit_dry_soc_net_small     sum [item ticks b_dry] of turtles with [soc_net <= 1 * Difference_soc_net_adapted_soc_net]
  Set Benefit_dry_soc_net_medium    sum [item ticks b_dry] of turtles with [(soc_net > 1 * Difference_soc_net_adapted_soc_net) AND (soc_net <= 3 * Difference_soc_net_adapted_soc_net)]
  Set Benefit_dry_soc_net_large     sum [item ticks b_dry] of turtles with [soc_net >= 4 * Difference_soc_net_adapted_soc_net]

  Set fl_dam_soc_net_small     sum [item ticks fl_dam_build + item ticks fl_dam_cont] of turtles with [(soc_net <= 1 * Difference_soc_net_adapted_soc_net)]
  Set fl_dam_soc_net_medium    sum [item ticks fl_dam_build + item ticks fl_dam_cont] of turtles with [(soc_net > 1 * Difference_soc_net_adapted_soc_net) AND (soc_net <= 3 * Difference_soc_net_adapted_soc_net)]
  Set fl_dam_soc_net_large     sum [item ticks fl_dam_build + item ticks fl_dam_cont] of turtles with [(soc_net >= 4 * Difference_soc_net_adapted_soc_net)]

  ;Income
  Set Adapted_elev_income_low        (count turtles with [(item 0 UG = 1) AND (income = 1863 OR income = 3225) ] / count turtles with [(income = 1863 OR income = 3225)])
  Set Adapted_elev_income_medium     (count turtles with [(item 0 UG = 1) AND (income = 3959 OR income = 5359) ] / count turtles with [(income = 3959 OR income = 5359)])
  Set Adapted_elev_income_high       (count turtles with [(item 0 UG = 1) AND (income >= 8299)] / count turtles with [income >= 8299])

  Set Adapted_wet_income_low        (count turtles with [(item 1 UG = 1) AND (income = 1863 OR income = 3225) ] / count turtles with [(income = 1863 OR income = 3225)])
  Set Adapted_wet_income_medium     (count turtles with [(item 1 UG = 1) AND (income = 3959 OR income = 5359) ] / count turtles with [(income = 3959 OR income = 5359)])
  Set Adapted_wet_income_high       (count turtles with [(item 1 UG = 1) AND (income >= 8299)] / count turtles with [income >= 8299])

  Set Adapted_dry_income_low        (count turtles with [(item 2 UG = 1) AND (income = 1863 OR income = 3225) ] / count turtles with [(income = 1863 OR income = 3225)])
  Set Adapted_dry_income_medium     (count turtles with [(item 2 UG = 1) AND (income = 3959 OR income = 5359) ] / count turtles with [(income = 3959 OR income = 5359)])
  Set Adapted_dry_income_high       (count turtles with [(item 2 UG = 1) AND (income >= 8299)] / count turtles with [income >= 8299])

  Set benefit_elev_income_low        sum [(item ticks b_elev)] of turtles with [(income = 1863 OR income = 3225) AND (item 0 UG = 1) ]
  Set benefit_elev_income_medium     sum [(item ticks b_elev)] of turtles with [(income = 3959 OR income = 5359) AND (item 0 UG = 1)]
  Set benefit_elev_income_high       sum [(item ticks b_elev)] of turtles with [(income >= 8299) AND (item 0 UG = 1)]

  Set benefit_wet_income_low        sum [(item ticks b_wet)] of turtles with [(income = 1863 OR income = 3225) AND (item 1 UG = 1)]
  Set benefit_wet_income_medium     sum [(item ticks b_wet)] of turtles with [(income = 3959 OR income = 5359) AND (item 1 UG = 1)]
  Set benefit_wet_income_high       sum [(item ticks b_wet)] of turtles with [(income >= 8299) AND (item 1 UG = 1)]

  Set benefit_dry_income_low        sum [(item ticks b_dry)] of turtles with [(income = 1863 OR income = 3225) AND (item 2 UG = 1)]
  Set benefit_dry_income_medium     sum [(item ticks b_dry)] of turtles with [(income = 3959 OR income = 5359) AND (item 2 UG = 1)]
  Set benefit_dry_income_high       sum [(item ticks b_dry)] of turtles with [(income >= 8299) AND (item 2 UG = 1)]

  Set fl_dam_income_low        sum [(item ticks fl_dam_build + item ticks fl_dam_cont)] of turtles with [(income = 1863 OR income = 3225)]
  Set fl_dam_income_medium     sum [(item ticks fl_dam_build + item ticks fl_dam_cont)] of turtles with [(income = 3959 OR income = 5359)]
  Set fl_dam_income_high       sum [(item ticks fl_dam_build + item ticks fl_dam_cont)] of turtles with [(income >= 8299)]

end

to verify-visualization ;Verify that the turtles are displayed correctly
  if visualization? [
    if (any? turtles with [district != [district_name] of patch-here]) [
      user-message (word "Households are not displayed on the right district!")
      print (word "Households are not displayed on the right district!")
    ]
  ]
end

;Functions which verify the setup
to verify-direct-neighbourhood
  if (count turtles with [length Direct_NN_IDs != soc_net] > 0) [
    user-message (word "ERROR: The number of direct nearest neighbours does not align with their parameter value for the size of the social network (soc_net)!")
    print (word "ERROR: The number of direct nearest neighbours does not align with their parameter value for the size of the social network (soc_net)!")
  stop
  ]
end

to verify-indirect-neighbourhood
  if any? turtles with [length indirect_nn_ids != count turtles with [member? [id] of myself direct_nn_ids]] [ ;are there any turtles where the number of households that consider me an direct neighbours which is capture in the nn_ids list is enqual to the actual number of househols which consider me a direct neighbour
    user-message (word "ERROR: The number of indirect neighbours have not been set up correctly!")
    print (word "ERROR: The number of indirect neighbours have not been set up correctly!")
    stop
  ]
end

to verify-cost-calculation
  ; this function only works for the setup!
  ; Rationale: When a measure is undergone in tick 1, the costs must be set. Therefore, the count of turtles with undergone of a measure must match the count of costs accounted for.
  IF ( (count turtles with [item ticks c_elev > 0] != count turtles with [item 0 UG = 1])
  OR (count turtles with [item ticks c_wet > 0] != count turtles with [item 1 UG = 1])
  OR (count turtles with [item ticks c_dry > 0] != count turtles with [item 2 UG = 1])) [
    user-message (word "ERROR: Cost parameter misaligns with undergone")
    print (word "ERROR: Cost parameter misaligns with undergone")
    stop
  ]
end

to verify-agent-state
  Foreach [0 1 2] [ x -> ;for each measure, the number of turtles who have set the status to 2 at ticks (=0) must equal the number of turtles who have UG 1 for the setup!
    if (NOT( COUNT turtles with [(item ticks item x adapt_status = 2 )] = COUNT turtles with [(item  x ug = 1 )])) [
      user-message (word "ERROR: agent states in tick 0 misalign with undergone parameter UG")
      print (word "ERROR: agent states in tick 0 misalign with undergone parameter UG")
      stop
    ]
  ]
end

to verify-time
  Foreach [0 1 2] [ measure_id -> ;for each measure make sure that the lifetime is at least as large as the time_horizon preceeding the simulation where households can have started the implementation of the measure. Otherwise, the measure might not expire
    if (time_horizon_prec_implement > item measure_id life_time) [
      user-message (word "CAUTION: For a seamingless functionoing of the model, please select a lifetime for measure " measure_id " which exceeds the value of the parameter " time_horizon_prec_implement)
      print (word "CAUTION: For a seamingless functionoing of the model, please select a lifetime for measure " measure_id " which exceeds the value of the parameter " time_horizon_prec_implement)
    ]
  ]
end

to setup-map ;function to setup the map on the GUI
  if visualization? [
    import-pcolors "Images/Shanghai_city_center_map.png"
    ask patches [; go through all the patches and assign them their district name based on their color. The colors are set slightly different for each district based on a OSM map in QGIS
    (ifelse ;it is important that the strings for the district names are similar as in the district parameter of the turtles, so that they can be easily assigned
        (pcolor = 5  ) [set district_name "Yangpu District"]
        (pcolor = 8.2) [set district_name "Hongkou District"]
        (pcolor = 6.7) [set district_name "Jing'an District"]
        (pcolor = 7.1) [set district_name "Huangpu District"]
        (pcolor = 6  ) [set district_name "Putuo District"]
        (pcolor = 9.1) [set district_name "Changning District"]
        (pcolor = 5.6) [set district_name "Xuhui District"]
      )
    ]
    let legend bitmap:import "Images/legend.png" ;import the legend
    Bitmap:copy-to-drawing legend 450 400       ;put the legend into the picture
  ]
end

to print-configuration ;Function to print the setup-summary
  ifelse
  (count turtles > 0) [
    if Setup-Summary? = TRUE [
      output-print ("--------------------Setup Summary--------------------")
      output-print ("")
      output-print ("----------Summary Setup Global Parameters----------")
      output-print ("")
      output-print (word "Simulation time from year "Starting_year " until " (Starting_year + time_horizon))
      output-print (word "Depth-damage-function: " depth-damage-function)
      output-print ("")
      let w 0
      while [w <= time_horizon] [
        output-print (word "Flood scenario selected in year " (w + starting_year)": " item w fl_scenario)
        set w (w + 1)
      ]
      output-print ("")
      output-print (word "Intention gap: " ((precision Intention_gap 4) * 100) "%")
      output-print (word "Building foundation elevation: " foundation_height " meter")
      output-print ("")
      let measure "none"
      foreach [0 1 2] [
        x ->
        (ifelse
          x = 0 [set measure "Elevation"]
          x = 1 [set measure "Wet-proofing"]
          [set measure "Dry-proofing"]
        )
        output-print (word measure ":")
        output-print (word "- Effectivness building damage reduction: " ((item x Effectiv_build)* 100) "%")
        output-print (word "- Effectivness content damage reduction: " ((item x Effectiv_cont)* 100) "%")
        output-print (word "- Effectivness level: " (item x Effectiv_lvl) " meter")
        output-print (word "- Lifetime of measure: " (item x life_time) " years")
        output-print (word "- Implementation time of measure: " (item x implement_time) " years")
        output-print (word "- Fixed costs: " (item x cost_fix) " €")
        (ifelse
          x = 0 [  output-print (word "- Variable costs: " (item x cost_var) " €/m3")]
          [output-print (word "- Variable costs: " (item x cost_var) " €/m2")]
        )

        output-print ("")
      ]
      output-print ("")
      output-print ("----------Summary Setup Household Parameters----------")
      output-print ("")
      output-print (word "Max size of social network: " max_social_network_size)
      output-print (word "Districts selected: " selected_districts)
      output-print (word "Number of households: " count turtles)
      output-print (word "... living in apartments: " count turtles with [build_type = "Apartment"] " (" (( precision (count turtles with [build_type = "Apartment"] / count turtles) 4 ) * 100 ) "%)" )
      output-print (word "... living in houses: " count turtles with [build_type = "House"] " (" (( precision (count turtles with [build_type = "House"] / count turtles) 4 ) * 100 ) "%)" )
      output-print ("")
      output-print (word "... who rent: " count turtles with [HH_status = 1] " (" (( precision (count turtles with [HH_status = 1] / count turtles) 4 ) * 100 ) "%)" )
      output-print (word "... who own: " count turtles with [HH_status = 0] " (" (( precision (count turtles with [HH_status = 0] / count turtles) 4 ) * 100 ) "%)" )
      output-print ("")
      output-print (word "... living in Huangpu District: " count turtles with [district = "Huangpu District"] " (" (( precision (count turtles with [district = "Huangpu District"] / count turtles) 4 ) * 100 ) "%)" )
      output-print (word "... living in Xuhui District: " count turtles with [district = "Xuhui District"] " (" (( precision (count turtles with [district = "Xuhui District"] / count turtles) 4 ) * 100 ) "%)" )
      output-print (word "... living in Changning District: " count turtles with [district = "Changning District"] " (" (( precision (count turtles with [district = "Changning District"] / count turtles) 4 ) * 100 ) "%)" )
      output-print (word "... living in Jing'an District: " count turtles with [district = "Jing'an District"] " (" (( precision (count turtles with [district = "Jing'an District"] / count turtles) 4 ) * 100 ) "%)" )
      output-print (word "... living in Putuo District: " count turtles with [district = "Putuo District"] " (" (( precision (count turtles with [district = "Putuo District"] / count turtles) 4 ) * 100 ) "%)" )
      output-print (word "... living in Hongkou District: " count turtles with [district = "Hongkou District"] " (" (( precision (count turtles with [district = "Hongkou District"] / count turtles) 4 ) * 100 ) "%)" )
      output-print (word "... living in Yangpu District: " count turtles with [district = "Yangpu District"] " (" (( precision (count turtles with [district = "Yangpu District"] / count turtles) 4 ) * 100 ) "%)" )
      output-print ("")
      output-print (word "... between the age of 16 and 24: " count turtles with [age = 1] " (" (( precision (count turtles with [age = 1] / count turtles) 4 ) * 100 ) "%)" )
      output-print (word "... between the age of 25 and 34: " count turtles with [age = 2] " (" (( precision (count turtles with [age = 2] / count turtles) 4 ) * 100 ) "%)" )
      output-print (word "... between the age of 35 and 44: " count turtles with [age = 3] " (" (( precision (count turtles with [age = 3] / count turtles) 4 ) * 100 ) "%)" )
      output-print (word "... between the age of 45 and 54: " count turtles with [age = 4] " (" (( precision (count turtles with [age = 4] / count turtles) 4 ) * 100 ) "%)" )
      output-print (word "... between the age of 55 and 64: " count turtles with [age = 5] " (" (( precision (count turtles with [age = 5] / count turtles) 4 ) * 100 ) "%)" )
      output-print (word "... older than 64: " count turtles with [age = 6] " (" (( precision (count turtles with [age = 6] / count turtles) 4 ) * 100 ) "%)" )
      output-print ("")
      output-print (word "... with less than a high school degree: " count turtles with [edu = 1] " (" (( precision (count turtles with [edu = 1] / count turtles) 4 ) * 100 ) "%)" )
      output-print (word "... with high school as the highest degree: " count turtles with [edu = 2] " (" (( precision (count turtles with [edu = 2] / count turtles) 4 ) * 100 ) "%)" )
      output-print (word "... with college as the highest degree: " count turtles with [edu = 3] " (" (( precision (count turtles with [edu = 3] / count turtles) 4 ) * 100 ) "%)" )
      output-print (word "... with a post graduate degree: " count turtles with [edu = 4] " (" (( precision (count turtles with [edu = 4] / count turtles) 4 ) * 100 ) "%)" )
      output-print ("")
      output-print (word "... belief in climate change: " count turtles with [CC_belief = 1] " (" (( precision (count turtles with [CC_belief = 1] / count turtles) 4 ) * 100 ) "%)" )
      output-print (word "... do NOT belief in climate change: " count turtles with [CC_belief = 0] " (" (( precision (count turtles with [CC_belief = 0] / count turtles) 4 ) * 100 ) "%)" )
      output-print ("")
      output-print (word "... with personal flood experience: " count turtles with [fl_exp > 0] " (" (( precision (count turtles with [fl_exp > 0] / count turtles) 4 ) * 100 ) "%)" )
      output-print (word "... without personal flood experience: " count turtles with [fl_exp = 0] " (" (( precision (count turtles with [fl_exp = 0] / count turtles) 4 ) * 100 ) "%)" )
      output-print ("")
      output-print (word "... who have undergone elevation: " count turtles with [item 0 UG = 1] " (" (( precision (count turtles with [item 0 UG = 1] / count turtles) 4 ) * 100 ) "%)" )
      output-print (word "... who have undergone wet-proofing: " count turtles with [item 1 UG = 1] " (" (( precision (count turtles with [item 1 UG = 1] / count turtles) 4 ) * 100 ) "%)" )
      output-print (word "... who have undergone dry-proofing: " count turtles with [item 2 UG = 1] " (" (( precision (count turtles with [item 2 UG = 1] / count turtles) 4 ) * 100 ) "%)" )
      output-print ("")
      output-print (word "... who are flooded (inundation level > 0.1m) for: " )
      output-print (word "...... a 1000-year flood in 2010: " count turtles with [item 0 Inund > 0.1] " (" (( precision (count turtles with [item 0 Inund > 0.1]  / count turtles) 4 ) * 100 ) "%)" )    ;20101000_both
      output-print (word "...... a 100-year flood in 2010: " count turtles with [item 1 Inund > 0.1] " (" (( precision (count turtles with [item 1 Inund > 0.1]  / count turtles) 4 ) * 100 ) "%)" )     ;2010100_both
      output-print (word "...... a 10-year flood in 2010: " count turtles with [item 2 Inund > 0.1] " (" (( precision (count turtles with [item 2 Inund > 0.1]  / count turtles) 4 ) * 100 ) "%)" )      ;201010_both
      output-print ("")
      output-print (word "...... a 1000-year flood in 2100 under the RCP 8.5 scenario: " count turtles with [item 3 Inund > 0.1] " (" (( precision (count turtles with [item 3 Inund > 0.1]  / count turtles) 4 ) * 100 ) "%)" )    ;21001000_rcp8.5
      output-print (word "...... a 1000-year flood in 2050 under the RCP 8.5 scenario: " count turtles with [item 4 Inund > 0.1] " (" (( precision (count turtles with [item 4 Inund > 0.1]  / count turtles) 4 ) * 100 ) "%)" )    ;20501000_rcp8.5
      output-print (word "...... a 1000-year flood in 2030 under the RCP 8.5 scenario: " count turtles with [item 5 Inund > 0.1] " (" (( precision (count turtles with [item 5 Inund > 0.1]  / count turtles) 4 ) * 100 ) "%)" )    ;20301000_rcp8.5
      output-print ("")
      output-print (word "...... a 100-year flood in 2100 under the RCP 8.5 scenario: " count turtles with [item 6 Inund > 0.1] " (" (( precision (count turtles with [item 6 Inund > 0.1]  / count turtles) 4 ) * 100 ) "%)" )    ;2100100_rcp8.5
      output-print (word "...... a 100-year flood in 2050 under the RCP 8.5 scenario: " count turtles with [item 7 Inund > 0.1] " (" (( precision (count turtles with [item 7 Inund > 0.1]  / count turtles) 4 ) * 100 ) "%)" )    ;2050100_rcp8.5
      output-print (word "...... a 100-year flood in 2030 under the RCP 8.5 scenario: " count turtles with [item 8 Inund > 0.1] " (" (( precision (count turtles with [item 8 Inund > 0.1]  / count turtles) 4 ) * 100 ) "%)" )    ;2030100_rcp8.5
      output-print ("")
      output-print (word "...... a 10-year flood in 2100 under the RCP 8.5 scenario: " count turtles with [item 9 Inund > 0.1] " (" (( precision (count turtles with [item 9 Inund > 0.1]  / count turtles) 4 ) * 100 ) "%)" )      ;210010_rcp8.5
      output-print (word "...... a 10-year flood in 2050 under the RCP 8.5 scenario: " count turtles with [item 10 Inund > 0.1] " (" (( precision (count turtles with [item 10 Inund > 0.1]  / count turtles) 4 ) * 100 ) "%)" )    ;205010_rcp8.5
      output-print (word "...... a 10-year flood in 2030 under the RCP 8.5 scenario: " count turtles with [item 11 Inund > 0.1] " (" (( precision (count turtles with [item 11 Inund > 0.1]  / count turtles) 4 ) * 100 ) "%)" )    ;203010_rcp8.5
      output-print ("")
      output-print (word "...... a 1000-year flood in 2100 under the RCP 2.6 scenario: " count turtles with [item 12 Inund > 0.1] " (" (( precision (count turtles with [item 12 Inund > 0.1]  / count turtles) 4 ) * 100 ) "%)" )    ;21001000_rcp2.6
      output-print (word "...... a 1000-year flood in 2050 under the RCP 2.6 scenario: " count turtles with [item 13 Inund > 0.1] " (" (( precision (count turtles with [item 13 Inund > 0.1]  / count turtles) 4 ) * 100 ) "%)" )    ;20501000_rcp2.6
      output-print (word "...... a 1000-year flood in 2030 under the RCP 2.6 scenario: " count turtles with [item 14 Inund > 0.1] " (" (( precision (count turtles with [item 14 Inund > 0.1]  / count turtles) 4 ) * 100 ) "%)" )    ;20301000_rcp2.6
      output-print ("")
      output-print (word "...... a 100-year flood in 2100 under the RCP 2.6 scenario: " count turtles with [item 15 Inund > 0.1] " (" (( precision (count turtles with [item 15 Inund > 0.1]  / count turtles) 4 ) * 100 ) "%)" )    ;2100100_rcp2.6
      output-print (word "...... a 100-year flood in 2050 under the RCP 2.6 scenario: " count turtles with [item 16 Inund > 0.1] " (" (( precision (count turtles with [item 16 Inund > 0.1]  / count turtles) 4 ) * 100 ) "%)" )    ;2050100_rcp2.6
      output-print (word "...... a 100-year flood in 2030 under the RCP 2.6 scenario: " count turtles with [item 17 Inund > 0.1] " (" (( precision (count turtles with [item 17 Inund > 0.1]  / count turtles) 4 ) * 100 ) "%)" )    ;2030100_rcp2.6
      output-print ("")
      output-print (word "...... a 10-year flood in 2100 under the RCP 2.6 scenario: " count turtles with [item 18 Inund > 0.1] " (" (( precision (count turtles with [item 18 Inund > 0.1]  / count turtles) 4 ) * 100 ) "%)" )      ;210010_rcp2.6
      output-print (word "...... a 10-year flood in 2050 under the RCP 2.6 scenario: " count turtles with [item 19 Inund > 0.1] " (" (( precision (count turtles with [item 19 Inund > 0.1]  / count turtles) 4 ) * 100 ) "%)" )    ;205010_rcp2.6
      output-print (word "...... a 10-year flood in 2030 under the RCP 2.6 scenario: " count turtles with [item 20 Inund > 0.1] " (" (( precision (count turtles with [item 20 Inund > 0.1]  / count turtles) 4 ) * 100 ) "%)" )    ;203010_rcp2.6
      output-print ("")
      let j 0
      while [j <= [soc_net] of one-of turtles with-max [soc_net]] [
        output-print (word "... with " j " nearest neighbours: " count turtles with [soc_net = j] " (" (( precision (count turtles with [soc_net = j]  / count turtles) 4 ) * 100 ) "%)" )
        set j j + 1
      ]
      output-print ("")
      let i 0
      while [i <= length [Indirect_NN_IDs] of one-of turtles with-max [length Indirect_NN_IDs]] [
        output-print (word "... who are in the neighbourhood of " i " other households: " count turtles with [length Indirect_NN_IDs = i] " (" (( precision (count turtles with [length Indirect_NN_IDs = i]  / count turtles) 4 ) * 100 ) "%)" )
        set i i + 1
      ]
    ]
  ]
  [;no turtles
    user-message (word "ERROR: There is no household selected! Plese select at least one district")
    print (word "ERROR: There is no household selected! Plese select at least one district")
    Stop
  ]
end


;//////////////////////////////////////////////////////////////////////////////////GO
to go
  ;General
  tick; next time step
  print (word "tick: " ticks  " ; Year: " (ticks + starting_year) "; Time: " date-and-time); give out number of ticks in command center

  ;Reset variables for verification and debugging purposes
  set Total_adapt_count_change_indirect_NNs 0
  set Total_adapt_count_change_HHs 0

  ;Determine adapt-count and adapt-status for this tick based on parameter value from last tick
  Ask turtles [
    set savings replace-item ticks savings (item (ticks - 1) savings + yearly_change_savings) ;Update savings
    set NN_adapt replace-item ticks NN_adapt (item (ticks - 1) NN_adapt); Set the adaptation counter to the value of the counter in the last tick.
    if debug? [
      print (word"Go: Household "who" with ID " ID " updates nn_adapt in tick "ticks" to: " nn_adapt)
      print (word"Go: Household "who" with ID " ID " updates savings in tick "ticks" to: " item ticks savings)
    ]

    foreach [0 1 2] [ x ->;for all measures: elevation (0), wet-proofing (1), dry-proofing (2)
      ;at the beginning of each period, the adaptation status of this year (tick) is set to the status of last year (pervious tick)
      set adapt_status replace-subitem x ticks adapt_status (item (ticks - 1) item x adapt_status)
      if debug? [
      print (word"Go: Household "who" with ID " ID " updates adaptation_status of measure "x" in tick "ticks" to: " item ticks item x adapt_status )
      ]
    ]
  ]

  ;actions based on adapt status
  Ask turtles [;For all households

    let measure_list [0 1 2]  ;elevation (0), wet-proofing (1), dry-proofing (2)

    while [NOT empty? measure_list] [ ;as long as the list is not empty ~ loop through all the measures but in a random order. This is done as the budget constrains the implementation of a measure and hence the order in which the households look at the different measures plays a role. This is one additional form of stochasticity in the model.
      let measure_id one-of measure_list ;select one measure out of the list

      ;Check adaptation status of the selected measure
      (ifelse
        (item ticks item measure_id adapt_status = 0) [ ;when adaptation status at tick t = do nothing
          check-implementation-start measure_id
        ]
        (item ticks item measure_id adapt_status = 1) [ ;when adaptation status at tick t = implementation started
          check-implementation-finish measure_id
        ]
        (item ticks item measure_id adapt_status = 2) [ ;when adaptation status at tick t = measure is implemented
          check-adaptation-expiring measure_id
        ]
      )
      set measure_list remove measure_id measure_list
      if debug? [
        print (word "GO: Household " who " with ID " ID " checks for measure " measure_id " the adaptation status")
      ]
    ]
  ]
  ;Flood
  If NOT (item ticks fl_scenario = "No_flood") [;If a flood occurs!
    print (word "Flood " (item ticks fl_scenario) " occurs in tick " ticks " (year: " (starting_year + ticks) ")") ;print if a flood occurs!
    set position_fl_scenario position (item ticks fl_scenario) fl_scenario_names ;get position of the flood-scenario in the list fl_scenario names which allows us to determine position of the flood inundation value in the inund list that we need to choose
    verify-position-fl-scenario
    ask turtles [ ;for all households
      check-flood-depth
    ]
    print (word "Go: Number of flooded households: " count turtles with [flooded?])
  ]

  update-agent-and-global-parameters ;update agent parameters at the end of the simulation run!
  verify-adapt-change
  verify-adapt-status
  ;verify-savings NO LONGER USED!


  if (ticks >= time_horizon) [ ;Check simulation end
    print (word "Simulation ended")
    print ("-------------")
    if NOT (Behaviourspace?) [;when simulations via behaviourspace, this needs to be deactivated otherwise the last tick is not written in the file.
      stop ;stop simulation if simulation time is over
    ]
  ]
end

to check-implementation-start [Measure_Id];function is only entered with adapt_status = 0 (do nothing)

  (ifelse
    (measure_id = 0) [;For elevation measure
      if ((hh_status = 0) AND (build_type = "House")) [;if the household does NOT rent AND if the building type is NOT an apartment!
        if ( item measure_id prob_implement > item measure_id implement_threshold) [ ;if the proability to implement a measure is larger or equal to a random number between 0 and 1 (threshold)
          if debug? [
            print (word "Check-implementation-start: Household "who" with ID "ID" has probability to implement measure "measure_id" of " item measure_id prob_implement " and a threshold of " item measure_id implement_threshold " in tick "ticks)
          ]
          (ifelse
            Economic_model? [
              ifelse
              (item ticks savings >= get-cost measure_id) [;a household can only adapt if it has enough savings to do so
                execute-implementation-start measure_Id
              ]
              [
                set Hindered_by_savings replace-item ticks hindered_by_savings 1
              ]
            ]
            [execute-implementation-start measure_Id]
          )
        ]
      ]
      ;]
      ;Else: Do nothing, which would mean that the adaptation status stays 0, as this function is only entered when the adaptation status is 0
    ]
    ((measure_id = 1) OR (measure_id = 2)) [;for wet- or dry-proofing measure
      if ( item measure_id prob_implement >= item measure_id implement_threshold) [ ;if the proability to implement a measure is larger or equal to a random number between 0 and 1 (threshold)
        if debug? [
          print (word "Check-implementation-start: Household "who" with ID "ID" has probability to implement measure "measure_id" of " item measure_id prob_implement " and a threshold of " item measure_id implement_threshold " in tick "ticks)
        ]
        (ifelse
          Economic_model? [
              ifelse
              (item ticks savings >= get-cost measure_id) [;a household can only adapt if it has enough savings to do so
                execute-implementation-start measure_Id
              ]
              [
                set Hindered_by_savings replace-item ticks hindered_by_savings 1
              ]
          ]
          [execute-implementation-start measure_Id]
        )
      ]
    ]
  )
end

to execute-implementation-start [Measure_Id] ;function is only enetere with adapt_sttus = 0 (do nothing)
  ;Verification and debug
  if debug? [
    print (word "Execute-implementation-start: Household "who" with ID "ID" set adaptation status of measure " measure_id " in tick "ticks" to 1 (started)")
  ]

  set adapt_status replace-subitem measure_id ticks adapt_status (1) ;set adaptation status of measure at current tick to "started" (1)
  set implement_start replace-item measure_id implement_start (ticks) ;mark the time that the implementation of the measure was started
  if (item measure_id implement_time) = 0 [ ;If the implementation time of the measure is zero, we need to check if the implementation is finished, otherwise we can skip this step
    check-implementation-finish measure_id
  ]
  set savings replace-item ticks savings (item ticks savings - get-cost measure_id);savings are reduced by cost of measure when implemented
  if debug? AND economic_model? [
    print (word "Execute-implementation-start: Household "who" with ID "ID" reduces savings by " get-cost measure_id " to " item ticks savings )
  ]
end

to check-implementation-finish [Measure_Id] ;function is only entered with adapt_status = 1 (implementing)

  if (ticks = (item measure_id implement_start) + (item measure_id implement_time)) [ ;when the implementation time is at the end

    set adapt_status replace-subitem measure_id ticks adapt_status (2) ;set adaptation status of measure at current tick to "adapted" (2)
    set implement_end replace-item measure_id implement_end (ticks) ;mark the time that the implementation was finished in order to later be able to determine when the lifetime is expired
    set UG replace-item measure_id UG (1) ;set undergone 1
    set-cost measure_id ;determine the cost of the adatpation: Assumption -> cost occur when adaptation implementation is finished

    if debug? [
      print (word "Check-implementation-finish: Household "who" with ID "ID" set adaptation status of measure " measure_id " in tick "ticks" to 2 (finished)")
      print (word "Check-implementation-finish: Household "who" with ID "ID" and indirect neighbourhood " indirect_nn_ids " sets UG of measure " measure_Id " to 1 resulting in UG " UG)
    ]

    if (measure_id = 0) [;for elevation measure
      ;adjust UG_other
      set UG_other replace-item 1 UG_other (1) ;set UG_other of wet-proofing to 1
      set UG_other replace-item 2 UG_other (1) ;set UG_other of dry-proofing to 1
      ;adjust NN_adapt
      if (( item 1 UG = 0 ) AND (item 2 UG = 0 )) [ ;when wet-proofing and dry-proofing is not undergone, then
        increase-adaptation-count-indirect-neighbours ;increase tne adaptation count of the indirect neighbours which are influenced by my action, as I transitioned from 0 to at least one adapted measure, which is visible to the indirect neighbours
      ]
    ]

    if (measure_id = 1) [;for wet-proofing measure
      ;adjust UG_other
      set UG_other replace-item 0 UG_other (1) ;set UG_other of elevation to 1
      set UG_other replace-item 2 UG_other (1) ;set UG_other of dry-proofing to 1
      ;adjust NN_adapt
      if (( item 0 UG = 0 ) AND (item 2 UG = 0 )) [ ;when elevation and dry-proofing is not undergone, then
        increase-adaptation-count-indirect-neighbours ;increase tne adaptation count of the indirect neighbours which are influenced by my action, as I transitioned from 0 to at least one adapted measure, which is visible to the indirect neighbours
      ]
    ]

    if (measure_id = 2) [;for dry-proofing measure
      ;adjust UG_other
      set UG_other replace-item 0 UG_other (1) ;set UG_other of elevation to 1
      set UG_other replace-item 1 UG_other (1) ;set UG_other of wet-proofing to 1
      ;adjust NN_adapt
      if (( item 0 UG = 0 ) AND (item 1 UG = 0 )) [ ;when elevation and wet-proofing is not undergone, then
        increase-adaptation-count-indirect-neighbours ;increase tne adaptation count of the indirect neighbours which are influenced by my action, as I transitioned from 0 to at least one adapted measure, which is visible to the indirect neighbours
      ]
    ]

    if (item measure_id life_time_indiv) = 0 [ ;If the life time of the measure is zero, we need to check if the implementation is expired, otherwise we can skip this step
      check-adaptation-expiring measure_id
    ]
   ]
end

to check-adaptation-expiring [Measure_Id] ;function is only entered with adapt_status = 2 (adapted)

  if (ticks = (item measure_id implement_end) + (item measure_id life_time_Indiv)) [ ;when the lifetime of the measure is at the end
    set adapt_status replace-subitem measure_id ticks adapt_status (0) ;set adaptation status of measure at current tick back to "do nothing" (0)
    set UG replace-item measure_id UG (0) ;set undergone 0

    if debug? [
      print (word "Check-adaptation-expiring: Household "who" with ID "ID" and indirect neighbourhood " indirect_nn_ids " sets adaptation status of measure " measure_Id " to 0 (do nothing), resulting in UG " UG)
    ]

    if (measure_id = 0) [; for elevation measure
      if (item 1 UG = 0) [;if wet-proofing is not undergone
        set UG_other replace-item 2 UG_other (0) ;set undergone other of dry-proofing back to 0 as neither elevation nor wet-proofing is undergone
      ]
      if (item 2 UG = 0) [;if dry-proofing is not undergone
        set UG_other replace-item 1 UG_other (0) ;set undergone other of wet-proofing back to 0 as neither elevation nor dry-proofing is undergone
      ]
    ]

    if (measure_id = 1) [; for wet-proofing measure
      if (item 0 UG = 0) [;if elevation is not undergone
        set UG_other replace-item 2 UG_other (0) ;set undergone other of dry-proofing back to 0 as neither elevation nor wet-proofing is undergone
      ]
      if (item 2 UG = 0) [;if dry-proofing is not undergone
        set UG_other replace-item 0 UG_other (0) ;set undergone other of elevation back to 0 as neither wet- nor dry-proofing is undergone
      ]
    ]

    if (measure_id = 2) [; for dry-proofing measure
      if (item 0 UG = 0) [;if elevation is not undergone
        set UG_other replace-item 1 UG_other (0) ;set undergone other of wet-proofing back to 0 as neither elevation nor dry-proofing is undergone
      ]
      if (item 1 UG = 0) [;if wet-proofing is not undergone
        set UG_other replace-item 0 UG_other (0) ;set undergone other of elevation back to 0 as neither wet- nor dry-proofing is undergone
      ]
    ]

   if ( item measure_id UG_other = 0 ) [;when no other measure undergone and the measure itself is expirend, then
      decrease-adaptation-count-indirect-neighbours; the adapation count for the households which are influenced by my action is reduced
    ]
  ]
end

to increase-adaptation-count-indirect-neighbours ;procedure called by a household
  ask turtles with [member? ID [Indirect_NN_IDs] of myself] [;ask the households which are my indirect neighbours -> the ones which I influence
    if (debug?) [
      print (word "Increase-adaptation-count-indirect-neighbours called for household with ID " ID "- nn_adapt before: " (NN_adapt))
    ]

    let new_count ((item ticks NN_adapt) + 1)
    set NN_adapt replace-item ticks NN_adapt new_count; my indirect neighbours increase their adaptation count in this tick by 1, as I started adaptting

    ;Verification and Debuggin
    Set Total_adapt_count_change_indirect_NNs ( Total_adapt_count_change_indirect_NNs + 1 )
    if (debug?) [
      print (word "Increase-adaptation-count-indirect-neighbours called for household with ID " ID "- nn_adapt after: " (NN_adapt))
      ;print (word "Household with ID " [ID] of myself " increases adaptation count of household with ID "  ID " by 1 to " new_count " in tick " ticks)
    ]
  ]
end

to decrease-adaptation-count-indirect-neighbours ;procedure called by a household
  ask  turtles with [member? ID [Indirect_NN_IDs] of myself] [;ask the households which are my indirect neighbours -> the ones which I influence
    if (debug?) [
      print (word "Decrease-adaptation-count-indirect-neighbours called for household with ID " ID "- nn_adapt before: " (NN_adapt))
    ]
    let new_count ((item ticks NN_adapt) - 1)
    set NN_adapt replace-item ticks NN_adapt new_count; my indirect neighbours decrease their adaptation count in this tick by 1, as I stopped adapting all measures.

    ;Verification and Debugging
    Set Total_adapt_count_change_indirect_NNs ( Total_adapt_count_change_indirect_NNs - 1 )
    if (debug?) [
      ;print (word "Household with ID " [ID] of myself " increases adaptation count of household with ID "  ID " by 1 to " new_count " in tick " ticks)
      print (word "Decrease-adaptation-count-indirect-neighbourscalled for household with ID " ID "- nn_adapt before: " (NN_adapt))
    ]
  ]
end

to verify-position-fl-scenario
  if debug? [
      print (word"Go: position_fl_scenario: "  position_fl_scenario)
  ]
  if (position_fl_scenario = FALSE ) [ ;if fl_scenario cannot be found cannot be found in fl_scenario_names, position is FALSE
    user-message (word "ERROR: fl_scenario cannot be found cannot be found in fl_scenario_names!")
    print (word "ERROR: fl_scenario cannot be found cannot be found in fl_scenario_names!")
    Stop
  ]

end

to check-flood-depth; called by each household
  if (((item position_fl_scenario inund) - foundation_height ) > 0) [
    ;we can then determine if a household is flooded by calling the inundation level of a household for the current flood scenario.
    ;This data is predetermiend by overlapping the inundation maps with the location of the residential building in which the household is living.
    ;If the inundation is higher than the foundation-level, then we consider the household flooded

    ;Debug & Verification
    if debug? [
      print (word "Check-flood-depth: Household "who" with ID: " ID " is inundated with an inundation depth of " ((item position_fl_scenario inund)- foundation_height)" and set fl_exp")
    ]

    ;When flooded:
    set flooded? TRUE ;mark household as flooded
    ;if visualization? [ ;Not active!
      ;set color blue
    ;]
    check-flood-damage ;if the hh is flooded we need to check the flood damage
    update-flood-experience-and-savings
  ]
end

;Function not used!
to set-flood-color [building_inund_depth] ; called by each household that is considered flooded
  ;Function set the color of the blue depending on how deep the inundation depth of the building is: The larger the inundation depth, the darker the blue
  (ifelse
    (Building_inund_depth <= 0.0) [
      ;Do nothing
    ]
    (Building_inund_depth < 0.5) [
      set color 87
    ]
    (Building_inund_depth < 1.0) [
      set color 85
    ]
    (Building_inund_depth < 1.5) [
      set color 97
    ]
    (Building_inund_depth < 2.0) [
      set color 95
    ]
    (Building_inund_depth < 2.5) [
      set color 107
    ]
    (Building_inund_depth < 3.0) [
      set color 105
    ]
    [;>= 3.0
      set color 103
    ]
  )
end

to check-flood-damage; called by each household that is considered flooded
  ;determine the building (structure) and content damage and  update the respective parameters
  set fl_dam_build replace-item ticks fl_dam_build (check-building-damage ((item position_fl_scenario inund) - foundation_height)); set flood damage of building in this tick to the value which is returned by the function check-building-damage when the inundation depth of the building is put into the function
  set fl_dam_cont replace-item ticks fl_dam_cont (check-content-damage ((item position_fl_scenario inund) - foundation_height))   ; set flood damage of content in this tick to the value which is returned by the function check-content-damage when the inundation depth of the building is put into the function

  verify-flood-damage;Verify the calculation

  check-flood-damage-reduction; now that the damage is assessed, we determine by how much the damage is reduced by the adaptation measures
end

to-report check-building-damage [Building_inund_depth] ;called by each household that is considered flooded
  ;Function reports back the building (structure) damage for a given inundation depth of the building
  if debug? [
    print (word "Check-building-damage called by household " who " with ID " ID " and inundation depth " building_inund_depth)
  ]

  (ifelse
    (Building_inund_depth <= 0.0) [
      report 0;When the depth is below zero or zero then report 0 damage back
    ]
    (Building_inund_depth < 0.5) [
      report ((item 0 Depth_dam_build) * item 0 Value)
      ; Get the % damage from the building depth damage funciton with an inundation depth below 0.5 meter (which is the first item (0) of the stagewise depth-damage function) and multiply it with the building value (item 0) - similar for all others
    ]
    (Building_inund_depth < 1.0) [
      report ((item 1 Depth_dam_build) * item 0 Value)
    ]
    (Building_inund_depth < 1.5) [
      report ((item 2 Depth_dam_build) * item 0 Value)
    ]
    (Building_inund_depth < 2.0) [
      report ((item 3 Depth_dam_build) * item 0 Value)
    ]
    (Building_inund_depth < 2.5) [
      report ((item 4 Depth_dam_build) * item 0 Value)
    ]
    (Building_inund_depth < 3.0) [
      report ((item 5 Depth_dam_build) * item 0 Value)
    ]
    [;>= 3.0
      report ((item 6 Depth_dam_build) * item 0 Value)
    ]
  )

end

to-report check-content-damage [Building_inund_depth] ;called by each household that is considered flooded
  ;Function reports back the content damage for a given inundation depth of the buildin
  if debug? [
    print (word "Check-content-damage called by household " who " with ID " ID " and inundation depth " building_inund_depth)
  ]

  (ifelse
    (Building_inund_depth <= 0.0) [
      report 0;When the depth is below zero or zero then report 0 damage back
    ]
    (Building_inund_depth < 0.5) [
      report ((item 0 Depth_dam_cont) * item 1 Value)
      ; Get the % damage from the content depth damage funciton with an inundation depth below 0.5 meter (which is the first item (0) of the stagewise depth-damage function) and multiply it with the content value (item 1) - similar for all others
    ]
    (Building_inund_depth < 1.0) [
      report ((item 1 Depth_dam_cont) * item 1 Value)
    ]
    (Building_inund_depth < 1.5) [
      report ((item 2 Depth_dam_cont) * item 1 Value)
    ]
    (Building_inund_depth < 2.0) [
      report ((item 3 Depth_dam_cont) * item 1 Value)
    ]
    (Building_inund_depth < 2.5) [
      report ((item 4 Depth_dam_cont) * item 1 Value)
    ]
    (Building_inund_depth < 3.0) [
      report ((item 5 Depth_dam_cont) * item 1 Value)
    ]
    [;>= 3.0
      report ((item 6 Depth_dam_cont) * item 1 Value)
    ]
  )
end

to verify-flood-damage; called by each household that is considered flooded
  ;verification of building and content damage
  IF debug? [
    print (word "Verify-flood-damage: Building damage of household " who " with ID " ID " in tick " ticks ": " item ticks fl_dam_build)
    print (word "Verify-flood-damage: Content damage of household " who " with ID " ID " in tick " ticks ": " item ticks fl_dam_cont)
  ]

  IF ((item ticks fl_dam_build > item 0 value) OR (item ticks fl_dam_cont > item 1 value)) [;if the building structure damage is larger than the building structure value OR if the content damage is larger than the content value
    user-message (word "Error: The building structure damage is larger than the building structure value OR  the content damage is larger than the content value")
    print (word "Error: The building structure damage is larger than the building structure value OR  the content damage is larger than the content value")
    stop
  ]
end

to check-flood-damage-reduction; called by each household that is considered flooded
  ;This is the most complicated function of the model, as it includes a lot of different concepts
  ;- Building and content damage
  ;- Different effectiveness levels of the adaptation measures
  ;- Different effectiveness factors of the adaptation measures
  ;- The order in which the adaptation measures reduce damage

  ;An important assumption for this function is that there is an order in which the measures reduce damage
     ;If implemented, elevation reduces the damage first. This is logical, if the building is elevated above the flood level, then all the damage is reduced by the elevation measure, even if the other measures are implemented
     ;If the water reaches the building despite the elevation then dry-proofing reduces the remaining damage which is not reduced by the elevation measure. This is also logical. If dry proofing does it’s job right, water does not enter the building and hence the damage that can be reduced via wet-proofing is smaller
     ;If damage remains after applying elevation and dry-proofing measures, then the wet-proofing measures decrease the remaining damage

  IF ( (item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1) ) [;if at least one measure is undergone = at least one measure adaptation state 2
    ;Determine the elevation level of the building after all adaptation measures
    let build_elev 0; new local variable building elevation
    (ifelse
      (item 0 UG = 1) [;If the elevation measure is implemented

        ;New building elevation:
        ;Increase the building elevation to 30cm (plus the 10cm elevation for the foundation) above the elevation of the 100 year flood of 2030 in the RCP8.5 scenario - When the inundation level is 0, then this is what we use
        set build_elev (item 8 inund + foundation_height + item 0 effectiv_lvl)
                   ;item 8 inund is the inundation level for the scenario: 2030_100_rcp8.5
                   ;foundation_height is the foundation of the building
                   ;item 0 effectiv_lvl is the elevation level above the 100 year flood level

        ;Determine benefit of elevation measure (=avoided damage)
        ;the Benefit of the elevation measure is the difference between the total damage without the elevation measure minus the remaining damage after applying the elevation measure for both content and building
        set b_elev replace-item ticks b_elev
        ((item ticks fl_dam_build + item ticks fl_dam_cont) -                         ;this is the total damage without any elevation (and other) measure implemented
        (check-building-damage ((item position_fl_scenario inund) - build_elev) +     ;this is the remaining building structure damage after elevating the building (not considering other adaptation measures); if <= 0, then zero
        (check-content-damage  ((item position_fl_scenario inund) - build_elev))))    ;this is the remaining building content damage after elevating the building (not considering other adaptation measures); if <= 0, then zero
                   ;if the elevation level is higher than the flood level, the benefit of the measure equals the entire avoided damage
                   ;caveat of using a stage-depth-damage function compared to a contiuous depth-damage function: When the inundation depth after the elevation measure is in the same inundation class (e.g. < 0.5, 0.5-1 etc.), the benefit of applying the elevation measure is 0, as the damage before applying the elevation measure is the same as the damage after applying the elevation measure due to the use of the stage depth damage function

        set b_elev_build replace-item ticks b_elev_build (item ticks fl_dam_build - (check-building-damage ((item position_fl_scenario inund) - build_elev)))
        set b_elev_cont replace-item ticks b_elev_cont   (item ticks fl_dam_cont  - (check-content-damage ((item position_fl_scenario inund) - build_elev)))

        if debug? [
          print (word "Check-flood-damage-reduction: Benefit of elevation of household " who " with ID " ID " in ticks " ticks " to level " build_elev ": " item ticks b_elev " = Total flood damage without any implemented measure: " (item ticks fl_dam_build + item ticks fl_dam_cont) " - Remaining building damage after elevating the building: "  (check-building-damage (item position_fl_scenario inund - build_elev)) " - Remaining  content damage after elevating the building: "  (check-content-damage  (item position_fl_scenario inund - build_elev)))
        ]
      ]
      [ ;When the elevation measure is not implemented
        set build_elev foundation_height; the elevation level of the building is the regular foundation hight above the ground
        ;as no elevation measure takes place, the benefit of the measure is 0. But we do not need to change anything as the benefit of the elevation measure is iniated with zero in the setup and hence will not be changed
      ]
    )
    (ifelse;

      ;if the inundation level is higher than build_elev AND within the effectiveness levels of both wet- and dry-proofing, hence larger than the building elevation plus the smallest of the effectiveness levels of wet- and dry-proofing
      ((item position_fl_scenario inund > build_elev) AND (item position_fl_scenario inund <= build_elev +  MIN list (item 1 effectiv_lvl) (item 2 effectiv_lvl))) [

        ;Verficiation and debugging
        if debug? [
          print (word "Check-flood-damage-reduction: inundation level " item position_fl_scenario inund  " of household " who " with ID " ID " larger than the building elevation with " build_elev " and smaller than the building elevation " build_elev " plus the minimum effectiveness level " MIN list (item 1 effectiv_lvl) (item 2 effectiv_lvl))
        ]

        ;If dry-proofing is undergone
        IF (item 2 UG = 1) [
          set b_dry replace-item ticks b_dry ( ;update the value of dry-proofing benefit at tick t to...
            (check-building-damage ((item position_fl_scenario inund) - build_elev)) * item 2 effectiv_build + ;the building damage which remains after the building elevation multiplied with the effectiveness of the dry-proofing measure in reducing building damage
            (check-content-damage ((item position_fl_scenario inund) - build_elev)) * item 2 effectiv_cont ;the content damage which remains after the building elevation multiplied with the effectiveness of the dry-proofing measure in reducing content damage
          )

          set b_dry_build replace-item ticks b_dry_build ((check-building-damage ((item position_fl_scenario inund) - build_elev)) * item 2 effectiv_build)
          set b_dry_cont  replace-item ticks b_dry_cont  ((check-content-damage  ((item position_fl_scenario inund) - build_elev)) * item 2 effectiv_cont)

          ;Verification and Debugging
          IF debug? [
            print (word "Check-flood-damage-reduction: Dry-proofing benefit: " (item ticks b_dry) " = "(check-building-damage ((item position_fl_scenario inund) - build_elev))" (remaining building damage) * " item 2 effectiv_build " (Effectiveness Building Damage Reduction Dry-proofing) + " (check-content-damage ((item position_fl_scenario inund) - build_elev))" (remaining contenet damage) * " item 2 effectiv_cont " (Effectiveness Content Damage Reductinon Dry-proofing)")
          ]
        ];otherwise benefit of dry-proofing stays 0 if it is not active

        ;if wet-proofing is undergone
        IF (item 1 UG = 1) [
          set b_wet replace-item ticks b_wet ( ;update the value of wet-proofing benefit at tick t to...
            ((check-building-damage ((item position_fl_scenario inund) - build_elev)) * ( 1 - (item 2 effectiv_build * item 2 UG)) * item 1 effectiv_build) + ;the building damage which remains after the damage reduction by the elevation and the dry-proofing measure  multiplied with the effectiveness of the wet-proofing measure in reducing building damage
                                                                                                                                                              ;(check-building-damage ((item position_fl_scenario inund) - build_elev)) = building damage after the elevation measure (if no elevation, then build_elev = foundation_height)
                                                                                                                                                              ;By multiplying the remaining damage after appyling the elevation measure with ( 1 - (item 2 effectiv_build * item 2 UG)) we get the damage that remains after the dry-proofing measure
                                                                                                                                                              ;if no dry-proofing measure is applied, then item 2 UG is 0 and hence the damage which remains after dry-proofing is equal to the damage which remains after elevation
                                                                                                                                                              ;by multiplying the remaininig damage after applying first elevation and then dry-proofing measure with the effectiveness of the wet-proofing measure (item 1 effectiv_buil), we get the avoided damage of the wet-proofing measure and hence the benefit of wet-proofing
            ((check-content-damage ((item position_fl_scenario inund) - build_elev)) * ( 1 - (item 2 effectiv_cont * item 2 UG)) * item 1 effectiv_cont) ;same for building content damage
          )

          set b_wet_build replace-item ticks b_wet_build ((check-building-damage ((item position_fl_scenario inund) - build_elev)) * ( 1 - (item 2 effectiv_build * item 2 UG)) * item 1 effectiv_build)
          set b_wet_cont  replace-item ticks b_wet_cont  ((check-content-damage  ((item position_fl_scenario inund) - build_elev)) * ( 1 - (item 2 effectiv_cont  * item 2 UG)) * item 1 effectiv_cont)

          ;Verification and Debugging
          IF debug? [
            print (word "Check-flood-damage-reduction: Wet-proofing benefit: " (item ticks b_wet) " = "(check-building-damage ((item position_fl_scenario inund) - build_elev))" (remaining building damage) * ( 1 - " (item 2 effectiv_build * item 2 UG)") (1 - Effectiveness Building Damage Reduction Dry-proofing) * "(item 1 effectiv_build) " (Effectiveness Building Damage Reduction Wet-proofing) + " (check-content-damage ((item position_fl_scenario inund) - build_elev))" (remaining contenet damage) * (1 - " (item 2 effectiv_cont * item 2 UG)") (1 - Effectiveness Content Damage Reductinon Dry-proofing) * "(item 1 effectiv_build) " (Effectiveness Content Damage Reduction Wet-proofing)")
          ]


        ];otherwise benefit of wet-proofing stays 0 if it is not active
      ]

      ;if the inundation level is in a range where only wet- or dry-proofing is still active
      ((item position_fl_scenario inund > build_elev +  MIN list (item 1 effectiv_lvl) (item 2 effectiv_lvl)) AND (item position_fl_scenario inund <= build_elev +  MAX list (item 1 effectiv_lvl) (item 2 effectiv_lvl))) [

        ;Verification and debugging
        IF debug? [
          print (word "Check-flood-damage-reduction: inundation level " item position_fl_scenario inund  " of household " who " with ID " ID " and UG " UG " is larger than the building elevation " build_elev " plus the min effectiveness level " MIN list (item 1 effectiv_lvl) (item 2 effectiv_lvl) " and smaller than the building elevation " build_elev " plus the max effectiveness level " max list (item 1 effectiv_lvl) (item 2 effectiv_lvl ))
        ]

        ;Determining if wet-proofing or dry-proofing still applies
        IF ((item 1 UG = 1) OR (item 2 UG = 1)) [;only if at least one wet- or dry-proofing measure is taken, we need to go through these steps
          (ifelse
            (max list (item 1 effectiv_lvl) (item 2 effectiv_lvl) = item 1 effectiv_lvl) [;when the wet-proofing effectivness level is higher than the dry-proofing effectivness level -> hence, when wet-proofing is effective but dry-proofing not no longer effective
                                                                                          ;the benefit of dry-proofing is 0, as it no longer applies: No change in b_dry as it is already initated with 0
                                                                                          ;the benefit of wet-proofing:
              IF (item 1 UG = 1) [;only if wet-proofing is undergone
                set b_wet replace-item ticks b_wet ( ;update the value of wet-proofing benefit at tick t to...
                  ((check-building-damage ((item position_fl_scenario inund) - build_elev)) * item 1 effectiv_build) + ;the building damage which remains after the damage reduction by the elevation multiplied with the effectiveness of the wet-proofing measure in reducing building damage
                                                                                                                       ;(check-building-damage ((item position_fl_scenario inund) - build_elev)) = building damage after the elevation measure (if no elevation, then build_elev = foundation_height)
                                                                                                                       ;by multiplying the remaininig damage after applying the elevation measure with the effectiveness of the wet-proofing measure (item 1 effectiv_build), we get the avoided damage of the wet-proofing measure and hence the benefit of wet-proofing
                  ((check-content-damage ((item position_fl_scenario inund) - build_elev)) * item 1 effectiv_cont)     ;same for building content damage
                )
                set b_wet_build replace-item ticks b_wet_build ((check-building-damage ((item position_fl_scenario inund) - build_elev)) * item 1 effectiv_build)
                set b_wet_cont  replace-item ticks b_wet_cont  ((check-content-damage ((item position_fl_scenario inund) - build_elev)) * item 1 effectiv_cont)
                ;Verification and debugging
                If debug? [
                  print (word "Check-flood-damage-reduction: Benefit wet-proofing of household "who" with ID " ID " and UG " UG " is set to: " item ticks b_wet " = " (check-building-damage ((item position_fl_scenario inund) - build_elev)) " (remaining building damage) * " item 1 effectiv_build " (effectiveness building damage reduction wet-proofing) + " (check-content-damage ((item position_fl_scenario inund) - build_elev)) " (remaining content damage) * " item 1 effectiv_cont " (effectiveness content damage reduction wet-proofing)")
                ]
              ]

            ]
            [;ELSE: When the dry-proofing effectivness level is higher than the wet-proofing effectivness level -> hence, when dry-proofing is effective but wet-proofing not no longer effective
             ;the benefit of wet-proofing is 0, as it no longer applies: No change in b_wet as it is already initated with 0
              IF (item 2 UG = 1) [;only if dry-proofing is undergone
                set b_dry replace-item ticks b_dry ( ;update the value of dry-proofing benefit at tick t to...
                  ((check-building-damage ((item position_fl_scenario inund) - build_elev)) * item 2 effectiv_build) + ;the building damage which remains after the damage reduction by the elevation multiplied with the effectiveness of the dry-proofing measure in reducing building damage
                                                                                                                       ;(check-building-damage ((item position_fl_scenario inund) - build_elev)) = building damage after the elevation measure (if no elevation, then build_elev = foundation_height)
                                                                                                                       ;by multiplying the remaininig damage after applying the elevation measure with the effectiveness of the dry-proofing measure (item 2 effectiv_build), we get the avoided damage of the dry-proofing measure and hence the benefit of dry-proofing
                  ((check-content-damage ((item position_fl_scenario inund) - build_elev)) * item 2 effectiv_cont)     ;same for building content damage
                )
                set b_dry_build replace-item ticks b_dry_build ((check-building-damage ((item position_fl_scenario inund) - build_elev)) * item 2 effectiv_build)
                set b_dry_build replace-item ticks b_dry_build ((check-content-damage  ((item position_fl_scenario inund) - build_elev)) * item 2 effectiv_cont)
                ;Verification and debugging
                If debug? [
                  print (word "Check-flood-damage-reduction: Benefit dry-proofing of household "who" with ID " ID " and UG " UG " is set to: " item ticks b_dry " = " (check-building-damage ((item position_fl_scenario inund) - build_elev)) " (remaining building damage) * " item 2 effectiv_build " (effectiveness building damage reduction dry-proofing) + " (check-content-damage ((item position_fl_scenario inund) - build_elev)) " (remaining content damage) * " item 2 effectiv_cont " (effectiveness content damage reduction dry-proofing)")
                ]
              ]
            ]
          )
        ]
      ]

      ;if the inundation level is smaller than the building elevation OR it is out of both the dry- and wet-proofing effectiveness levels: b_dry and b_wet are 0
      [;Else
        IF debug? [
          print (word "Check-flood-damage-reduction: inundation level " item position_fl_scenario inund  " of household " who " with ID " ID " is smaller than the building elevation " build_elev " or is out of both the wet- and dry-proofing effectiveness levels of " (item 1 effectiv_lvl) " and " (item 2 effectiv_lvl))
        ]
      ]
    )
    verify-flood-damage-reduction
  ]
  ;No damage reduction necessary if no adaptation measure implemented: In this case, the benefit would be 0. As the benefit parameters are already initiated with 0. No change in parameter is required.

end

to verify-flood-damage-reduction;called by each household with at least one adapted measure
  ;The sum of the flood damage reductions of the different measures cannot be larger than the flood damage itself!
  IF (((item ticks b_elev) + (item ticks b_wet) + (item ticks b_dry)) > (item ticks fl_dam_build + item ticks fl_dam_cont)) [
    user-message (word "ERROR: The reduced damage of all adaptation measures of household "who" with ID " ID " is higher than the actual damage in tick "ticks)
    print (word "ERROR: The reduced damage of all adaptation measures of household "who" with ID " ID " is higher than the actual damage in tick "ticks)
  ]
  IF (((item ticks b_elev_build) + (item ticks b_wet_build) + (item ticks b_dry_build)) > (item ticks fl_dam_build)) [
    user-message (word "ERROR: The reduced damage of all adaptation measures of household "who" with ID " ID " is higher than the actual building damage in tick "ticks)
    print (word "ERROR: The reduced damage of all adaptation measures of household "who" with ID " ID " is higher than the actual building damage in tick "ticks)
  ]
  IF (((item ticks b_elev_cont) + (item ticks b_wet_cont) + (item ticks b_dry_cont)) > (item ticks fl_dam_cont)) [
    user-message (word "ERROR: The reduced damage of all adaptation measures of household "who" with ID " ID " is higher than the actual content damage in tick "ticks)
    print (word "ERROR: The reduced damage of all adaptation measures of household "who" with ID " ID " is higher than the actual content damage in tick "ticks)
  ]

  ;A benefit (damage reduction) can only occur if the measures is active
  IF (((item ticks b_elev > 0) AND (item 0 UG = 0)) OR ((item ticks b_wet > 0) AND (item 1 UG = 0)) OR ((item ticks b_dry > 0) AND (item 2 UG = 0))) [
    user-message (word "ERROR: A benefit reduction occurs for household " who " with ID " ID " although the respective measure is not adapted!")
    print (word "ERROR: A benefit reduction occurs for household " who " with ID " ID " although the respective measure is not adapted!")
  ]
  ;Total benefit needs to be the sum of the benefit in reducing content plus the benefiit in reducing building damage
  IF (round item ticks b_elev != round (item ticks b_elev_build + item ticks b_elev_cont)) [
    user-message (word "ERROR: Elevation Benefit in reducing content and flood damage does not add up for household " who " with ID " ID)
    print (word "ERROR: Elevation Benefit in reducing content and flood damage does not add up for household " who " with ID " ID)
  ]

  IF (round item ticks b_wet != round (item ticks b_wet_build + item ticks b_wet_cont)) [
    user-message (word "ERROR: Wet-proofing benefit in reducing content and flood damage does not add up for household " who " with ID " ID)
    print (word "ERROR: Wet-proofing benefit in reducing content and flood damage does not add up for household " who " with ID " ID)
  ]

  IF (round item ticks b_dry != round (item ticks b_dry_build + item ticks b_dry_cont)) [
    user-message (word "ERROR: Dry-proofing benefit in reducing content and flood damage does not add up for household " who " with ID " ID)
    print (word "ERROR: Dry-proofing benefit in reducing content and flood damage does not add up for household " who " with ID " ID)
  ]
end

to update-flood-experience-and-savings ; Function to update flood experience and savings
  ;based on the actual flood damage update the flood experience attribute level
  let remaining_fl_dam_cont  (item ticks fl_dam_cont - item ticks b_elev_cont - item ticks b_wet_cont - item ticks b_dry_cont)
  let remaining_fl_dam       (item ticks fl_dam_build + item ticks fl_dam_cont - item ticks b_elev - item ticks b_wet - item ticks b_dry)
  ;the flood damage is the total damage that would have happened without the adaptation minus the avoided damage by elevation, wet, and dry-proofing

  ;Update flood experience
  (ifelse
    (remaining_fl_dam = 0) [set fl_exp 0] ; no damage
    ((remaining_fl_dam > 0) AND (remaining_fl_dam < 1270)) [set fl_exp 1] ;very low damage
    ((remaining_fl_dam >= 1270) AND (remaining_fl_dam < 2540)) [set fl_exp 2];low damage
    ((remaining_fl_dam >= 2540) AND (remaining_fl_dam < 3810)) [set fl_exp 3];medium damage
    ((remaining_fl_dam >= 3810) AND (remaining_fl_dam < 5080)) [set fl_exp 4];high damage
    (remaining_fl_dam >= 5080) [set fl_exp 5];very high damage
  )

  ;Update savings
  (ifelse
    (hh_status = 0) [; if household owns the house then all the flood damage gets reduced from the savings
      set savings replace-item ticks savings (item ticks savings - remaining_fl_dam) ;Reduce savings by flood damage
    ]
    (hh_status = 1) [; if household rents the house then all the the household only needs to pay for the content damage, the building structure damage is taken care of by the owner
      set savings replace-item ticks savings (item ticks savings - remaining_fl_dam_cont) ;Reduce savings by flood damage
    ]
  )

  ;Debug output
  if debug? [
    print (word "Update-flood-experience-and-savings: Household "who" with ID "ID" updates flood experience to " fl_exp)
    print (word "Update-flood-experience-and-savings: Household "who" with ID "ID" updates savings to " item ticks savings)
  ]
end

to verify-adapt-change ;verify that the social network works correctly
  if debug? [
    print (word"Total_adapt_count_change_indirect_NNs: " Total_adapt_count_change_indirect_NNs)
    print (word"Total_adapt_count_change_HHs: " Total_adapt_count_change_HHs)
  ]

  if (Total_adapt_count_change_indirect_NNs != Total_adapt_count_change_HHs) [
    user-message (word "Error: The counting of the adaptation of households at the indirect neighbour level is not aligned with the household level!")
    print (word "Error: The counting of the adaptation of households at the indirect neighbour level is not aligned with the household level!")
    stop
  ]
end

to verify-adapt-status
  Foreach [0 1 2] [ x ->; for each measure elevation, wet-proofing, dry-proofing
    ask turtles with [((item ticks item x adapt_status = 2) AND (item x UG != 1)) OR ((item ticks item x adapt_status != 2) AND (item x UG = 1))] [
      user-message (word "Error: The adaptation status of household "who" with ID "ID" misaligns with the undergone parameter for measure "x)
      print (word "Error: The adaptation status of household "who" with ID "ID" misaligns with the undergone parameter for measure "x)
    ]
  ]
end

to verify-savings ;Not used
  if (count turtles with [item ticks savings < 0] > 0 )[
    user-message (word "Error: A household has collected debt")
    print (word "Error: A household has collected debt")
  ]
end
@#$#@#$#@
GRAPHICS-WINDOW
12
305
621
915
-1
-1
1.0
1
10
1
1
1
0
1
1
1
-300
300
-300
300
0
0
1
ticks
30.0

BUTTON
21
33
84
66
NIL
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
90
33
153
66
NIL
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

CHOOSER
500
97
780
142
Representative-Concentration-Pathway
Representative-Concentration-Pathway
"rcp8.5" "rcp2.6"
1

OUTPUT
13
994
616
1954
9

SWITCH
21
111
151
144
Setup-Summary?
Setup-Summary?
0
1
-1000

TEXTBOX
18
960
337
979
SETUP SUMMARY\n\n
20
0.0
1

TEXTBOX
166
10
267
62
SPATIAL SCALE
20
0.0
0

CHOOSER
1961
161
2094
206
Depth-damage-function
Depth-damage-function
"Wang (2001)" "Yu et al. (2012)" "Z. Yin et al. (2011)" "Huizinga et al. (2017)"
0

TEXTBOX
504
10
654
35
FLOOD
20
0.0
1

INPUTBOX
390
138
479
198
Time_horizon
30.0
1
0
Number

SLIDER
611
147
813
180
Occurance_flood_1
Occurance_flood_1
Starting_year + 1
Starting_year + time_horizon
2027.0
1
1
[year]
HORIZONTAL

SWITCH
22
73
151
106
Visualization?
Visualization?
0
1
-1000

SWITCH
161
74
265
107
Huangpu
Huangpu
0
1
-1000

SWITCH
160
110
264
143
Xuhui
Xuhui
1
1
-1000

SWITCH
160
147
264
180
Changning
Changning
1
1
-1000

SWITCH
273
73
376
106
Jing'an
Jing'an
1
1
-1000

SWITCH
272
111
375
144
Putuo
Putuo
1
1
-1000

SWITCH
272
147
376
180
Hongkou
Hongkou
1
1
-1000

SWITCH
159
188
262
221
Yangpu
Yangpu
1
1
-1000

TEXTBOX
23
10
173
35
GENERAL
20
0.0
1

TEXTBOX
20
274
507
349
VISUALIZATION
20
0.0
1

PLOT
634
337
1036
536
Adaptation diffusion of different measure types
Time [years]
Adaptated HHs [%]
0.0
30.0
0.0
1.0
true
true
"" ""
PENS
"Elevation" 1.0 0 -955883 true "" "if Draw-Graphs? [\nif (ticks >= 1) [\nplot (count turtles with [item 0 UG = 1])/(count turtles)\n]]"
"Wet-proofing" 1.0 0 -8990512 true "" "if Draw-Graphs? [\nif (ticks >= 1) [\nplot (count turtles with [item 1 UG = 1])/(count turtles)\n]]"
"Dry-proofing" 1.0 0 -13840069 true "" "if Draw-Graphs? [\nif (ticks >= 1) [\nplot (count turtles with [item 2 UG = 1])/(count turtles)\n]]"

MONITOR
635
550
707
595
Elevation
count turtles with [item 0 UG = 1]
17
1
11

MONITOR
710
550
796
595
Wet-proofing
count turtles with [item 1 UG = 1]
17
1
11

MONITOR
800
550
884
595
Dry-proofing
Count turtles with [item 2 UG = 1]
17
1
11

SWITCH
21
149
151
182
Debug?
Debug?
1
1
-1000

SWITCH
499
149
602
182
Flood_1?
Flood_1?
1
1
-1000

CHOOSER
822
139
1004
184
Probability_flood_1
Probability_flood_1
"10-year flood (10%)" "100-year flood (1%)" "1000-year flood (0.1%)"
2

SWITCH
500
195
604
228
Flood_2?
Flood_2?
1
1
-1000

SLIDER
612
194
814
227
Occurance_flood_2
Occurance_flood_2
Starting_year + 1
Starting_year + time_horizon
2032.0
1
1
[year]
HORIZONTAL

CHOOSER
822
187
1003
232
Probability_flood_2
Probability_flood_2
"10-year flood (10%)" "100-year flood (1%)" "1000-year flood (0.1%)"
2

CHOOSER
822
235
1003
280
Probability_flood_3
Probability_flood_3
"10-year flood (10%)" "100-year flood (1%)" "1000-year flood (0.1%)"
2

SWITCH
499
241
604
274
Flood_3?
Flood_3?
1
1
-1000

SLIDER
613
240
815
273
Occurance_flood_3
Occurance_flood_3
Starting_year + 1
Starting_year + time_horizon
2035.0
1
1
[year]
HORIZONTAL

INPUTBOX
390
73
476
133
Starting_year
2020.0
1
0
Number

TEXTBOX
640
286
1370
336
ANALYSIS DASHBOARDS FOR ADAPTATION DIFFUSION
20
0.0
1

PLOT
1071
341
1473
535
Adaptation diffusion for different age classes
Time [years]
Adapted HHs [%]
0.0
30.0
0.0
1.0
true
true
"" ""
PENS
"16-24" 1.0 0 -16777216 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(age = 1) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [age = 1]))]]\n;percentage of the age group which adapted at least one measure\n"
"25-34" 1.0 0 -5825686 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(age = 2) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [age = 2]))]]\n;percentage of the age group which adapted at least one measure\n"
"35-44" 1.0 0 -2674135 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(age = 3) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [age = 3]))]]\n;percentage of the age group which adapted at least one measure\n"
"45-53" 1.0 0 -955883 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(age = 4) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [age = 4]))]]\n;percentage of the age group which adapted at least one measure\n"
"53-64" 1.0 0 -11221820 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(age = 5) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [age = 5]))]]\n;percentage of the age group which adapted at least one measure\n"
"65+" 1.0 0 -14070903 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(age = 6) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [age = 6]))]]\n;percentage of the age group which adapted at least one measure\n"

TEXTBOX
636
315
786
333
Adaptation Type
14
0.0
1

TEXTBOX
1077
313
1227
331
Background: Age
14
0.0
1

MONITOR
1079
550
1129
595
16-24
Word ((Precision (Count turtles with [age = 1] / Count turtles) 2) * 100) \"%\"
17
1
11

MONITOR
1132
550
1182
595
25-34
Word ((Precision (Count turtles with [age = 2] / Count turtles) 2) * 100) \"%\"
17
1
11

MONITOR
1185
550
1238
595
35-44
Word ((Precision (Count turtles with [age = 3] / Count turtles) 2) * 100) \"%\"
17
1
11

MONITOR
1240
550
1292
595
45-54
Word ((Precision (Count turtles with [age = 4] / Count turtles) 2) * 100) \"%\"
17
1
11

MONITOR
1293
550
1343
595
55-64
Word ((Precision (Count turtles with [age = 5] / Count turtles) 2) * 100) \"%\"
17
1
11

MONITOR
1347
550
1397
595
65+
Word ((Precision (Count turtles with [age = 6] / Count turtles) 2) * 100) \"%\"
17
1
11

TEXTBOX
642
1177
809
1197
Background: Education
14
0.0
1

PLOT
639
1198
1043
1392
Adaptation diffusion for different eduction classes
Time [years]
Adapted HHs [%]
0.0
30.0
0.0
1.0
true
true
"" ""
PENS
"< High School" 1.0 0 -7858858 true "" "if Draw-Graphs?[\nif ticks >= 1 [plot ((count turtles with [(edu = 1) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [edu = 1]))]]\n;percentage of the edu group which adapted at least one measure\n"
"High School" 1.0 0 -2674135 true "" "if Draw-Graphs?[\nif ticks >= 1 [plot ((count turtles with [(edu = 2) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [edu = 2]))]]\n;percentage of the edu group which adapted at least one measure\n"
"College Degree" 1.0 0 -3844592 true "" "if Draw-Graphs?[\nif ticks >= 1 [plot ((count turtles with [(edu = 3) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [edu = 3]))]]\n;percentage of the edu group which adapted at least one measure\n"
" Post Graduate " 1.0 0 -13791810 true "" "if Draw-Graphs?[\nif ticks >= 1 [plot ((count turtles with [(edu = 4) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [edu = 4]))]]\n;percentage of the edu group which adapted at least one measure\n"

MONITOR
644
1410
734
1455
< High School
Word ((Precision (Count turtles with [edu = 1] / Count turtles) 2) * 100) \"%\"
17
1
11

MONITOR
739
1410
829
1455
High School
Word ((Precision (Count turtles with [edu = 2] / Count turtles) 2) * 100) \"%\"
17
1
11

MONITOR
834
1410
932
1455
College Degree
Word ((Precision (Count turtles with [edu = 3] / Count turtles) 2) * 100) \"%\"
17
1
11

MONITOR
937
1409
1031
1454
Post Graduate
Word (round((Precision (Count turtles with [edu = 4] / Count turtles) 2) * 100)) \"%\"
17
1
11

TEXTBOX
1081
534
1363
553
Distribution of age classes in population
10
0.0
1

TEXTBOX
647
1396
911
1415
Distribution of eduction classes in population
10
0.0
1

TEXTBOX
643
1474
810
1494
Background: District
14
0.0
1

PLOT
641
1496
1040
1691
Adaptation diffusion for different districts
Time [years]
Adapted HHs [%]
0.0
30.0
0.0
1.0
true
true
"" ""
PENS
"Huangpu " 1.0 0 -16777216 true "" "if huangpu [\nif Draw-Graphs?[\nif ticks >= 1 [plot ((count turtles with [(district = \"Huangpu District\") AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [district = \"Huangpu District\"]))]]]\n;percentage of the edu group which adapted at least one measure\n"
"Xuhui" 1.0 0 -955883 true "" "if xuhui [\nif Draw-Graphs?[\nif ticks >= 1 [plot ((count turtles with [(district = \"Xuhui District\") AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [district = \"Xuhui District\"]))]]]\n;percentage of the households in district which adapted at least one measure\n"
"Changning" 1.0 0 -2674135 true "" "if changning [\nif Draw-Graphs?[\nif ticks >= 1 [plot ((count turtles with [(district = \"Changning District\") AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [district = \"Changning District\"]))]]]\n;percentage of the households in district which adapted at least one measure\n"
"Jing'an" 1.0 0 -5987164 true "" "if Jing'an [\nif Draw-Graphs?[\nif ticks >= 1 [plot ((count turtles with [(district = \"Jing'an District\") AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [district = \"Jing'an District\"]))]]]\n;percentage of the households in district which adapted at least one measure\n"
"Putuo" 1.0 0 -5825686 true "" "if putuo [\nif Draw-Graphs?[\nif ticks >= 1 [plot ((count turtles with [(district = \"Putuo District\") AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [district = \"Putuo District\"]))]]]\n;percentage of the households in district which adapted at least one measure\n"
"Hongkou" 1.0 0 -11221820 true "" "if Hongkou [\nif Draw-Graphs?[\nif ticks >= 1 [plot ((count turtles with [(district = \"Hongkou District\") AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [district = \"Hongkou District\"]))]]]\n;percentage of the households in district which adapted at least one measure\n"
"Yangpu" 1.0 0 -10899396 true "" "if Yangpu [\nif Draw-Graphs?[\nif ticks >= 1 [plot ((count turtles with [(district = \"Yangpu District\") AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [district = \"Yangpu District\"]))]]]\n;percentage of the households in district which adapted at least one measure\n"

SWITCH
21
188
151
221
Draw-Graphs?
Draw-Graphs?
0
1
-1000

MONITOR
640
1708
700
1753
Huangpu
Word (ROUND ((Precision (Count turtles with [district = \"Huangpu District\"] / Count turtles) 2) * 100)) \"%\"
17
1
11

MONITOR
701
1708
751
1753
Xuhui
Word (ROUND ((Precision (Count turtles with [district = \"Xuhui District\"] / Count turtles) 2) * 100)) \"%\"
17
1
11

MONITOR
752
1708
821
1753
Changning
Word (ROUND ((Precision (Count turtles with [district = \"Changning District\"] / Count turtles) 2) * 100)) \"%\"
17
1
11

MONITOR
821
1708
871
1753
Jing'an
Word (ROUND ((Precision (Count turtles with [district = \"Jing'an District\"] / Count turtles) 2) * 100)) \"%\"
17
1
11

MONITOR
872
1708
922
1753
Putuo
Word (ROUND ((Precision (Count turtles with [district = \"Putuo District\"] / Count turtles) 2) * 100)) \"%\"
17
1
11

MONITOR
924
1708
986
1753
Hongkou
Word (ROUND ((Precision (Count turtles with [district = \"Hongkou District\"] / Count turtles) 2) * 100)) \"%\"
17
1
11

MONITOR
988
1708
1042
1753
Yangpu
Word (ROUND ((Precision (Count turtles with [district = \"Yangpu District\"] / Count turtles) 2) * 100)) \"%\"
17
1
11

TEXTBOX
644
1693
811
1712
Spatial distribution of households
10
0.0
1

PLOT
1076
635
1482
827
Adaptation diffusion for different building types
Time [years]
Adapted HHs [%]
0.0
30.0
0.0
1.0
true
true
"" ""
PENS
"House" 1.0 0 -13840069 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(build_type = \"House\") AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [build_type = \"House\"]))]]\n;percentage of the hhs with the building type which adapted at least one measure\n"
"Apartment" 1.0 0 -13791810 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(build_type = \"Apartment\") AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [build_type = \"Apartment\"]))]]\n;percentage of the hhs with the building type which adapted at least one measure\n"

TEXTBOX
1080
611
1395
647
Accomodation-related: Residential building type
14
0.0
1

MONITOR
1077
843
1135
888
House
Word (ROUND((Precision (Count turtles with [build_type = \"House\"] / Count turtles) 2) * 100)) \"%\"
17
1
11

MONITOR
1140
843
1213
888
Apartment
Word (ROUND((Precision (Count turtles with [build_type = \"Apartment\"] / Count turtles) 2) * 100)) \"%\"
17
1
11

TEXTBOX
1079
828
1316
847
Distribution of building types in population
10
0.0
1

PLOT
1077
911
1485
1106
Adaptation diffusion for different status types
Time [years]
Adapted HHs [%]
0.0
30.0
0.0
1.0
true
true
"" ""
PENS
"Rent" 1.0 0 -817084 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(hh_status = 1) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [hh_status = 1]))]]\n;percentage of the hhs with the building type which adapted at least one measure\n"
"Own" 1.0 0 -5825686 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(hh_status = 0) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [hh_status = 0]))]]\n;percentage of the hhs with the building type which adapted at least one measure\n"

MONITOR
1090
1126
1148
1171
Rent
Word (ROUND((Precision (Count turtles with [hh_status = 1] / Count turtles) 2) * 100)) \"%\"
17
1
11

MONITOR
1154
1126
1212
1171
Own
Word (ROUND((Precision (Count turtles with [hh_status = 0] / Count turtles) 2) * 100)) \"%\"
17
1
11

TEXTBOX
1091
1110
1408
1135
Distribution of household status types in population
10
0.0
1

TEXTBOX
1085
890
1374
919
Accomodation-related: Household status
14
0.0
1

PLOT
1074
1200
1479
1389
Adaptation diffusion for social media perceptions
Time [years]
Adapted HHs [%]
0.0
30.0
0.0
1.0
true
true
"" ""
PENS
"Low " 1.0 0 -2674135 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(soc_media < 2) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [soc_media < 2]))]]\n;percentage of the hhs with the social media perceiption which adapted at least one measure\n"
"Medium" 1.0 0 -955883 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(soc_media < 3) AND (soc_media >= 2) AND\n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [(soc_media < 3) AND (soc_media >= 2)]))]]\n;percentage of the hhs with the social media perceiption which adapted at least one measure\n"
"High" 1.0 0 -13791810 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(soc_media < 4) AND (soc_media >= 3) AND\n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [(soc_media < 4) AND (soc_media >= 3)]))]]\n;percentage of the hhs with the social media perceiption which adapted at least one measure\n"
"Very High" 1.0 0 -14070903 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(soc_media >= 4) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [soc_media >= 4]))]]\n;percentage of the hhs with the social media perceiption which adapted at least one measure\n"

TEXTBOX
1076
1179
1452
1233
External influences: Social media trust & frequency
14
0.0
1

MONITOR
1083
1416
1141
1461
Low
Word (ROUND((Precision (Count turtles with [(soc_media < 2)] / Count turtles) 2) * 100)) \"%\"
17
1
11

MONITOR
1148
1416
1206
1461
Medium
Word (ROUND((Precision (Count turtles with [(soc_media >= 2) AND (soc_media < 3)] / Count turtles) 2) * 100)) \"%\"
17
1
11

MONITOR
1213
1416
1271
1461
High
Word (ROUND((Precision (Count turtles with [(soc_media >= 3) AND (soc_media < 4)] / Count turtles) 2) * 100)) \"%\"
17
1
11

TEXTBOX
1083
1399
1427
1424
Distribution of social media perceiption classes in population
10
0.0
1

MONITOR
1279
1416
1346
1461
Very High
Word (ROUND((Precision (Count turtles with [(soc_media >= 4)] / Count turtles) 2) * 100)) \"%\"
17
1
11

TEXTBOX
1358
1417
1461
1457
Low: Soc_media < 2\nMedium: Soc_media 2 - 3\nHigh: Soc_media 3 - 4\nHigh: Soc_media > 4
8
0.0
1

PLOT
1079
1504
1480
1700
Adatpation diffiusion for social network size
Time [years]
Adapted HHs [%]
0.0
30.0
0.0
1.0
true
true
"" ""
PENS
"Very Low" 1.0 0 -7858858 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(soc_net <= 1 * Difference_soc_net_adapted_soc_net ) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [(soc_net <= 1 * Difference_soc_net_adapted_soc_net)]))]]\n;percentage of the hhs with this social network size which adapted at least one measure\n"
"Low" 1.0 0 -2674135 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(soc_net = 2 * Difference_soc_net_adapted_soc_net ) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [(soc_net = 2 * Difference_soc_net_adapted_soc_net)]))]]\n;percentage of the hhs with this social network size which adapted at least one measure\n"
"Medium" 1.0 0 -955883 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(soc_net = 3 * Difference_soc_net_adapted_soc_net ) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [(soc_net = 3 * Difference_soc_net_adapted_soc_net)]))]]\n;percentage of the hhs with this social network size which adapted at least one measure\n"
"High" 1.0 0 -11033397 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(soc_net = 4 * Difference_soc_net_adapted_soc_net ) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [(soc_net = 4 * Difference_soc_net_adapted_soc_net)]))]]\n;percentage of the hhs with this social network size which adapted at least one measure\n"
"Very High" 1.0 0 -14070903 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(soc_net = 5 * Difference_soc_net_adapted_soc_net ) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [(soc_net = 5 * Difference_soc_net_adapted_soc_net)]))]]\n;percentage of the hhs with this social network size which adapted at least one measure\n"

MONITOR
1088
1722
1150
1767
Very Low
Word (ROUND((Precision (Count turtles with [(soc_net <= 1 * Difference_soc_net_adapted_soc_net)] / Count turtles) 2) * 100)) \"%\"
17
1
11

MONITOR
1155
1721
1212
1766
Low
Word (ROUND((Precision (Count turtles with [(soc_net = 2 * Difference_soc_net_adapted_soc_net)] / Count turtles) 2) * 100)) \"%\"
17
1
11

MONITOR
1217
1721
1270
1766
Medium
Word (ROUND((Precision (Count turtles with [(soc_net = 3 * Difference_soc_net_adapted_soc_net)] / Count turtles) 2) * 100)) \"%\"
17
1
11

MONITOR
1279
1721
1336
1766
High
Word (ROUND((Precision (Count turtles with [(soc_net = 4 * Difference_soc_net_adapted_soc_net)] / Count turtles) 2) * 100)) \"%\"
17
1
11

MONITOR
1344
1721
1410
1766
Very High
Word (ROUND((Precision (Count turtles with [(soc_net = 5 * Difference_soc_net_adapted_soc_net)] / Count turtles) 2) * 100)) \"%\"
17
1
11

TEXTBOX
1090
1704
1351
1722
Distribution of social network sizes in population
10
0.0
1

PLOT
1516
335
1998
642
Adaptation diffusion for flood probability perceiption levels
Time [years]
Adapted HHs [%]
0.0
30.0
0.0
1.0
true
true
"" ""
PENS
"100% safe" 1.0 0 -9276814 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(fl_prob_percpt = 1) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [fl_prob_percpt = 1]))]]\n;percentage of the hhs with the flood probability perceiption in this range which adapted at least one measure\n"
"> 500 years" 1.0 0 -7858858 true "" "if Draw-Graphs? [\nif ticks >= 1 [\nplot \n((count turtles with [(fl_prob_percpt = 2) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [fl_prob_percpt = 2]))]]\n;percentage of the hhs with the flood probability perceiption in this range which adapted at least one measure\n"
"500 years" 1.0 0 -2674135 true "" "if Draw-Graphs? [\nif ticks >= 1 [\nplot \n((count turtles with [(fl_prob_percpt = 3) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [fl_prob_percpt = 3]))]]\n;percentage of the hhs with the flood probability perceiption in this range which adapted at least one measure\n"
"200 years " 1.0 0 -955883 true "" "if Draw-Graphs? [\nif ticks >= 1 [\nplot \n((count turtles with [(fl_prob_percpt = 4) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [fl_prob_percpt = 4]))]]\n;percentage of the hhs with the flood probability perceiption in this range which adapted at least one measure\n"
"100 years " 1.0 0 -2064490 true "" "if Draw-Graphs? [\nif ticks >= 1 [\nplot \n((count turtles with [(fl_prob_percpt = 5) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [fl_prob_percpt = 5]))]]\n;percentage of the hhs with the flood probability perceiption in this range which adapted at least one measure\n"
"50 years " 1.0 0 -13840069 true "" "if Draw-Graphs? [\nif ticks >= 1 [\nplot \n((count turtles with [(fl_prob_percpt = 6) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [fl_prob_percpt = 6]))]]\n;percentage of the hhs with the flood probability perceiption in this range which adapted at least one measure\n"
"10 years " 1.0 0 -14835848 true "" "if Draw-Graphs? [\nif ticks >= 1 [\nplot \n((count turtles with [(fl_prob_percpt = 7) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [fl_prob_percpt = 7]))]]\n;percentage of the hhs with the flood probability perceiption in this range which adapted at least one measure\n"
"1 year" 1.0 0 -13791810 true "" "if Draw-Graphs? [\nif ticks >= 1 [\nplot \n((count turtles with [(fl_prob_percpt = 8) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [fl_prob_percpt = 8]))]]\n;percentage of the hhs with the flood probability perceiption in this range which adapted at least one measure\n"
"< 1 year" 1.0 0 -13345367 true "" "if Draw-Graphs? [\nif ticks >= 1 [\nplot \n((count turtles with [(fl_prob_percpt = 9) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [fl_prob_percpt = 9]))]]\n;percentage of the hhs with the flood probability perceiption in this range which adapted at least one measure\n"

TEXTBOX
1088
1481
1351
1499
External influences: Social network size
14
0.0
1

MONITOR
1515
655
1566
688
100% safe
Word (ROUND((Precision (Count turtles with [fl_prob_percpt = 1] / Count turtles) 2) * 100)) \"%\"
17
1
8

MONITOR
1571
655
1628
688
> 500 years
Word (ROUND((Precision (Count turtles with [fl_prob_percpt = 2] / Count turtles) 2) * 100)) \"%\"
17
1
8

MONITOR
1631
655
1681
688
500 year
Word (ROUND((Precision (Count turtles with [fl_prob_percpt = 3] / Count turtles) 2) * 100)) \"%\"
17
1
8

MONITOR
1685
655
1735
688
200 years
Word (ROUND((Precision (Count turtles with [fl_prob_percpt = 4] / Count turtles) 2) * 100)) \"%\"
17
1
8

MONITOR
1737
654
1787
687
100 years
Word (ROUND((Precision (Count turtles with [fl_prob_percpt = 5] / Count turtles) 2) * 100)) \"%\"
17
1
8

MONITOR
1790
654
1840
687
50 years
Word (ROUND((Precision (Count turtles with [fl_prob_percpt = 6] / Count turtles) 2) * 100)) \"%\"
17
1
8

MONITOR
1843
654
1893
687
10 years
Word (ROUND((Precision (Count turtles with [fl_prob_percpt = 7] / Count turtles) 2) * 100)) \"%\"
17
1
8

MONITOR
1898
653
1948
686
1 year
Word (ROUND((Precision (Count turtles with [fl_prob_percpt = 8] / Count turtles) 2) * 100)) \"%\"
17
1
8

MONITOR
1951
653
2001
686
< 1 year
Word (ROUND((Precision (Count turtles with [fl_prob_percpt = 9] / Count turtles) 2) * 100)) \"%\"
17
1
8

TEXTBOX
1518
641
1821
667
Distribution of perceived flood probability levels in population
10
0.0
1

TEXTBOX
1516
309
1819
328
Threat appraisal: Perceived flood probability
14
0.0
1

PLOT
1516
714
1998
1021
Adaptation diffusion for flood damage perceiption levels
Time [years]
Adapted HHs [%]
0.0
30.0
0.0
1.0
true
true
"" ""
PENS
"Not severed at all" 1.0 0 -2674135 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(fl_dam_percpt = 1) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [fl_dam_percpt = 1]))]]\n;percentage of the hhs with the pereived flood probability which adapted at least one measure\n"
"Low severity" 1.0 0 -955883 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(fl_dam_percpt = 2) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [fl_dam_percpt = 2]))]]\n;percentage of the hhs with the pereived flood probability which adapted at least one measure\n"
"Medium severity" 1.0 0 -13840069 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(fl_dam_percpt = 3) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [fl_dam_percpt = 3]))]]\n;percentage of the hhs with the pereived flood probability which adapted at least one measure\n"
"Severe" 1.0 0 -11221820 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(fl_dam_percpt = 4) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [fl_dam_percpt = 4]))]]\n;percentage of the hhs with the pereived flood probability which adapted at least one measure\n"
"Very severe" 1.0 0 -14070903 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(fl_dam_percpt = 5) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [fl_dam_percpt = 5]))]]\n;percentage of the hhs with the pereived flood probability which adapted at least one measure\n"

MONITOR
1517
1041
1598
1078
Not severe at all
Word (ROUND((Precision (Count turtles with [fl_dam_percpt = 1] / Count turtles) 2) * 100)) \"%\"
17
1
9

MONITOR
1602
1041
1668
1078
Low severity
Word (ROUND((Precision (Count turtles with [fl_dam_percpt = 2] / Count turtles) 2) * 100)) \"%\"
17
1
9

MONITOR
1673
1041
1756
1078
Medium severity
Word (ROUND((Precision (Count turtles with [fl_dam_percpt = 3] / Count turtles) 2) * 100)) \"%\"
17
1
9

MONITOR
1759
1041
1809
1078
Severe
Word (ROUND((Precision (Count turtles with [fl_dam_percpt = 4] / Count turtles) 2) * 100)) \"%\"
17
1
9

MONITOR
1814
1041
1877
1078
Very severe
Word (ROUND((Precision (Count turtles with [fl_dam_percpt = 5] / Count turtles) 2) * 100)) \"%\"
17
1
9

TEXTBOX
1518
1025
1797
1051
Distribution of perceived flood damage levels in population
10
0.0
1

PLOT
1516
1101
1995
1406
Adaptation diffusion for worry levels
Time [years]
Adapted HHs
0.0
30.0
0.0
1.0
true
true
"" ""
PENS
"Not at all worried" 1.0 0 -2674135 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(worry = 1) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [worry = 1]))]]\n;percentage of the hhs with the worry which adapted at least one measure\n"
"Low worry" 1.0 0 -955883 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(worry = 2) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [worry = 2]))]]\n;percentage of the hhs with the worry which adapted at least one measure\n"
"Medium worried" 1.0 0 -13840069 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(worry = 3) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [worry = 3]))]]\n;percentage of the hhs with the worry which adapted at least one measure\n"
"Worried" 1.0 0 -11221820 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(worry = 4) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [worry = 4]))]]\n;percentage of the hhs with the worry which adapted at least one measure\n"
"Very worried" 1.0 0 -14070903 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(worry = 5) AND \n((item 0 UG = 1) OR (item 1 UG = 1) OR (item 2 UG = 1))]) \n/ (count turtles with [worry = 5]))]]\n;percentage of the hhs with the worry which adapted at least one measure\n"

MONITOR
1515
1428
1603
1469
Not at all worried
Word (ROUND((Precision (Count turtles with [(worry = 1)] / Count turtles) 2) * 100)) \"%\"
17
1
10

MONITOR
1612
1428
1683
1469
Low worry
Word (ROUND((Precision (Count turtles with [(worry = 2)] / Count turtles) 2) * 100)) \"%\"
17
1
10

MONITOR
1690
1428
1776
1469
Medium worried
Word (ROUND((Precision (Count turtles with [(worry = 3)] / Count turtles) 2) * 100)) \"%\"
17
1
10

MONITOR
1781
1428
1838
1469
Worried
Word (ROUND((Precision (Count turtles with [(worry = 4)] / Count turtles) 2) * 100)) \"%\"
17
1
10

MONITOR
1843
1428
1916
1469
Very worried
Word (ROUND((Precision (Count turtles with [(worry = 5)] / Count turtles) 2) * 100)) \"%\"
17
1
10

TEXTBOX
1516
1410
1788
1436
Distribution of worry levels in population
10
0.0
1

TEXTBOX
1516
690
1843
708
Threat appraisal: Perceived flood damage
14
0.0
1

TEXTBOX
1516
1081
1712
1100
Threat appraisal: Worry
14
0.0
1

PLOT
2023
335
2504
684
Adaptation diffusion for response efficacy levels
Time [years]
Adapted HHs [%]
0.0
30.0
0.0
1.0
true
true
"" ""
PENS
"Elev - Very Low" 1.0 0 -4528153 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(item 0 Resp_Eff < 2) AND \n(item 0 UG = 1)]) \n/ (count turtles with [item 0 Resp_Eff < 2]))]]\n;percentage of the hhs with the response efficacy which adapted at least one measure\n"
"Elev - Low" 1.0 0 -8990512 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [((item 0 Resp_Eff >= 2) AND (item 0 Resp_Eff < 3)) AND \n(item 0 UG = 1)]) \n/ (count turtles with [((item 0 Resp_Eff >= 2) AND (item 0 Resp_Eff < 3))]))]]\n;percentage of the hhs with the response efficacy which adapted at least one measure\n"
"Elev - High" 1.0 0 -10649926 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [((item 0 Resp_Eff >= 3) AND (item 0 Resp_Eff < 4)) AND \n(item 0 UG = 1)]) \n/ (count turtles with [((item 0 Resp_Eff >= 3) AND (item 0 Resp_Eff < 4))]))]]\n;percentage of the hhs with the response efficacy which adapted at least one measure\n"
"Elev - Very High" 1.0 0 -14070903 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(item 0 Resp_Eff >= 4) AND \n(item 0 UG = 1)]) \n/ (count turtles with [item 0 Resp_Eff >= 4]))]]\n;percentage of the hhs with the response efficacy which adapted at least one measure\n"
"Wet - Very Low" 1.0 0 -6565750 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(item 1 Resp_Eff < 2) AND \n(item 1 UG = 1)]) \n/ (count turtles with [item 1 Resp_Eff < 2]))]]\n;percentage of the hhs with the response efficacy which adapted at least one measure\n"
"Wet - Very" 1.0 0 -8330359 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [((item 1 Resp_Eff >= 2) AND (item 1 Resp_Eff < 3)) AND \n(item 1 UG = 1)]) \n/ (count turtles with [((item 1 Resp_Eff >= 2) AND (item 1 Resp_Eff < 3))]))]]\n;percentage of the hhs with the response efficacy which adapted at least one measure\n"
"Wet - High" 1.0 0 -12087248 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [((item 1 Resp_Eff >= 3) AND (item 1 Resp_Eff < 4)) AND \n(item 1 UG = 1)]) \n/ (count turtles with [((item 1 Resp_Eff >= 3) AND (item 1 Resp_Eff < 4))]))]]\n;percentage of the hhs with the response efficacy which adapted at least one measure\n"
"Wet - Very High" 1.0 0 -15575016 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(item 1 Resp_Eff >= 4) AND \n(item 1 UG = 1)]) \n/ (count turtles with [item 1 Resp_Eff >= 4]))]]\n;percentage of the hhs with the response efficacy which adapted at least one measure\n"
"Dry - Very Low" 1.0 0 -408670 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(item 2 Resp_Eff < 2) AND \n(item 2 UG = 1)]) \n/ (count turtles with [item 2 Resp_Eff < 2]))]]\n;percentage of the hhs with the response efficacy which adapted at least one measure\n"
"Dry - Low" 1.0 0 -817084 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [((item 2 Resp_Eff >= 2) AND (item 2 Resp_Eff < 3)) AND \n(item 2 UG = 1)]) \n/ (count turtles with [((item 2 Resp_Eff >= 2) AND (item 2 Resp_Eff < 3))]))]]\n;percentage of the hhs with the response efficacy which adapted at least one measure\n"
"Dry - High" 1.0 0 -5207188 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [((item 2 Resp_Eff >= 3) AND (item 2 Resp_Eff < 4)) AND \n(item 2 UG = 1)]) \n/ (count turtles with [((item 2 Resp_Eff >= 3) AND (item 2 Resp_Eff < 4))]))]]\n;percentage of the hhs with the response efficacy which adapted at least one measure\n"
"Dry - Very High" 1.0 0 -8431303 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(item 2 Resp_Eff >= 4) AND \n(item 2 UG = 1)]) \n/ (count turtles with [item 2 Resp_Eff >= 4]))]]\n;percentage of the hhs with the response efficacy which adapted at least one measure\n"

TEXTBOX
2025
313
2277
347
Coping appraisal: Response efficacy
14
0.0
1

PLOT
2020
716
2503
1072
Adaptation diffusion for self efficacy levels
Time [years]
Adapted HHs [%]
0.0
30.0
0.0
1.0
true
true
"" ""
PENS
"Elev - Very Low" 1.0 0 -4528153 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(item 0 Self_Eff < 2) AND \n(item 0 UG = 1)]) \n/ (count turtles with [item 0 Self_Eff < 2]))]]\n;percentage of the hhs with the self efficacy which adapted at least one measure\n"
"Elev - Low" 1.0 0 -8990512 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [((item 0 Self_Eff >= 2) AND (item 0 Self_Eff < 3)) AND \n(item 0 UG = 1)]) \n/ (count turtles with [((item 0 Self_Eff >= 2) AND (item 0 Self_Eff < 3))]))]]\n;percentage of the hhs with the self efficacy which adapted at least one measure\n"
"Elev - High" 1.0 0 -10649926 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [((item 0 Self_Eff >= 3) AND (item 0 Self_Eff < 4)) AND \n(item 0 UG = 1)]) \n/ (count turtles with [((item 0 Self_Eff >= 3) AND (item 0 Self_Eff < 4))]))]]\n;percentage of the hhs with the self efficacy which adapted at least one measure\n"
"Elev - Very High" 1.0 0 -14070903 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(item 0 Self_Eff >= 4) AND \n(item 0 UG = 1)]) \n/ (count turtles with [item 0 Self_Eff >= 4]))]]\n;percentage of the hhs with the self efficacy which adapted at least one measure\n"
"Wet - Very Low" 1.0 0 -4399183 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(item 1 Self_Eff < 2) AND \n(item 1 UG = 1)]) \n/ (count turtles with [item 1 Self_Eff < 2]))]]\n;percentage of the hhs with the self efficacy which adapted at least one measure\n"
"Wet - Low" 1.0 0 -8330359 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [((item 1 Self_Eff >= 2) AND (item 1 Self_Eff < 3)) AND \n(item 1 UG = 1)]) \n/ (count turtles with [((item 1 Self_Eff >= 2) AND (item 1 Self_Eff < 3))]))]]\n;percentage of the hhs with the self efficacy which adapted at least one measure\n"
"Wet - High" 1.0 0 -12087248 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [((item 1 Self_Eff >= 3) AND (item 1 Self_Eff < 4)) AND \n(item 1 UG = 1)]) \n/ (count turtles with [((item 1 Self_Eff >= 3) AND (item 1 Self_Eff < 4))]))]]\n;percentage of the hhs with the self efficacy which adapted at least one measure\n"
"Wet - Very High" 1.0 0 -14333415 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(item 1 Self_Eff >= 4) AND \n(item 1 UG = 1)]) \n/ (count turtles with [item 1 Self_Eff >= 4]))]]\n;percentage of the hhs with the self efficacy which adapted at least one measure\n"
"Dry - Very Low" 1.0 0 -408670 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(item 2 Self_Eff < 2) AND \n(item 2 UG = 1)]) \n/ (count turtles with [item 2 Self_Eff < 2]))]]\n;percentage of the hhs with the self efficacy which adapted at least one measure\n"
"Dry - Low" 1.0 0 -817084 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [((item 2 Self_Eff >= 2) AND (item 2 Self_Eff < 3)) AND \n(item 2 UG = 1)]) \n/ (count turtles with [((item 2 Self_Eff >= 2) AND (item 2 Self_Eff < 3))]))]]\n;percentage of the hhs with the self efficacy which adapted at least one measure\n"
"Dry - High" 1.0 0 -5207188 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [((item 2 Self_Eff >= 3) AND (item 2 Self_Eff < 4)) AND \n(item 2 UG = 1)]) \n/ (count turtles with [((item 2 Self_Eff >= 3) AND (item 2 Self_Eff < 4))]))]]\n;percentage of the hhs with the self efficacy which adapted at least one measure\n"
"Dry - Very High" 1.0 0 -8431303 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(item 2 Self_Eff >= 4) AND \n(item 2 UG = 1)]) \n/ (count turtles with [item 2 Self_Eff >= 4]))]]\n;percentage of the hhs with the self efficacy which adapted at least one measure\n"

TEXTBOX
2021
690
2272
708
Coping appraisal: Self efficacy
14
0.0
1

TEXTBOX
2020
1075
2170
1093
Coping appraisal: Cost
14
0.0
1

PLOT
2021
1102
2501
1404
Adaptation diffusion for cost perceiption levels
Time [years]
Adapted HHs [%]
0.0
30.0
0.0
1.0
true
true
"" ""
PENS
"Elev - Very Low" 1.0 0 -8990512 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(item 0 cost_percpt < 2) AND \n(item 0 UG = 1)]) \n/ (count turtles with [item 0 cost_percpt < 2]))]]\n;percentage of the hhs with the cost perceiption which adapted at least one measure\n"
"Elev - Low" 1.0 0 -12345184 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [((item 0 cost_percpt >= 2) AND (item 0 cost_percpt < 3)) AND \n(item 0 UG = 1)]) \n/ (count turtles with [((item 0 cost_percpt >= 2) AND (item 0 cost_percpt < 3))]))]]\n;percentage of the hhs with the cost perceiption which adapted at least one measure\n"
"Elev - High" 1.0 0 -13345367 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [((item 0 cost_percpt >= 3) AND (item 0 cost_percpt < 4)) AND \n(item 0 UG = 1)]) \n/ (count turtles with [((item 0 cost_percpt >= 3) AND (item 0 cost_percpt < 4))]))]]\n;percentage of the hhs with the cost perceiption which adapted at least one measure\n"
"Elev - Very High" 1.0 0 -14730904 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(item 0 cost_percpt >= 4) AND \n(item 0 UG = 1)]) \n/ (count turtles with [item 0 cost_percpt >= 4]))]]\n;percentage of the hhs with the cost perceiption which adapted at least one measure\n"
"Wet - Very Low" 1.0 0 -5509967 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(item 1 cost_percpt < 2) AND \n(item 1 UG = 1)]) \n/ (count turtles with [item 1 cost_percpt < 2]))]]\n;percentage of the hhs with the cost perceiption which adapted at least one measure\n"
"Wet - Low" 1.0 0 -13840069 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [((item 1 cost_percpt >= 2) AND (item 1 cost_percpt < 3)) AND \n(item 1 UG = 1)]) \n/ (count turtles with [((item 1 cost_percpt >= 2) AND (item 1 cost_percpt < 3))]))]]\n;percentage of the hhs with the cost perceiption which adapted at least one measure\n"
"Wet - High" 1.0 0 -12087248 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [((item 1 cost_percpt >= 3) AND (item 1 cost_percpt < 4)) AND \n(item 1 UG = 1)]) \n/ (count turtles with [((item 1 cost_percpt >= 3) AND (item 1 cost_percpt < 4))]))]]\n;percentage of the hhs with the cost perceiption which adapted at least one measure\n"
"Wet - Very High" 1.0 0 -15575016 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(item 1 cost_percpt >= 4) AND \n(item 1 UG = 1)]) \n/ (count turtles with [item 1 cost_percpt >= 4]))]]\n;percentage of the hhs with the cost perceiption which adapted at least one measure\n"
"Dry - Very Low" 1.0 0 -204336 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(item 2 cost_percpt < 2) AND \n(item 2 UG = 1)]) \n/ (count turtles with [item 2 cost_percpt < 2]))]]\n;percentage of the hhs with the cost perceiption which adapted at least one measure\n"
"Dry - Low" 1.0 0 -817084 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [((item 2 cost_percpt >= 2) AND (item 2 cost_percpt < 3)) AND \n(item 2 UG = 1)]) \n/ (count turtles with [((item 2 cost_percpt >= 2) AND (item 2 cost_percpt < 3))]))]]\n;percentage of the hhs with the cost perceiption which adapted at least one measure\n"
"Dry - High" 1.0 0 -6459832 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [((item 2 cost_percpt >= 3) AND (item 2 cost_percpt < 4)) AND \n(item 2 UG = 1)]) \n/ (count turtles with [((item 2 cost_percpt >= 3) AND (item 2 cost_percpt < 4))]))]]\n;percentage of the hhs with the cost perceiption which adapted at least one measure\n"
"Dry - Very High" 1.0 0 -10402772 true "" "if Draw-Graphs? [\nif ticks >= 1 [plot ((count turtles with [(item 2 cost_percpt >= 4) AND \n(item 2 UG = 1)]) \n/ (count turtles with [item 2 cost_percpt >= 4]))]]\n;percentage of the hhs with the cost perceiption which adapted at least one measure\n"

PLOT
637
1768
1037
1960
Flood experience
Time [year]
Households [%]
0.0
30.0
0.0
1.0
true
true
"" ""
PENS
"Huangpu" 1.0 0 -16777216 true "" "if huangpu [\nif Draw-Graphs?[\nif ticks >= 1 [plot ((count turtles with [(district = \"Huangpu District\") AND \n(fl_exp >= 1)]) \n/ (count turtles with [district = \"Huangpu District\"]))]]]\n;percentage of the households with flood experience in the district\n"
"Xuhui" 1.0 0 -955883 true "" "if xuhui [\nif Draw-Graphs?[\nif ticks >= 1 [plot ((count turtles with [(district = \"Xuhui District\") AND \n(fl_exp >= 1)]) \n/ (count turtles with [district = \"Xuhui District\"]))]]]\n;percentage of the households with flood experience in the district\n"
"Changning" 1.0 0 -2674135 true "" "if Changning [\nif Draw-Graphs?[\nif ticks >= 1 [plot ((count turtles with [(district = \"Changning District\") AND \n(fl_exp >= 1)]) \n/ (count turtles with [district = \"Changning District\"]))]]]\n;percentage of the households with flood experience in the district\n"
"Jing'an" 1.0 0 -7500403 true "" "if Jing'an [\nif Draw-Graphs?[\nif ticks >= 1 [plot ((count turtles with [(district = \"Jing'an District\") AND \n(fl_exp >= 1)]) \n/ (count turtles with [district = \"Jing'an District\"]))]]]\n;percentage of the households with flood experience in the district\n"
"Putuo" 1.0 0 -7858858 true "" "if Putuo [\nif Draw-Graphs?[\nif ticks >= 1 [plot ((count turtles with [(district = \"Putuo District\") AND \n(fl_exp >= 1)]) \n/ (count turtles with [district = \"Putuo District\"]))]]]\n;percentage of the households with flood experience in the district\n"
"Hongkou" 1.0 0 -13791810 true "" "if Hongkou [\nif Draw-Graphs?[\nif ticks >= 1 [plot ((count turtles with [(district = \"Hongkou District\") AND \n(fl_exp >= 1)]) \n/ (count turtles with [district = \"Hongkou District\"]))]]]\n;percentage of the households with flood experience in the district\n"
"Yangpu" 1.0 0 -10899396 true "" "if Yangpu [\nif Draw-Graphs?[\nif ticks >= 1 [plot ((count turtles with [(district = \"Yangpu District\") AND \n(fl_exp >= 1)]) \n/ (count turtles with [district = \"Yangpu District\"]))]]]\n;percentage of the households with flood experience in the district\n"

TEXTBOX
1007
39
1474
83
Impact of hypothetical policies on socio-behavioural factors motivating household adaptation
11
0.0
1

TEXTBOX
1005
10
1218
62
POLICY IMPACT
20
0.0
1

SLIDER
1013
85
1136
118
Change_fl_prob
Change_fl_prob
-9
9
0.0
1
1
NIL
HORIZONTAL

SLIDER
1012
123
1135
156
Change_fl_dam
Change_fl_dam
-5
5
0.0
1
1
NIL
HORIZONTAL

SLIDER
1012
164
1136
197
Change_worry
Change_worry
-5
5
0.0
1
1
NIL
HORIZONTAL

SLIDER
1279
85
1406
118
Change_resp_eff
Change_resp_eff
-5
5
0.0
1
1
NIL
HORIZONTAL

SLIDER
1278
124
1405
157
Change_self_eff
Change_self_eff
-5
5
0.0
1
1
NIL
HORIZONTAL

SLIDER
1278
161
1406
194
Change_cost
Change_cost
-5
5
0.0
1
1
NIL
HORIZONTAL

SLIDER
1141
85
1270
118
Change_CC_belief
Change_CC_belief
-1
1
0.0
1
1
NIL
HORIZONTAL

SLIDER
1141
123
1270
156
Change_soc_inf
Change_soc_inf
-5
5
0.0
1
1
NIL
HORIZONTAL

SLIDER
1142
160
1270
193
Change_soc_media
Change_soc_media
-5
5
0.0
1
1
NIL
HORIZONTAL

TEXTBOX
1016
63
1103
83
Threat appraisal
10
0.0
1

TEXTBOX
1146
57
1245
86
Climate belief & external influences\t
10
0.0
1

TEXTBOX
1283
67
1368
87
Coping appraisal
10
0.0
1

TEXTBOX
1020
207
1411
253
These levers change the household attributes by the respective level. E.g., if change_fl_prob is 1, the flood probability level of all hosueholds is increased by 1 (up to max 9).
9
0.0
1

TEXTBOX
552
367
610
399
Yangpu
13
0.0
1

TEXTBOX
434
570
498
588
Hongkou
13
0.0
1

TEXTBOX
433
654
500
672
Huangpu
13
0.0
1

TEXTBOX
228
358
293
376
Jing'an
13
0.0
1

TEXTBOX
58
407
120
425
Putuo\n
13
0.0
1

TEXTBOX
52
732
131
750
Changning
13
0.0
1

TEXTBOX
366
797
419
815
Xuhui
13
0.0
1

TEXTBOX
14
923
620
968
Please be aware that the location of the buildings in the visualization does not reflect their real location. The purpose of this visualization is soley to depict the number and types of households in the districts. For the actual location of the households, we refer to the thesis.
10
0.0
1

MONITOR
275
187
364
232
# Households
Count turtles
17
1
11

MONITOR
390
203
475
248
Current Year
Ticks + starting_year
17
1
11

PLOT
634
632
1037
828
Adaptation diffusion 
Time [years]
Adapted HHs [%]
0.0
30.0
0.0
1.0
true
true
"" ""
PENS
"No measure" 1.0 0 -16777216 true "" "if Draw-Graphs? [\nif (ticks >= 1) [\nplot (count turtles with [(item 0 UG + item 1 UG + item 2 UG) = 0])/(count turtles)\n]]"
"One measure" 1.0 0 -7500403 true "" "if Draw-Graphs? [\nif (ticks >= 1) [\nplot (count turtles with [(item 0 UG + item 1 UG + item 2 UG) = 1])/(count turtles)\n]]"
"Two measures" 1.0 0 -2674135 true "" "if Draw-Graphs? [\nif (ticks >= 1) [\nplot (count turtles with [(item 0 UG + item 1 UG + item 2 UG) = 2])/(count turtles)\n]]"
"Three measures" 1.0 0 -955883 true "" "if Draw-Graphs? [\nif (ticks >= 1) [\nplot (count turtles with [(item 0 UG + item 1 UG + item 2 UG) = 3])/(count turtles)\n]]"

MONITOR
637
839
724
884
No measure
count turtles with [(item 0 UG + item 1 UG + item 2 UG) = 0]
17
1
11

MONITOR
731
838
818
883
One measure
count turtles with [(item 0 UG + item 1 UG + item 2 UG) = 1]
17
1
11

MONITOR
829
839
922
884
Two measures
count turtles with [(item 0 UG + item 1 UG + item 2 UG) = 2]
17
1
11

MONITOR
934
840
1036
885
Three measures
count turtles with [(item 0 UG + item 1 UG + item 2 UG) = 3]
17
1
11

TEXTBOX
635
611
911
641
Number of adaptation measures adapted
14
0.0
1

PLOT
634
910
1037
1095
Combination of adaptation measures
Time [years]
Adaped HHs [%]
0.0
30.0
0.0
1.0
true
true
"" ""
PENS
"None" 1.0 0 -16777216 true "" "if Draw-Graphs? [\nif (ticks >= 1) [\nplot (count turtles with [(item 0 UG + item 1 UG + item 2 UG) = 0])/(count turtles)\n]]"
"Elev" 1.0 0 -7500403 true "" "if Draw-Graphs? [\nif (ticks >= 1) [\nplot (count turtles with [(item 0 UG = 1 ) AND (item 1 UG = 0) AND (item 2 UG = 0)])/(count turtles)\n]]"
"Wet" 1.0 0 -2674135 true "" "if Draw-Graphs? [\nif (ticks >= 1) [\nplot (count turtles with [(item 0 UG = 0 ) AND (item 1 UG = 1) AND (item 2 UG = 0)])/(count turtles)\n]]"
"Dry" 1.0 0 -955883 true "" "if Draw-Graphs? [\nif (ticks >= 1) [\nplot (count turtles with [(item 0 UG = 0 ) AND (item 1 UG = 0) AND (item 2 UG = 1)])/(count turtles)\n]]"
"Elev & Wet" 1.0 0 -6459832 true "" "if Draw-Graphs? [\nif (ticks >= 1) [\nplot (count turtles with [(item 0 UG = 1 ) AND (item 1 UG = 1) AND (item 2 UG = 0)])/(count turtles)\n]]"
"Elev & Dry" 1.0 0 -1184463 true "" "if Draw-Graphs? [\nif (ticks >= 1) [\nplot (count turtles with [(item 0 UG = 1 ) AND (item 1 UG = 0) AND (item 2 UG = 1)])/(count turtles)\n]]"
"Wet & Dry" 1.0 0 -10899396 true "" "if Draw-Graphs? [\nif (ticks >= 1) [\nplot (count turtles with [(item 0 UG = 0 ) AND (item 1 UG = 1) AND (item 2 UG = 1)])/(count turtles)\n]]"
"Elev & Wet & Dry" 1.0 0 -13840069 true "" "if Draw-Graphs? [\nif (ticks >= 1) [\nplot (count turtles with [(item 0 UG = 1 ) AND (item 1 UG = 1) AND (item 2 UG = 1)])/(count turtles)\n]]"

TEXTBOX
636
889
786
907
Measure combinations
14
0.0
1

SWITCH
20
226
151
259
Behaviourspace?
Behaviourspace?
1
1
-1000

CHOOSER
499
48
778
93
Quick_Flood_Scenario_Selector
Quick_Flood_Scenario_Selector
"Individual scenario configured" "No flood" "2021_100_RCP8.5" "2021_1000_RCP8.5" "2040_100_RCP8.5" "2040_1000_RCP8.5" "2040_1000_RCP2.6" "2021_100_RCP8.5 + 2040_1000_RCP8.5"
1

SWITCH
2107
199
2250
232
Economic_model?
Economic_model?
0
1
-1000

CHOOSER
1958
212
2096
257
Cost_source
Cost_source
"Survey data" "Du et al. (2020)"
0

TEXTBOX
1484
12
1634
37
SENSITIVITY\n
20
0.0
1

INPUTBOX
1844
214
1950
274
Intention_Gap
0.278
1
0
Number

SLIDER
1483
166
1655
199
Effectiveness_Elev
Effectiveness_Elev
0
1
1.0
0.05
1
NIL
HORIZONTAL

SLIDER
1483
201
1655
234
Effectiveness_Wet
Effectiveness_Wet
0
1
0.4
0.05
1
NIL
HORIZONTAL

SLIDER
1483
240
1655
273
Effectiveness_Dry
Effectiveness_Dry
0
1
0.85
0.05
1
NIL
HORIZONTAL

SLIDER
2106
160
2251
193
Foundation_Height
Foundation_Height
0
0.5
0.1
0.1
1
m
HORIZONTAL

CHOOSER
1484
113
1640
158
Quick_Effectiv_Selector
Quick_Effectiv_Selector
"Inidividual selection" "Normal" "Low" "High"
1

SLIDER
1661
165
1826
198
Effectiveness_lvl_elev
Effectiveness_lvl_elev
0
5
0.3
0.1
1
m
HORIZONTAL

SLIDER
1661
201
1825
234
Effectiveness_lvl_wet
Effectiveness_lvl_wet
0
5
3.0
0.2
1
m
HORIZONTAL

SLIDER
1662
239
1825
272
Effectiveness_lvl_dry
Effectiveness_lvl_dry
0
5
1.0
0.2
1
m
HORIZONTAL

CHOOSER
1659
111
1824
156
Quick_Effectiv_Lvl_Selector
Quick_Effectiv_Lvl_Selector
"Inidividual selection" "Normal" "Low"
1

INPUTBOX
1843
149
1953
209
Building_Sqm_Value_EUR
861.0
1
0
Number

CHOOSER
1481
60
1988
105
Sensitivity
Sensitivity
"No sensitivity" "Individual" "Foundation Height - 0 m" "Foundation Height - 0.2m" "Depth Damage - Yu et al. (2012)" "Depth Damage - Z. Yin et al. (2011)" "Asset Value - Building Price" "Measure Cost - Fully subsidized" "Measure Cost - Du et al. (2020)" "Measure Effectiveness - Low" "Measure Effectiveness - High" "Measure Effectiveness Level - Low" "Intention Gap - 13.9%" "Intention Gap - 41.7%" "Intention Gap - 100%"
0

TEXTBOX
160
236
310
258
When using behaviourspace for simulations then turn this lever on!
9
0.0
1

TEXTBOX
786
51
936
84
The Quick_Flood_Scenario_Selector overwrites the other flood-related input levers
9
0.0
1

TEXTBOX
386
10
487
60
TEMPORAL SCALE
20
0.0
1

TEXTBOX
2014
69
2200
102
The sensitivity selector overwrites all the other sensitivity-related input levers!
9
0.0
1

TEXTBOX
1848
119
2035
152
The Quick Effectiveness Selectors overwrite the measure-specific input levers!
9
0.0
1

TEXTBOX
389
250
487
329
When changing the starting year, the monetary parameters need to be adjusted to inflation.
8
0.0
1

@#$#@#$#@
# Shanghai flood ABM

## MOTIVATION AND BACKGROUND

As climate change continues to exacerbate the severity and frequency of floods, the need for coordinated adaptation at all levels of society increases. Top-down governmental adaptation – often in the form of engineering solutions – is important, but insufficient considering worsening risks and requires additional household adaptation. Although there is growing empirical evidence on whether, when, and how households adapt, quantifying the cumulative effects of household behavioural changes in flood adaptation remains a challenge. It is important for policymakers to understand the rate and extend of risk reduction through household adaptation to prioritize the most effective adaptation measures. To integrate both human and biophysical components in our flood risk assessment, we apply inundation maps from existing numerical flood-models into an agent-based model. The novelty of our approach lies in the application, according to our knowlege, one of the first behavioural theory-driven agent-based flood-model in a coastal city of the Global South: Shanghai. The agent-based model can show the impact of socio-behavioural factors motivating household adaptation on the flood risk in Shanghai and hence can provide a foundation for deriving policy recommendations on increasing the efficiency of flood-adaptation. 

## MODEL NARRATIVE

![Model narrative] (file:Images/narrative.png)

## MODEL DESCRIPTION

We describe our model using the ODD protocol (Grimm et al., 2020), which is included in the thesis document.

## SOURCES

Grimm, V., Railsback, S. F., Vincenot, C. E., Berger, U., Gallagher, C., DeAngelis, D. L., Edmonds, B., Ge, J., Giske, J., Groeneveld, J., Johnston, A. S. A., Milles, A., Nabe-Nielsen, J., Polhill, J. G., Radchuk, V., Rohwäder, M.-S., Stillman, R. A., Thiele, J. C., & Ayllón, D. (2020). The ODD Protocol for Describing Agent-Based and Other Simulation Models: A Second Update to Improve Clarity, Replication, and Structural Realism. Journal of Artificial Societies and Social Simulation, 23(2). https://doi.org/10.18564/jasss.4259
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

apartment
false
0
Rectangle -7500403 true true 60 45 240 270
Rectangle -7500403 false true 75 60 105 90
Rectangle -1 true false 75 60 90 75
Rectangle -1 true false 75 90 90 105
Rectangle -1 true false 75 120 90 135
Rectangle -1 true false 75 150 90 165
Rectangle -1 true false 75 150 90 165
Rectangle -1 true false 75 180 90 195
Rectangle -1 true false 75 210 90 225
Rectangle -1 true false 75 240 90 255
Rectangle -1 true false 120 210 135 225
Rectangle -1 true false 165 210 180 225
Rectangle -1 true false 210 210 225 225
Rectangle -1 true false 210 180 225 195
Rectangle -1 true false 210 150 225 165
Rectangle -1 true false 210 120 225 135
Rectangle -1 true false 210 90 225 105
Rectangle -1 true false 210 60 225 75
Rectangle -1 true false 210 240 225 255
Rectangle -1 true false 120 180 135 195
Rectangle -1 true false 120 180 135 195
Rectangle -1 true false 120 120 135 135
Rectangle -1 true false 120 150 135 165
Rectangle -1 true false 120 90 120 105
Rectangle -1 true false 120 90 135 105
Rectangle -1 true false 120 60 135 75
Rectangle -1 true false 165 60 180 75
Rectangle -1 true false 165 90 180 105
Rectangle -1 true false 165 120 180 135
Rectangle -1 true false 165 150 180 165
Rectangle -1 true false 165 180 180 195
Rectangle -1 true false 135 240 165 270

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -1 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120

house colonial
false
0
Rectangle -7500403 true true 270 75 285 255
Rectangle -7500403 true true 45 135 270 255
Rectangle -16777216 true false 124 195 187 256
Rectangle -16777216 true false 60 195 105 240
Rectangle -16777216 true false 60 150 105 180
Rectangle -16777216 true false 210 150 255 180
Line -16777216 false 270 135 270 255
Polygon -7500403 true true 30 135 285 135 240 90 75 90
Line -16777216 false 30 135 285 135
Line -16777216 false 255 105 285 135
Line -7500403 true 154 195 154 255
Rectangle -16777216 true false 210 195 255 240
Rectangle -16777216 true false 135 150 180 180

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.2.2
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
<experiments>
  <experiment name="Main" repetitions="100" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="30"/>
    <metric>Adapted_none</metric>
    <metric>Adapted_elev</metric>
    <metric>Adapted_wet</metric>
    <metric>Adapted_dry</metric>
    <metric>Adapted_elev_wet</metric>
    <metric>Adapted_elev_dry</metric>
    <metric>Adapted_wet_dry</metric>
    <metric>Adapted_all</metric>
    <metric>Adapted_at_least_one</metric>
    <metric>Sum_fl_dam_build</metric>
    <metric>Sum_fl_dam_cont</metric>
    <metric>Benefit_all_elev</metric>
    <metric>Benefit_all_elev_build</metric>
    <metric>Benefit_all_elev_cont</metric>
    <metric>Benefit_all_wet</metric>
    <metric>Benefit_all_wet_build</metric>
    <metric>Benefit_all_wet_cont</metric>
    <metric>Benefit_all_dry</metric>
    <metric>Benefit_all_dry_build</metric>
    <metric>Benefit_all_dry_cont</metric>
    <metric>Cost_all_elev</metric>
    <metric>Cost_all_wet</metric>
    <metric>Cost_all_dry</metric>
    <metric>Total_savings</metric>
    <metric>Cannot_afford</metric>
    <metric>No_Fl_Exp</metric>
    <metric>Very_Low_Fl_Exp</metric>
    <metric>Low_Fl_Exp</metric>
    <metric>Medium_Fl_Exp</metric>
    <metric>High_Fl_Exp</metric>
    <metric>Very_High_Fl_Exp</metric>
    <metric>Adapted_elev_worry_low</metric>
    <metric>Adapted_elev_worry_medium</metric>
    <metric>Adapted_elev_worry_high</metric>
    <metric>Adapted_wet_worry_low</metric>
    <metric>Adapted_wet_worry_medium</metric>
    <metric>Adapted_wet_worry_high</metric>
    <metric>Adapted_dry_worry_low</metric>
    <metric>Adapted_dry_worry_medium</metric>
    <metric>Adapted_dry_worry_high</metric>
    <metric>Benefit_elev_worry_low</metric>
    <metric>Benefit_elev_worry_medium</metric>
    <metric>Benefit_elev_worry_high</metric>
    <metric>Benefit_wet_worry_low</metric>
    <metric>Benefit_wet_worry_medium</metric>
    <metric>Benefit_wet_worry_high</metric>
    <metric>Benefit_dry_worry_low</metric>
    <metric>Benefit_dry_worry_medium</metric>
    <metric>Benefit_dry_worry_high</metric>
    <metric>fl_dam_worry_low</metric>
    <metric>fl_dam_worry_medium</metric>
    <metric>fl_dam_worry_high</metric>
    <metric>Adapted_elev_self_eff_low</metric>
    <metric>Adapted_elev_self_eff_medium</metric>
    <metric>Adapted_elev_self_eff_high</metric>
    <metric>Adapted_wet_self_eff_low</metric>
    <metric>Adapted_wet_self_eff_medium</metric>
    <metric>Adapted_wet_self_eff_high</metric>
    <metric>Adapted_dry_self_eff_low</metric>
    <metric>Adapted_dry_self_eff_medium</metric>
    <metric>Adapted_dry_self_eff_high</metric>
    <metric>Benefit_elev_self_eff_low</metric>
    <metric>Benefit_elev_self_eff_medium</metric>
    <metric>Benefit_elev_self_eff_high</metric>
    <metric>Benefit_wet_self_eff_low</metric>
    <metric>Benefit_wet_self_eff_medium</metric>
    <metric>Benefit_wet_self_eff_high</metric>
    <metric>Benefit_dry_self_eff_low</metric>
    <metric>Benefit_dry_self_eff_medium</metric>
    <metric>Benefit_dry_self_eff_high</metric>
    <metric>fl_dam_elev_self_eff_low</metric>
    <metric>fl_dam_elev_self_eff_medium</metric>
    <metric>fl_dam_elev_self_eff_high</metric>
    <metric>fl_dam_wet_self_eff_low</metric>
    <metric>fl_dam_wet_self_eff_medium</metric>
    <metric>fl_dam_wet_self_eff_high</metric>
    <metric>fl_dam_dry_self_eff_low</metric>
    <metric>fl_dam_dry_self_eff_medium</metric>
    <metric>fl_dam_dry_self_eff_high</metric>
    <metric>Adapted_elev_soc_net_small</metric>
    <metric>Adapted_elev_soc_net_medium</metric>
    <metric>Adapted_elev_soc_net_large</metric>
    <metric>Adapted_wet_soc_net_small</metric>
    <metric>Adapted_wet_soc_net_medium</metric>
    <metric>Adapted_wet_soc_net_large</metric>
    <metric>Adapted_dry_soc_net_small</metric>
    <metric>Adapted_dry_soc_net_medium</metric>
    <metric>Adapted_dry_soc_net_large</metric>
    <metric>Benefit_elev_soc_net_small</metric>
    <metric>Benefit_elev_soc_net_medium</metric>
    <metric>Benefit_elev_soc_net_large</metric>
    <metric>Benefit_wet_soc_net_small</metric>
    <metric>Benefit_wet_soc_net_medium</metric>
    <metric>Benefit_wet_soc_net_large</metric>
    <metric>Benefit_dry_soc_net_small</metric>
    <metric>Benefit_dry_soc_net_medium</metric>
    <metric>Benefit_dry_soc_net_large</metric>
    <metric>fl_dam_soc_net_small</metric>
    <metric>fl_dam_soc_net_medium</metric>
    <metric>fl_dam_soc_net_large</metric>
    <metric>Adapted_Elev_Income_Low</metric>
    <metric>Adapted_Elev_Income_Medium</metric>
    <metric>Adapted_Elev_Income_High</metric>
    <metric>Adapted_wet_Income_Low</metric>
    <metric>Adapted_wet_Income_Medium</metric>
    <metric>Adapted_wet_Income_High</metric>
    <metric>Adapted_dry_Income_Low</metric>
    <metric>Adapted_dry_Income_Medium</metric>
    <metric>Adapted_dry_Income_High</metric>
    <metric>benefit_Elev_Income_Low</metric>
    <metric>benefit_Elev_Income_Medium</metric>
    <metric>benefit_Elev_Income_High</metric>
    <metric>benefit_wet_Income_Low</metric>
    <metric>benefit_wet_Income_Medium</metric>
    <metric>benefit_wet_Income_High</metric>
    <metric>benefit_dry_Income_Low</metric>
    <metric>benefit_dry_Income_Medium</metric>
    <metric>benefit_dry_Income_High</metric>
    <metric>fl_dam_Income_Low</metric>
    <metric>fl_dam_Income_Medium</metric>
    <metric>fl_dam_Income_High</metric>
    <enumeratedValueSet variable="Quick_Flood_Scenario_Selector">
      <value value="&quot;No flood&quot;"/>
      <value value="&quot;2021_100_RCP8.5&quot;"/>
      <value value="&quot;2021_1000_RCP8.5&quot;"/>
      <value value="&quot;2040_100_RCP8.5&quot;"/>
      <value value="&quot;2040_1000_RCP8.5&quot;"/>
      <value value="&quot;2040_1000_RCP2.6&quot;"/>
      <value value="&quot;2021_100_RCP8.5 + 2040_1000_RCP8.5&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Sensitivity">
      <value value="&quot;No sensitivity&quot;"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="Sensitivity" repetitions="50" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="30"/>
    <metric>Adapted_none</metric>
    <metric>Adapted_elev</metric>
    <metric>Adapted_wet</metric>
    <metric>Adapted_dry</metric>
    <metric>Adapted_elev_wet</metric>
    <metric>Adapted_elev_dry</metric>
    <metric>Adapted_wet_dry</metric>
    <metric>Adapted_all</metric>
    <metric>Adapted_at_least_one</metric>
    <metric>Sum_fl_dam_build</metric>
    <metric>Sum_fl_dam_cont</metric>
    <metric>Benefit_all_elev</metric>
    <metric>Benefit_all_elev_build</metric>
    <metric>Benefit_all_elev_cont</metric>
    <metric>Benefit_all_wet</metric>
    <metric>Benefit_all_wet_build</metric>
    <metric>Benefit_all_wet_cont</metric>
    <metric>Benefit_all_dry</metric>
    <metric>Benefit_all_dry_build</metric>
    <metric>Benefit_all_dry_cont</metric>
    <metric>Cost_all_elev</metric>
    <metric>Cost_all_wet</metric>
    <metric>Cost_all_dry</metric>
    <metric>Total_savings</metric>
    <metric>Cannot_afford</metric>
    <metric>No_Fl_Exp</metric>
    <metric>Very_Low_Fl_Exp</metric>
    <metric>Low_Fl_Exp</metric>
    <metric>Medium_Fl_Exp</metric>
    <metric>High_Fl_Exp</metric>
    <metric>Very_High_Fl_Exp</metric>
    <metric>Adapted_elev_worry_low</metric>
    <metric>Adapted_elev_worry_medium</metric>
    <metric>Adapted_elev_worry_high</metric>
    <metric>Adapted_wet_worry_low</metric>
    <metric>Adapted_wet_worry_medium</metric>
    <metric>Adapted_wet_worry_high</metric>
    <metric>Adapted_dry_worry_low</metric>
    <metric>Adapted_dry_worry_medium</metric>
    <metric>Adapted_dry_worry_high</metric>
    <metric>Benefit_elev_worry_low</metric>
    <metric>Benefit_elev_worry_medium</metric>
    <metric>Benefit_elev_worry_high</metric>
    <metric>Benefit_wet_worry_low</metric>
    <metric>Benefit_wet_worry_medium</metric>
    <metric>Benefit_wet_worry_high</metric>
    <metric>Benefit_dry_worry_low</metric>
    <metric>Benefit_dry_worry_medium</metric>
    <metric>Benefit_dry_worry_high</metric>
    <metric>fl_dam_worry_low</metric>
    <metric>fl_dam_worry_medium</metric>
    <metric>fl_dam_worry_high</metric>
    <metric>Adapted_elev_self_eff_low</metric>
    <metric>Adapted_elev_self_eff_medium</metric>
    <metric>Adapted_elev_self_eff_high</metric>
    <metric>Adapted_wet_self_eff_low</metric>
    <metric>Adapted_wet_self_eff_medium</metric>
    <metric>Adapted_wet_self_eff_high</metric>
    <metric>Adapted_dry_self_eff_low</metric>
    <metric>Adapted_dry_self_eff_medium</metric>
    <metric>Adapted_dry_self_eff_high</metric>
    <metric>Benefit_elev_self_eff_low</metric>
    <metric>Benefit_elev_self_eff_medium</metric>
    <metric>Benefit_elev_self_eff_high</metric>
    <metric>Benefit_wet_self_eff_low</metric>
    <metric>Benefit_wet_self_eff_medium</metric>
    <metric>Benefit_wet_self_eff_high</metric>
    <metric>Benefit_dry_self_eff_low</metric>
    <metric>Benefit_dry_self_eff_medium</metric>
    <metric>Benefit_dry_self_eff_high</metric>
    <metric>fl_dam_elev_self_eff_low</metric>
    <metric>fl_dam_elev_self_eff_medium</metric>
    <metric>fl_dam_elev_self_eff_high</metric>
    <metric>fl_dam_wet_self_eff_low</metric>
    <metric>fl_dam_wet_self_eff_medium</metric>
    <metric>fl_dam_wet_self_eff_high</metric>
    <metric>fl_dam_dry_self_eff_low</metric>
    <metric>fl_dam_dry_self_eff_medium</metric>
    <metric>fl_dam_dry_self_eff_high</metric>
    <metric>Adapted_elev_soc_net_small</metric>
    <metric>Adapted_elev_soc_net_medium</metric>
    <metric>Adapted_elev_soc_net_large</metric>
    <metric>Adapted_wet_soc_net_small</metric>
    <metric>Adapted_wet_soc_net_medium</metric>
    <metric>Adapted_wet_soc_net_large</metric>
    <metric>Adapted_dry_soc_net_small</metric>
    <metric>Adapted_dry_soc_net_medium</metric>
    <metric>Adapted_dry_soc_net_large</metric>
    <metric>Benefit_elev_soc_net_small</metric>
    <metric>Benefit_elev_soc_net_medium</metric>
    <metric>Benefit_elev_soc_net_large</metric>
    <metric>Benefit_wet_soc_net_small</metric>
    <metric>Benefit_wet_soc_net_medium</metric>
    <metric>Benefit_wet_soc_net_large</metric>
    <metric>Benefit_dry_soc_net_small</metric>
    <metric>Benefit_dry_soc_net_medium</metric>
    <metric>Benefit_dry_soc_net_large</metric>
    <metric>fl_dam_soc_net_small</metric>
    <metric>fl_dam_soc_net_medium</metric>
    <metric>fl_dam_soc_net_large</metric>
    <metric>Adapted_Elev_Income_Low</metric>
    <metric>Adapted_Elev_Income_Medium</metric>
    <metric>Adapted_Elev_Income_High</metric>
    <metric>Adapted_wet_Income_Low</metric>
    <metric>Adapted_wet_Income_Medium</metric>
    <metric>Adapted_wet_Income_High</metric>
    <metric>Adapted_dry_Income_Low</metric>
    <metric>Adapted_dry_Income_Medium</metric>
    <metric>Adapted_dry_Income_High</metric>
    <metric>benefit_Elev_Income_Low</metric>
    <metric>benefit_Elev_Income_Medium</metric>
    <metric>benefit_Elev_Income_High</metric>
    <metric>benefit_wet_Income_Low</metric>
    <metric>benefit_wet_Income_Medium</metric>
    <metric>benefit_wet_Income_High</metric>
    <metric>benefit_dry_Income_Low</metric>
    <metric>benefit_dry_Income_Medium</metric>
    <metric>benefit_dry_Income_High</metric>
    <metric>fl_dam_Income_Low</metric>
    <metric>fl_dam_Income_Medium</metric>
    <metric>fl_dam_Income_High</metric>
    <enumeratedValueSet variable="Sensitivity">
      <value value="&quot;No sensitivity&quot;"/>
      <value value="&quot;Foundation Height - 0 m&quot;"/>
      <value value="&quot;Foundation Height - 0.2m&quot;"/>
      <value value="&quot;Depth Damage - Yu et al. (2012)&quot;"/>
      <value value="&quot;Depth Damage - Z. Yin et al. (2011)&quot;"/>
      <value value="&quot;Asset Value - Building Price&quot;"/>
      <value value="&quot;Measure Cost - Fully subsidized&quot;"/>
      <value value="&quot;Measure Cost - Du et al. (2020)&quot;"/>
      <value value="&quot;Measure Effectiveness - Low&quot;"/>
      <value value="&quot;Measure Effectiveness - High&quot;"/>
      <value value="&quot;Measure Effectiveness Level - Low&quot;"/>
      <value value="&quot;Intention Gap - 13.9%&quot;"/>
      <value value="&quot;Intention Gap - 41.7%&quot;"/>
      <value value="&quot;Intention Gap - 100%&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Quick_Flood_Scenario_Selector">
      <value value="&quot;2021_100_RCP8.5 + 2040_1000_RCP8.5&quot;"/>
    </enumeratedValueSet>
  </experiment>
</experiments>
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
