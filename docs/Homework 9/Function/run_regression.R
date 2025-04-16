# Now we need to make a function to run the regression

run_regression <- function(summary_df) {
  # I am using the lm function to run the linear model
  model <- lm(SpeciesRichness ~ Abundance, data = summary_df)
  
  # This extracts the summary stats from the model
  model_summary <- summary(model)
  
  # Now I want to grad the specific values I want from the regression
  regression_stats <- data.frame(
    R_squared = model_summary$r.squared,
    Adj_R_squared = model_summary$adj.r.squared,
    F_statistic = model_summary$fstatistic[1],
    p_value = pf(model_summary$fstatistic[1], 
                 model_summary$fstatistic[2], 
                 model_summary$fstatistic[3], 
                 lower.tail = FALSE),
    Intercept = model_summary$coefficients[1, 1],
    Intercept_SE = model_summary$coefficients[1, 2],
    Slope = model_summary$coefficients[2, 1],
    Slope_SE = model_summary$coefficients[2, 2]
  )
  
  return(regression_stats)
}