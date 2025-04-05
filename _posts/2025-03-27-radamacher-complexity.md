---
layout: post
title: "Radamacher Complexity"
date: 2025-03-24
categories: blog
tags: [optimization]
---

<style>
.post {
  line-height: 2.0;  /* or 1.25 if you prefer */
}

details {
  background-color: #fff0f9;
  padding: 1em;
  margin: 1em 0;
  border-radius: 4px;
}

details summary {
  cursor: pointer;
  font-weight: normal;
  color: #9c27b0;
  list-style: none;
}

details summary::before {
  content: "▼";
  color: #9c27b0;
  margin-right: 8px;
}

details[open] summary::before {
  content: "▼";
}

details:not([open]) summary::before {
  content: "▶";
}

details code {
  background-color: #fff0f9;
  padding: 2px 4px;
  border-radius: 3px;
}
</style>

Note: Still in progress

### Bounding the Excess Risk

Recall that the excess risk of the function class $\mathcal{F}$ can be bounded as follows

$$
\begin{align*}
  R(\hat{f}) - R(f^*) &\leq  2\cdot \underbrace{\sup_{f\in \mathcal{F}}\lvert\hat{R}_n(f)-R(f)\rvert}_{\|\mathbb{P}_n-\mathbb{P}\|_{\mathcal{F}}}
\end{align*}
$$

To bound the excess risk, it suffices to control ${\left\lVert\mathbb{P}_n-\mathbb{P}\right\rVert} _{\mathcal{F}}$. We claim that if the function class $\mathcal{F}$ is $b$-uniformly bounded, then ${\left\lVert\mathbb{P}_n-\mathbb{P}\right\rVert} _{\mathcal{F}}$ is sharply concentrated around its mean. We will establish this using McDiarmid's inequality by showing ${\left\lVert\mathbb{P}_n-\mathbb{P}\right\rVert} _{\mathcal{F}}$ satisfies the bounded differences property. <br>

{% details McDiarmid's inequality %}

We say that $f:\mathbb{R}^n \rightarrow \mathbb{R}$ satisfy bounded difference property if there are constants $c_i\in \mathbb{R}$ such that

$$|f(x_1, x_2, ..., x_i, ..., x_n) - f(x_1, x_2, ..., x_i', ..., x_n)| \leq c_i$$

For all $x_1, x_2,..., x_n$ and $x_i'$. If $f$ satisfies bounded difference property, then for any independent random variables $X_1, X_2,..., X_n$, we have

$$\mathbb{P}[|f(X_1, X_2,..., X_n) - \mathbb{E}[f(X_1, X_2,..., X_n)]|\geq \epsilon] \leq \exp\bigg(-\frac{2\epsilon^2}{\sum_{i=1}^n c_i^2}\bigg)$$

{% enddetails %}

To prove this, fix the samples and define:

$$h(x_1, x_2,..., x_n) = \lvert\hat{R}_n(f)-R(f)\rvert = \bigg|\frac{1}{n}\sum_{i=1}^n f(x_i) - \mathbb{E}[f(X)]\bigg|$$

Now, consider perturbing only the first sample coordinate from $x_1$ to $x_1'$. We have:

$$
\begin{align*}
    h(x_1, x_2,..., x_n) - \sup_{f\in \mathcal{F}} h(x_1', x_2,..., x_n) &\leq h(x_1, x_2,..., x_n) - h(x_1', x_2,..., x_n)\\
    &\leq \frac{1}{n}|f(x_1)-f(x_1')|\leq \frac{2b}{n}
\end{align*}
$$

Here, the second inequality follows from the reverse triangle inequality. Taking the supremum over all $f\in \mathcal{F}$, we conclude that ${\left\lVert\mathbb{P}_n-\mathbb{P}\right\rVert} _{\mathcal{F}}$ indeed satisfies a bounded difference condition with bound $2b/n$. Applying McDiarmid's inequality, we obtain the tail bound:

$$\|\mathbb{P}_n-\mathbb{P}\|_{\mathcal{F}} \leq \mathbb{E}[\|\mathbb{P}_n-\mathbb{P}\|_{\mathcal{F}}] + \delta \hspace{8mm}\text{with probability}\;1-\exp(-\frac{nt^2}{2b^2})$$

This suggests that if we can obtain a bound on the expectation, we can achieve a probabilistic upper bound for the excess risk. 

### Radamacher Complexity

In this section, we will show that the expectation is closely related to a measure of the "size" or "complexity" of the function class. We first use a technique called **symmetrization** to bound the expectation. Let 

$$\{Y_i\}_{i \in [n]}$$ 

be another sequence of i.i.d. random variables sampled from $\mathcal{X}$. Then

$$
\begin{align*}
    \mathbb{E}[\|\mathbb{P}_n - \mathbb{P}\|_{\mathcal{F}}] &= \mathbb{E}_X\left[\sup_{f \in \mathcal{F}}\left|\frac{1}{n}\sum_{i=1}^n \Big(f(X_i) - \mathbb{E}[f(X)]\Big)\right|\right] \\
    &= \mathbb{E}_X\left[\sup_{f \in \mathcal{F}}\left|\frac{1}{n}\sum_{i=1}^n \Big(f(X_i) - \mathbb{E}[f(Y_i)]\Big)\right|\right] \\
    &\leq \mathbb{E}_{X, Y}\left[\sup_{f \in \mathcal{F}}\left|\frac{1}{n}\sum_{i=1}^n \Big(f(X_i) - f(Y_i)\Big)\right|\right]
\end{align*}
$$

Next, let $\epsilon_i$ be i.i.d. Rademacher random variables. Note that $f(X_i)-f(Y_i)$ has the same distribution as $\epsilon_i\bigl(f(X_i)-f(Y_i)\bigr)$. Therefore,

$$
\begin{align*}
    \mathbb{E}[\|\mathbb{P}_n - \mathbb{P}\|_{\mathcal{F}}] &\leq \mathbb{E}_{X, Y, \epsilon}\left[\sup_{f \in \mathcal{F}}\left|\frac{1}{n}\sum_{i=1}^n \epsilon_i\bigl(f(X_i) - f(Y_i)\bigr)\right|\right] \\
    &\leq 2\,\mathbb{E}\left[\sup_{f \in \mathcal{F}}\left|\frac{1}{n}\sum_{i=1}^n \epsilon_i f(X_i)\right|\right]
\end{align*}
$$

We call the quantity

$$
\mathcal{R}_n(\mathcal{F}) = \mathbb{E}_{X, \epsilon}\left[\sup_{f \in \mathcal{F}}\left|\frac{1}{n}\sum_{i=1}^n \epsilon_i f(X_i)\right|\right]
$$

the Rademacher complexity of the function class. It can be thought of as a measure of the size of the function class. We can interpret the Rademacher complexity as follows: suppose we are given a sample $\lbrace X_i \rbrace _{i \in [n]}$, and for each sample we assign a label $\epsilon_i \in \lbrace \pm 1 \rbrace$ by flipping a fair coin. For any function $f \in \mathcal{F}$, we can measure how well it fits the random data by evaluating the inner product

$$
\text{success rate} = \frac{1}{n}\sum_{i=1}^n \epsilon_i f(X_i),
$$

which reflects whether $f$ outputs the same sign as the random label. A high Rademacher complexity implies that, given any dataset $\lbrace X_i\rbrace _{i \in [n]}$ and random labels $\lbrace \epsilon_i \rbrace _{i \in [n]}$, we can always find a function $f \in \mathcal{F}$ with a high success rate—that is, one that is effective at interpolating the data. Naturally, a function class with limited representation power (e.g., the set of all linear functions) should have lower Rademacher complexity than function classes with rich representation power (such as neural networks).

What we've shown is that the excess risk is essentially controlled by the representation power of the function class, which makes sense since a smaller function class is less likely to interpolate or overfit the data and should generalize better.

### Bounding the Radamacher complexity 

There are several techniques available to control the Rademacher complexity of a function class. In some cases, it's possible to obtain bounds using standard inequalities such as Cauchy-Schwarz or Jensen's inequality. More generally, we rely on structural properties of the function class to derive meaningful bounds.To proceed, we define the set of possible function value vectors on a sample:

$$\mathcal{F}(x_{1:n}) = \{(f(x_1), f(x_2), \ldots, f(x_n)) \mid f \in \mathcal{F}\}$$

And we define $\lvert \mathcal{F}\rvert$ to be size of largest possible set, namely

$$|\mathcal{F}|= |\sup_{x_{1:n}} \mathcal{F}(x_{1:n})|$$

The size or structure of this set plays a key role in controlling the complexity. Below, we summarize some common approaches depending on whether $\mathcal{F}(x_{1:n})$ is finite or infinite:

- If $\lvert\mathcal{F}(x_{1:n})\rvert < \infty$ 
  - Use **maximal inequalities** to directly bound the complexity.
  - Apply combinatorial tools like the **VC dimension** to relate the richness of $\mathcal{F}$ to generalization guarantees.

- If $\lvert\mathcal{F}(x_{1:n})\rvert = \infty$
  - Use **metric entropy methods**, such as covering numbers or chaining arguments, to quantify the effective complexity of the function class.

#### Maximal Inequality Bounds

When $\lvert\mathcal{F}(x_{1:n})\rvert < \infty$, we can control the Rademacher complexity using maximal inequality. Let's start with the definition:

$$\mathcal{R}_n(\mathcal{F}) = \mathbb{E}_{X, \epsilon}\left[\sup_{f \in \mathcal{F}} \left|\frac{1}{n}\sum_{i=1}^n \epsilon_i f(X_i)\right|\right]$$

We can rewrite the inner product in terms of the function value vectors:

$$= \mathbb{E}_X\left[\mathbb{E}_\epsilon\left[\sup_{v \in \mathcal{F}(X_{1:n})} \left|\frac{1}{n} \langle v, \epsilon \rangle\right| \,\bigg|\, X_{1:n}\right]\right]$$

Here, each $\langle v, \epsilon \rangle / n$ is a sum of independent Rademacher variables, and thus is sub-Gaussian. The sub-Gaussian parameter is given by:

$$\sigma_n = \sup_{v \in \mathcal{F}(X_{1:n})} \frac{1}{n} \|v\|_2 = \sup_{f \in \mathcal{F}} \frac{1}{n} \sqrt{\sum_{i=1}^n f(X_i)^2}$$

Applying maximal inequality, we see that the conditional expectation is bounded by:

$$
\mathbb{E}_\epsilon\left[\sup_{v \in \mathcal{F}(X_{1:n})} \left|\frac{1}{n} \langle v, \epsilon \rangle\right| \,\bigg|\, X_{1:n}\right] \leq \sigma_n \sqrt{2\log \big(2|\mathcal{F}(X_{1:n})|\big)}
$$

Taking expectation over $X$, we have:

$$
\begin{align*}
\mathcal{R}_n(\mathcal{F}) &\leq \mathbb{E}_X\left[\sqrt{\frac{1}{n} \sum_{i=1}^n f(X_i)^2} \cdot \sqrt{\frac{2 \log \big(2|\mathcal{F}(X_{1:n})|\big)}{n}}\right]\\
&\leq \mathbb{E}_X\left[\sqrt{\frac{1}{n} \sum_{i=1}^n f(X_i)^2}\right] \cdot \sqrt{\frac{2 \log \big(2|\mathcal{F}|\big)}{n}}\\
&\lesssim \sqrt{\frac{2\log \big(2|\mathcal{F}|\big)}{n}}
\end{align*}
$$



