# Paytm Labs Take-Home Challenge

## Table of Content

- [Part 1 - Machine Learning Foundations](#part-1---machine-learning-foundations)
- [Part 2 - SQL Syntax](#part-2---sql-syntax)
- [Part 3 - Modelling](#part-3---modelling)

## Part 1 - Machine Learning Foundations

**Q:** Can models trained using Random Forests overfit?

**A:** Yes, models trained using Random Forests can certainly overfit. A simple example is if one sets the number of trees to equal 1 and the max depth to be a really large number, then this RF model becomes a single deep decision tree, which is very easy to overfit.

However, by increasing the number of trees in the forest, RF models don't overfit in the traditional sense where after the optimal point, test error will spike up while train error keeps reducing. In this scenario, both RF's train and test errors will decrease until a certain point, then they both plateau.

## Part 2 - SQL Syntax

See solution at [`sql/part_2_sql_syntax.sql`](sql/part_2_sql_syntax.sql)

## Part 3 - Modelling

### 1. Data Visualization

See EDA notebook at [`notebooks/part_3_00_eda.ipynb`](notebooks/part_3_00_eda.ipynb)

### 2. Modelling
