---
layout: post
title: "Introduction to Nonlinear Optimization"
date: 2025-03-24
categories: blog
tags: [optimization]
---

<style>
.post {
  line-height: 2.0;  /* or 1.25 if you prefer */
}
</style>

### Problem Setup

The problem setup for optimization problem is quite simple: given a function $f:\mathbb{R}^n\rightarrow \mathbb{R}$ and some constrained set $C$, we want to solve:

$$\min_{x\in C}f(x)$$

For the first few blogs, we will consider the simple case where $C=\mathbb{R}^n$. In this case, the problem is an unconstrained optimization problem. Generally speaking, we require $f$ to have continuous derivative up to second order. In some algorithms, though, only continuity up to first order is needed. We also assume that $f$ is in general nonconvex.

### Preliminaries

We first state some basic results that will be used later. One of the most important ones is Taylor's theorem, on a high level, it tells us that we can approximate $f$ with some degree $n$ polynomial with high order error term. <br>

**Theorem (Taylor)**: Suppose $f:\mathbb{R}^n\rightarrow \mathbb{R}$ has continuous derivate up to order $2$, then for all $x,p\in \mathbb{R}^n$, there exists $t\in (0,1)$ such that

$$f(x+p)=f(x)+\nabla f(x+tp)^T p$$

$$f(x+p)=f(x)+\nabla f(x)^Tp + \frac{1}{2}p^T\nabla^2 f(x+tp)p$$

### Descent Method: Recipe

One common algorithm used to solve optimization problem is descent method. On a high level,descent method works iteratively, starting with some randomly chosen point $x_0$, and then updates the estimate gradually, most commonly through updates of the form

$$x_{k+1}=x_k+\alpha_k p_k$$

Where $p_k$ is the direction to step to and $\alpha_k$ controls the step size. This gives us a sequence $\{x_k\}$ and we terminate until a local minima is found. Broadly speaking, we choose $p_k$ to be a descent direction (i.e. moving in this direction reduces the function value).  

