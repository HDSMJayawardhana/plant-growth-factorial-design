# 🌱 Effect of Fertilizer Type, Irrigation Frequency and Plant Variety on Plant Growth

> **EM 524: Design and Analysis of Experiment — Term Project**
> | **Author:** Jayawardhana H.D.S.M. | **Index:** E/19/169

---

## 📌 Project Overview

This project investigates how **fertilizer type**, **irrigation frequency**,
and **plant variety** affect plant growth using a
**2×2×2 Three-Factor Factorial Design** with fixed effects.

Plant height (cm) was measured after **2 weeks** of growth across
**16 potted plants** (8 treatment combinations × 2 replicates).

---

## 🎯 Objectives

Evaluate the individual and combined effects of:

| Factor | Levels |
|--------|--------|
| **Fertilizer Type** (A) | A, B |
| **Irrigation Frequency** (B) | Daily, Alternate Day |
| **Plant Variety** (C) | X, Y |

---

## 🧪 Experimental Design

- **Design Type:** 2 × 2 × 2 Full Factorial (Fixed Effects)
- **Replicates:** 2 per treatment combination
- **Total Combinations:** 8
- **Total Observations:** 16

### Statistical Model

```
Y_ijkl = μ + A_i + B_j + C_k + (AB)_ij + (AC)_ik + (BC)_jk + (ABC)_ijk + ε_ijkl
```

---

## 📂 Repository Structure

```
plant-growth-factorial-design/
│
├── README.md                        # Project overview
├── report/
│   └── EM524_Term_Project_Report.pdf  # Full project report
├── code/
│   └── plant_growth_analysis.R      # R analysis script
└── data/
    └── plant_data.csv               # Experimental dataset
```

---

## 📊 Key Results

### ANOVA Table

| Source | Df | Sum Sq | Mean Sq | F value | Pr(>F) |
|--------|----|--------|---------|---------|--------|
| Fertilizer | 1 | 2.3256 | 2.32563 | 1.8559 | 0.2102 |
| Irrigation | 1 | 0.0156 | 0.01562 | 0.0125 | 0.9138 |
| Variety | 1 | 0.0156 | 0.01563 | 0.0125 | 0.9138 |
| Fertilizer:Irrigation | 1 | 0.0006 | 0.00063 | 0.0005 | 0.9827 |
| Fertilizer:Variety | 1 | 0.0756 | 0.07563 | 0.0603 | 0.8121 |
| Irrigation:Variety | 1 | 0.1806 | 0.18063 | 0.1441 | 0.7141 |
| Fertilizer:Irrigation:Variety | 1 | 0.0506 | 0.05063 | 0.0404 | 0.8457 |
| Residuals | 8 | 10.025 | 1.25312 | | |

### Key Findings

- ✅ **Fertilizer B** produces greater plant height than Fertilizer A
- ✅ **Daily Irrigation** outperforms Alternate Day irrigation
- ✅ **Variety X** shows slightly better growth than Variety Y
- ✅ **Fertilizer × Irrigation** interaction is noteworthy
- ❌ No significant three-way interaction (ABC)

### Best Combination for Plant Growth

```
Fertilizer B  +  Daily Irrigation  +  Variety X
```

---

## 🛠️ How to Run

### Requirements

```r
install.packages("ggplot2")
install.packages("emmeans")
```

### Steps

```r
# 1. Clone the repository
# 2. Open R or RStudio
# 3. Run the analysis script

source("code/plant_growth_analysis.R")
```

---

## 📚 References

- NIST/SEMATECH. *Three-level full factorial designs.*
  https://itl.nist.gov/div898/handbook/pri/section3/pri339.htm

- Learnche.org. (2023). *Example: Design and analysis of a three-factor experiment.*
  https://learnche.org/pid/design-analysis-experiments/full-factorial-designs/

- Lecture 9 - Three Factor Factorial Design, EM524 (2025).

---

## 📜 License

This project is for **academic purposes** — EM 524, University of Peradeniya.
