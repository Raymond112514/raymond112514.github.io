---
layout: post
title: Topological Manifolds
description: Definitions and basic properties of topological manifolds.
date: 2026-09-03
categories: notes
series: Differential Topology
series_order: 1
related_posts: false
---

A topological manifold is a space that, near each point, looks like Euclidean space $\mathbb{R}^n$. For example, the curve in Figure~* is a one-dimensional topological manifold--if we focus on a small piece around any point, we can imagine straightening it out into a piece of the real line. 

Formally, we say that $M$ is a topological manifold if 
1. $M$ is Hausdorff
2. $M$ is second countable
3. For every point $p\in M$, there exists an open neighborhood $U$ of $p$ and a homeomorphism $\varphi:U\to V\underset{\mathrm{open}}{\subseteq}\mathbb{R}^n$

The pair $(U,\varphi)$ is called a coordinate chart around $p$. It assigns each point $q\in U$ local coordinates 

$$\varphi(q)=(x_1(q),\ldots,x_n(q))\in\mathbb{R}^n$$

{% example %}
**Example 1 (Euclidean Space).** Euclidean space $\mathbb{R}^n$ is a $n$-dimensional topological manifold. It is Hausdorff and second countable, and the identity map $\varphi=\mathrm{id}:\mathbb{R}^n\to\mathbb{R}^n$ gives a coordinate chart covering the entire space.
{% endexample %}

{% example %}
**Example 2 (Sphere).** The circle $S^1$, with the subspace topology inherited from $\mathbb{R}^2$, is a one-dimensional topological manifold.
1. $S^1$ is Hausdorff because it is a subspace of the Hausdorff space $\mathbb{R}^2$.
2. $S^1$ is second countable because it is a subspace of the second-countable space $\mathbb{R}^2$.
3. We construct coordinate charts covering every point of $S^1$. Start with the open upper semicircle:

   $$U^+=\{(x,y)\in S^1:y>0\}$$

   We can use the projection onto the $x$-axis as our coordinate map:

   $$\varphi^+:U^+\to(-1,1),\qquad \varphi^+(x,y)=x$$

   This map is continuous, with continuous inverse

   $$(\varphi^+)^{-1}(t)=(t,\sqrt{1-t^2})$$
   
   Therefore, $(U^+,\varphi^+)$ is a coordinate chart around every point in the upper semicircle. We can apply the same construction to the lower semicircle to obtain a chart $(U^-,\varphi^-)$. These two charts cover everything except $(1,0)$ and $(-1,0)$. To cover these remaining points, we add charts on the open right and left semicircles, denoted by $V^+$ and $V^-$, projecting onto the $y$-axis instead. Together, the charts $(U^+,\varphi^+)$, $(U^-,\varphi^-)$, $(V^+,\psi^+)$, and $(V^-,\psi^-)$ cover the whole circle, showing that every point has an open neighborhood homeomorphic to an open interval in $\mathbb{R}$.

Remark: We can apply the same argument to show that $n$-dimensional sphere $S^n$ is a topological manifold. 
{% endexample %}

{% example %}
**Example 3 (Projective Space).** The $n$-dimensional real projective space $\mathbb{RP}^n$ is the set of one-dimensional subspaces of $\mathbb{R}^{n+1}$. On $\mathbb{R}^{n+1}\setminus\{0\}$, define $x\sim y$ if $x=\lambda y$ for some nonzero scalar $\lambda$. Then
$$\mathbb{RP}^n=(\mathbb{R}^{n+1}\setminus\{0\})/{\sim},$$
equipped with the quotient topology.

We claim that $\mathbb{RP}^n$ is an $n$-dimensional topological manifold. Write $q(x)=[x]$ for the quotient map. This map is open because, for every open set $U$,
$$q^{-1}(q(U))=\bigcup_{\lambda\neq0}\lambda U$$
is open.

1. $\mathbb{RP}^n$ is Hausdorff. Given distinct points $[x]$ and $[y]$, choose unit representatives $x,y$. Choose disjoint open neighborhoods $A,B\subseteq S^n$ of $\{x,-x\}$ and $\{y,-y\}$, respectively, each invariant under the antipodal map. Their cones

   $$C_A=\{tu:t>0,\ u\in A\},\qquad C_B=\{tu:t>0,\ u\in B\}$$

   are disjoint, open, and invariant under nonzero scaling. Hence $q(C_A)$ and $q(C_B)$ are disjoint open neighborhoods of $[x]$ and $[y]$.

2. $\mathbb{RP}^n$ is second countable. Let $\{B\_k\}\_{k\in\mathbb{N}}$ be a countable basis for $\mathbb{R}^{n+1}\setminus\{0\}$. Since $q$ is continuous, open, and surjective, $\{q(B\_k)\}\_{k\in\mathbb{N}}$ is a countable basis for $\mathbb{RP}^n$.

3. We now construct a chart for each point in $\mathbb{RP}^n$. For each $i=0,\ldots,n$, let

   $$U_i=\{[x_0:\cdots:x_n]:x_i\neq0\}$$

   These sets are open and cover $\mathbb{RP}^n$. Define

   $$\varphi_i:U_i\to\mathbb{R}^n,\qquad \varphi_i([x_0:\cdots:x_n])=\left(\frac{x_0}{x_i},\ldots,\widehat{\frac{x_i}{x_i}},\ldots,\frac{x_n}{x_i}\right)$$

   where the hat denotes omission. This map is well-defined and continuous by the quotient topology, and its continuous inverse inserts $1$ in the $i$-th coordinate:

   $$\varphi_i^{-1}(u_1,\ldots,u_n)=[u_1:\cdots:u_i:1:u_{i+1}:\cdots:u_n]$$

   Thus each $U_i$ is homeomorphic to $\mathbb{R}^n$.

{% endexample %}


