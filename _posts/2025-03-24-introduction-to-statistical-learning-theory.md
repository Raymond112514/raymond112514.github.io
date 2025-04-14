---
layout: post
title: "Empirical Risk Minimization"
date: 2025-03-24
categories: blog
tags: [statistical learning theory]
---

<style>
.post {
  line-height: 2.0;  /* or 1.25 if you prefer */
}

h3, h4, h5, h6 {
  margin-top: 1.5em;
  margin-bottom: 0.8em;
}

h3 + p, h4 + p, h5 + p, h6 + p {
  margin-top: 0.8em;
}
</style>

### Empirical Risk Minimization

In a standard supervised learning setup, we are given two sets $\mathcal{X}$ and $\mathcal{Y}$, and our goal is to learn a function $f \in \mathcal{F}$ that minimizes the expected loss:

$$f^*=\text{argmin}_{f\in \mathcal{F}} \underbrace{\mathbb{E}_{X, Y\sim \mathcal{X}, \mathcal{Y}} [\ell(f(X), Y)]}_{R(f)}$$

Here, $\ell: \mathcal{Y} \times \mathcal{Y} \rightarrow \mathbb{R}$ is the loss function, which measures the error between the prediction $f(X)$ and the true label $Y$. The term $R(f)$ is referred to as the risk of $f$. However, solving this problem in practice presents two main challenges:

1. **Optimization Challenge**: It's difficult to optimize over the space of all functions $\mathcal{F}$ (we typically assume that the functions are measurable, but nonetheless, this is still a large set!).
2. **Evaluation Challenge**: Even evaluating the objective $R(f)$ requires performing an integration over a high-dimensional space, which is computationally difficult, and even impossible in some cases. 

In practice, the first challenge is often addressed by restricting our search to a parameterized family of functions $\lbrace f_\theta : \theta \in \Theta \rbrace$. This allows us to use algorithms like gradient descent to solve for the optimal parameter $\theta^*$. The second challenge, on the other hand, is usually handled through changing the objective: we replace the expectation with a Monte Carlo estimate. This leads to the empirical risk minimization (ERM) problem:

$$\hat{f}=\text{argmin}_{f\in \mathcal{F}} \underbrace{\frac{1}{n}\sum_{i=1}^n \ell(f(X_i), Y_i)}_{\hat{R}_n(f)}$$

Here, $\mathcal{D}=\lbrace (X_i, Y_i) \rbrace _{i \in [n]}$, often called the training set, consisting of i.i.d. samples from the distribution $\mathcal{X} \times \mathcal{Y}$. We call the term $\hat{R}_n(f)$ the empirical risk, which is an approximation of the true risk $R(f)$ using the training data $\mathcal{D}$. <br>

Since $\hat{f}$ is the minimizer of the empirical risk over the training dataset $\mathcal{D}$, we expect $\hat{f}$ to achieve low loss on $\mathcal{D}$. But this is not what we want: we want $\hat{f}$ to achieve low loss (in expectation) over the entire distribution $\mathcal{X}\times \mathcal{Y}$. We can quantify this by measuring the excess risk of $\hat{f}$:

$$\text{Excess}(\hat{f}) = R(\hat{f}) - R(f^*)$$

Which compares the true risk of $\hat{f}$ with the optimal risk achieved by $f^*$. The hope is that, given some function class $\mathcal{F}$, we will be able to upper bound the excess risk. This would give us some insights into the generalization capabilities of function estimators within $\mathcal{F}$.

### Decomposition of Excess Risk

To upper bound the excess risk, we can decompose it into three terms:

$$
\begin{align*}
  R(\hat{f}) - R(f^*) &\leq \underbrace{R(\hat{f}) - \hat{R}_n(\hat{f})}_{(1)} + \underbrace{\hat{R}_n(\hat{f}) - \hat{R}_n(f)}_{(2)} + \underbrace{\hat{R}_n(f) - R(f^*)}_{(3)}\\
  &\leq 2\sup_{f\in \mathcal{F}}|\hat{R}_n(f)-R(f)|
\end{align*}
$$

Where in the second inequality, we used the fact that $(2)$ is always non-positive and applied a uniform bound on $(1)$ and $(3)$. Even though we can bound $(3)$ using standard concentration inequalities, $(1)$ cannot be bounded this way since the i.i.d. assumption that is usually required for concentration inequality is not satisfied. This uniform bound essentially removes the statistical dependence between $\hat{R}_n$ and $\hat{f}$. <br>

In the upcoming blogs, we will show that in general, the excess risk controlled by the "complexity" of the function class

$$R(\hat{f}) - R(f^*) \leq O\bigg(\frac{\text{Complexity}(\mathcal{F})}{\sqrt{n}}\bigg)$$

Some examples of complexity measure includes the cardinality of $\mathcal{F}$ (in the case when $\mathcal{F}$ is finite set) or the dimension of $\mathcal{F}$. Instead of focusing on the empirical risk minimization problem, we will prove this by considering the more general problem—by defining the true risk and the empirical risk as follows:

$$R(f)=\mathbb{E}_{X}[f(X)] \hspace{20mm} \hat{R}_n(f)=\frac{1}{n}\sum_{i=1}^n [f(X_i)]$$

This will give us a bound on the empirical risk minimization problem if we define $f$ to be the loss function term. In terms of notation, we define:

$$\|\mathbb{P}_n - \mathbb{P}\|_{\mathcal{F}} = \sup_{f\in \mathcal{F}} |\hat{R}_n(f)- R(f)|$$

Which is a random variable since it depends on the data $X_{1:n}$. 
