---
layout: post
title: "Introduction to Statistical Learning Theory"
date: 2025-03-24
categories: blog
tags: [optimization]
---

<style>
.post {
  line-height: 2.0;  /* or 1.25 if you prefer */
}
</style>

This blog series is meant to serve as my course notes for STAT 210B.

### Empirical Risk Minimization

In a standard supervised learning setup, we are given two spaces, $\mathcal{X}$ and $\mathcal{Y}$, and the goal is to learn a function $f \in \mathcal{F}$ that predicts $Y \in \mathcal{Y}$ given $X \in \mathcal{X}$. This is typically done by solving the following optimization problem:

$$f^*=\text{argmin}_{f\in \mathcal{F}} \underbrace{\mathbb{E}_{X, Y\sim \mathcal{X}, \mathcal{Y}} [\ell(f(X), Y)]}_{R(f)}$$

Here, $\ell: \mathcal{Y} \times \mathcal{Y} \rightarrow \mathbb{R}$ is the loss function, which measures the error between the prediction $f(X)$ and the true label $Y$. The term $R(f)$ is referred to as the risk of $f$. In simpler terms, the goal is to find a function that minimizes the average prediction error over the distribution $\mathcal{X}\times\mathcal{Y}$. However, solving this problem in practice presents two main challenges:

1. **Optimization Challenge**: It's difficult to optimize over the space of all measurable functions $\mathcal{F}$.
2. **Evaluation Challenge**: Even evaluating the objective $R(f)$ requires performing an integration over a high-dimensional space, which is computationally challenging.

The first challenge is often addressed by restricting our search to a parameterized family of functions $\{f_\theta : \theta \in \Theta\}$. This allows us to use optimization algorithms like gradient descent to find the optimal parameters $\theta^*$. The second challenge is trickier: Instead of directly optimizing the expectation, we approximate it using sample averages. This approach leads to the empirical risk minimization problem:

$$\hat{f}=\text{argmin}_{f\in \mathcal{F}} \underbrace{\frac{1}{n}\sum_{i=1}^n \ell(f(X_i), Y_i)}_{\hat{R}_n(f)}$$

Here, $\mathcal{D}={(X_i, Y_i)}_{i \in [n]}$, often called the training set, consists of i.i.d. samples from the distribution $\mathcal{X} \times \mathcal{Y}$. The term $\hat{R}_n(f)$ is the empirical risk, which is an approximation of the true risk $R(f)$ using the training data. <br>

Since $\hat{f}$ is the minimizer of the empirical risk over the training dataset $\mathcal{D}$, we expect $\hat{f}$ to achieve low loss on $\mathcal{D}$. But this is not what we want: We want $\hat{f}$ to achieve low loss (in expectation) over the entire distribution $\mathcal{X}\times \mathcal{Y}$. We can quantify this by measuring the excess risk of $\hat{f}$:

$$\text{Excess}(\hat{f}) = R(\hat{f}) - R(f^*)$$

In other words, we compare the true risk of $\hat{f}$ with the optimal risk achieved by $f^*$. The hope is that, given some function class $\mathcal{F}$, we will be able to upper bound the excess risk, providing insights into the generalization capabilities of function estimators within $\mathcal{F}$.

### Decomposition of Excess Risk

To upper bound the excess risk, we can decompose it into three terms:

$$R(\hat{f}) - R(f^*) = \underbrace{R(\hat{f}) - \hat{R}_n(\hat{f})}_{(1)} + \underbrace{\hat{R}_n(\hat{f}) - \hat{R}_n(f)}_{(2)} + \underbrace{\hat{R}_n(f) - R(f^*)}_{(3)}$$

Since $\hat{f}$ is the minimizer of the empirical risk $\hat{R}_n$, the second term is non-positive. Therefore, our task reduces to bounding the first and third terms.
* The third term can usually be bounded using concentration inequalities.
* The first term, however, is more problematic since the i.i.d. assumption required for applying concentration inequalities is violated.
Despite this, we proceed by applying a uniform bound:

$$
\begin{align*}
  R(\hat{f}) - R(f^*) &\leq \underbrace{R(\hat{f}) - \hat{R}_n(\hat{f})}_{(1)} + \underbrace{\hat{R}_n(f) - R(f^*)}_{(3)}\\
  &\leq 2\sup_{f\in \mathcal{F}}|\hat{R}_n(f)-R(f)|
\end{align*}
$$

We will discuss methods for bounding this uniform bound in the upcoming blog posts!
