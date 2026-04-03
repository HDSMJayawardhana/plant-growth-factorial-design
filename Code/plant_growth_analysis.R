# ============================================================
# EM 524: Design and Analysis of Experiment - Term Project
# Effect of Fertilizer Type, Irrigation Frequency and
# Plant Variety on Plant Growth
# Author: Jayawardhana H.D.S.M. | E/19/169
# ============================================================

# Load necessary packages
library(ggplot2)
library(emmeans)

# ============================================================
# DATA CREATION
# ============================================================

fertilizer  <- factor(rep(c("A", "B"), each = 8))
irrigation  <- factor(rep(c("Daily", "Alternate"), times = 4, each = 2))
variety     <- factor(rep(c("X", "Y"), times = 8))
replicate   <- rep(1:2, times = 8)
height      <- c(6.3, 6.8, 7.0, 6.7, 5.2, 5.5, 5.0, 4.8,
                 7.5, 7.1, 7.7, 7.4, 6.0, 6.2, 5.9, 5.6)

# Create data frame
plants <- data.frame(fertilizer, irrigation, variety, replicate, height)

# View the dataset
print(plants)

# ============================================================
# THREE-FACTOR FACTORIAL MODEL (Fixed Effects)
# Model: Y_ijkl = mu + A_i + B_j + C_k + AB_ij + AC_ik +
#                 BC_jk + ABC_ijk + epsilon_ijkl
# ============================================================

# Fit the model
model <- aov(height ~ fertilizer * irrigation * variety, data = plants)

# Model summary
summary(model)

# ============================================================
# ANOVA TABLE
# ============================================================

cat("\n===== ANOVA TABLE =====\n")
anova(model)

# ============================================================
# INTERACTION PLOT
# ============================================================

interaction.plot(
  plants$fertilizer,
  plants$irrigation,
  plants$height,
  col   = c("red", "blue"),
  trace.label = "Irrigation",
  xlab  = "Fertilizer Type",
  ylab  = "Mean Plant Height (cm)",
  main  = "Interaction Plot: Fertilizer × Irrigation"
)

# ============================================================
# PAIRWISE COMPARISONS (Tukey Method)
# ============================================================

cat("\n===== PAIRWISE COMPARISONS =====\n")
emmeans(model, pairwise ~ fertilizer * irrigation * variety)

# ============================================================
# ADDITIONAL PLOTS USING ggplot2
# ============================================================

# Boxplot - Fertilizer Effect
ggplot(plants, aes(x = fertilizer, y = height, fill = fertilizer)) +
  geom_boxplot() +
  labs(
    title = "Plant Height by Fertilizer Type",
    x     = "Fertilizer",
    y     = "Height (cm)"
  ) +
  theme_minimal()

# Boxplot - Irrigation Effect
ggplot(plants, aes(x = irrigation, y = height, fill = irrigation)) +
  geom_boxplot() +
  labs(
    title = "Plant Height by Irrigation Frequency",
    x     = "Irrigation",
    y     = "Height (cm)"
  ) +
  theme_minimal()

# Boxplot - Variety Effect
ggplot(plants, aes(x = variety, y = height, fill = variety)) +
  geom_boxplot() +
  labs(
    title = "Plant Height by Plant Variety",
    x     = "Variety",
    y     = "Height (cm)"
  ) +
  theme_minimal()

# Faceted plot - All factors
ggplot(plants, aes(x = fertilizer, y = height,
                   color = irrigation, shape = variety)) +
  geom_point(size = 3) +
  facet_grid(variety ~ irrigation) +
  labs(
    title = "Plant Height across All Factor Combinations",
    x     = "Fertilizer Type",
    y     = "Height (cm)"
  ) +
  theme_bw()

# ============================================================
# RESIDUAL DIAGNOSTICS
# ============================================================

par(mfrow = c(2, 2))
plot(model)
par(mfrow = c(1, 1))
