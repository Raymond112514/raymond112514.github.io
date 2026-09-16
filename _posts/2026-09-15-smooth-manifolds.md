---
layout: post
title: Smooth Manifolds
description: Definitions and basic properties of smooth manifolds.
date: 2026-09-15
categories: notes
series: Differential Topology
series_order: 2
related_posts: false
---

So far, we have treated $M$ as a topological object. In order to "do calculus" on $M$, we need to equip it with an additional structure---a smooth structure.

Let $f:M\to\mathbb{R}$ be a real valued function defined on a $n$-dimensional topological manifold. What should it mean for $f$ to be smooth at a point $p\in M$? A natural approach is to choose a coordinate chart $(U,\varphi)$ around $p$ and express $f$ in local coordinates (Figure 1). 

$$\overline{f}_{\varphi}=f\circ\varphi^{-1}:\varphi(U)\subset\mathbb{R}^n\to\mathbb{R}$$

We might then try to define $f$ to be smooth if $\overline{f}_{\varphi}$ is smooth in the Euclidean sense.

{% include figure.liquid path="assets/img/notes/diff_top/smooth_manifolds/f_local_coordinates.svg" class="img-fluid" caption="Figure 1. Expressing a function in local coordinates. The chart $\varphi$ identifies a neighborhood $U$ of $p$ with an open subset of $\mathbb{R}^{n}$. Applying $f$ directly to $p$ gives the same value as applying its coordinate expression $\overline{f}_{\varphi}=f\circ\varphi^{-1}$ to $\varphi(p)$." alt="Expressing a function in local coordinates via a chart" %}

One issue with this definition is that the notion of smoothness now depends on the choice of coordinate chart. For example, consider $M=\mathbb{R}$ and the function $f(x)=x$. Around $0$, we can choose either of the coordinate charts

$$(\mathbb{R},\varphi),\ \varphi(x)=x \qquad (\mathbb{R},\psi),\ \psi(x)=x^3$$

Both are valid topological charts, however, in the first chart, the coordinate expression $\overline{f}\_{\varphi}(x)=f\circ\varphi^{-1}(x)=x$ is smooth, while in the second chart, $\overline{f}\_{\psi}(x)=f\circ\psi^{-1}(x)=\sqrt[3]{x}$ is not.

To resolve this ambiguity, we want the definition of smoothness to be independent of the choice of coordinates. More specifically, suppose $(U,\varphi)$ and $(V,\psi)$ are two coordinate charts around $p$, we would like to ensure that $\overline{f}\_\varphi=f\circ\varphi^{-1}$ is smooth if and only if $\overline{f}\_\psi=f\circ\psi^{-1}$ is smooth. The key observation is that on $\psi(U\cap V)$

$$f\circ\psi^{-1}=(f\circ\varphi^{-1})\circ(\varphi\circ\psi^{-1})$$

Which suggests that, as long as we can ensure that the transition map $\varphi\circ\psi^{-1}$ and its inverse are smooth, smoothness in one coordinate chart is equivalent to smoothness in the other. This motivates the following definition:

**Definition.** Two coordinate charts $(U,\varphi)$ and $(V,\psi)$ on a topological manifold $M$ are said to be smoothly compatible if the transition map $\varphi\circ\psi^{-1}:\psi(U\cap V)\to\varphi(U\cap V)$ is smooth and has a smooth inverse, i.e. it is a diffeomorphism.

{% include figure.liquid path="assets/img/notes/diff_top/smooth_manifolds/transition_map.svg" class="img-fluid" caption="Figure 2. Transition maps between overlapping charts. The purple regions represent $U\cap V$ and its images under $\varphi$ and $\psi$. The map $\varphi\circ\psi^{-1}$ converts $\psi$-coordinates into $\varphi$-coordinates, while its inverse converts back. The charts are smoothly compatible when both transition maps are smooth." alt="Transition maps between overlapping charts" %}

If we now have a collection of charts $\mathcal{A}$ that covers $M$, and any two charts in $\mathcal{A}$ are smoothly compatible, then we call $\mathcal{A}$ a smooth atlas. There is, however, still some arbitrariness in the choice of atlas. Suppose two people are both working with $M=\mathbb{R}^n$, but choose the following two smooth atlases:

$$\mathcal{A}_1=\{(\mathbb{R}^n,\mathrm{Id}_{\mathbb{R}^n})\} \qquad \mathcal{A}_2=\{(\mathbb{R}^n,\mathrm{Id}_{B_1(x)}),\ x\in\mathbb{R}^n\}$$

These atlases are clearly different as collections of charts. Nevertheless, they give exactly the same notion of smoothness (in the sense that if a function $f$ is smooth with respect to one smooth atlas, it is also smooth with respect to the other). It seems undesirable for the smooth structure on $M$ to depend on which particular collection of compatible charts we happened to choose. Instead, given a smooth atlas $\mathcal{A}$, we can enlarge it by adding every chart that is smoothly compatible with all charts already in $\mathcal{A}$. In this way, different atlases that describe the same notion of smoothness are enlarged to the same collection of charts. This leads to the following definition.

**Definition.** A smooth atlas $\mathcal{A}$ on $M$ is called a maximal smooth atlas if every coordinate chart that is smoothly compatible with every chart in $\mathcal{A}$ already belongs to $\mathcal{A}$. We call $\mathcal{A}$ the smooth structure on $M$.

{% theorem %}
**Theorem.** Let $M$ be a topological manifold.

1. Every smooth atlas $\mathcal{A}$ for $M$ is contained in a unique maximal smooth atlas, called the smooth atlas determined by $\mathcal{A}$.
2. Two smooth atlases for $M$ determine the same smooth structure if and only if their union is a smooth atlas.

{% proof %}
{% endproof %}

Remark. Returning to the previous example, the theorem implies that

1. Both $\mathcal{A}\_1$ and $\mathcal{A}\_2$ are contained in unique maximal smooth atlases, say $\overline{\mathcal{A}}\_1$ and $\overline{\mathcal{A}}\_2$.
2. Since $\mathcal{A}\_1\cup\mathcal{A}\_2$ is a smooth atlas, they determine the same smooth structure on $\mathbb{R}^n$. In other words, $\overline{\mathcal{A}}\_1=\overline{\mathcal{A}}\_2$.
3. On the other hand, if we consider

   $$\mathcal{A}_3=\{(\mathbb{R},\varphi)\},\qquad \varphi(x)=x^3$$

   Since $\mathcal{A}\_1$ is not compatible with $\mathcal{A}\_3$, we know that $\mathcal{A}\_1,\mathcal{A}\_2$ determines a smooth structure different from $\mathcal{A}\_3$.
{% endtheorem %}

{% example %}
**Example 1 (Smooth structures of the sphere).** Recall the four charts $(U^\pm,\varphi^\pm)$ and $(V^\pm,\psi^\pm)$ on $S^1$ obtained by projecting the open semicircles onto the coordinate axes. We claim that these charts form a smooth atlas.

Since $U^+\cap U^-=\varnothing$ and $V^+\cap V^-=\varnothing$, we only need to check transitions between a $\varphi$-chart and a $\psi$-chart. For example, on $U^+\cap V^+$, the transition map is

$$\psi^+\circ(\varphi^+)^{-1}(t)=\sqrt{1-t^2},\qquad t\in(0,1)$$

This map and its inverse, which has the same formula, are smooth. The remaining transition maps differ only in signs and domains, so the same argument applies. This shows that the four charts form a smooth atlas on $S^1$.

{% include figure.liquid path="assets/img/notes/diff_top/smooth_manifolds/sphere_transition.svg" class="img-fluid" fig_class="note-figure-sm" caption="Figure 3. The transition on $U^{+}\cap V^{+}$. The chart $\varphi^{+}$ projects $p$ to $t$ on the $x$-axis, while $\psi^{+}$ projects $p$ to the $y$-axis." alt="Transition map between the upper and right semicircle charts on S^1" %}

Another natural way to construct charts on the circle is through stereographic projection. Let $N=(0,1)$. Drawing a line from $N$ through a point of $S^1\setminus{N}$ and finding its intersection with the $x$-axis gives a homeomorphism

$$\sigma_N\setminus{N}\to\mathbb R,\qquad \sigma_N(x,y)=\frac{x}{1-y}$$

With continuous inverse of:

$$\sigma_N^{-1}(t)=\left(\frac{2t}{1+t^2},\frac{t^2-1}{1+t^2}\right)$$

This chart covers every point except $N$. To cover $N$, we add the analogous chart obtained by projecting from the south pole $S=(0,-1)$:

$$\sigma_S\setminus{S}\to\mathbb R,\qquad \sigma_S(x,y)=\frac{x}{1+y}$$

On the overlap, the transition map is

$$\sigma_S\circ\sigma_N^{-1}(t)=\frac1t,\qquad t\in\mathbb R\setminus{\{0\}}$$

This map is smooth and is its own inverse. Thus, the two stereographic charts form a smooth atlas on $S^1$.

{% include figure.liquid path="assets/img/notes/diff_top/smooth_manifolds/sphere_stereo.svg" class="img-fluid" fig_class="note-figure-lg" caption="Figure 4. (a) Stereographic projection from the north pole $N$ maps points on the circle to the $x$-axis. (b) The transition map first sends $t$ back to $p$ via $\sigma_{N}^{-1}$, then projects from the south pole via $\sigma_{S}$, giving $s=\sigma_{S}\circ\sigma_{N}^{-1}(t)=1/t$." alt="Stereographic projection from the north pole and the transition map between stereographic charts" %}

Do these two atlases determine the same smooth structure? To answer this, we need to check that their charts are smoothly compatible. For example, the transitions between $(U^+,\varphi^+)$ and the chart from $N$ are

$$\sigma_N\circ(\varphi^+)^{-1}(t)=\frac{t}{1-\sqrt{1-t^2}},\qquad t\in(-1,0)\cup(0,1)$$

and

$$\varphi^+\circ\sigma_N^{-1}(s)=\frac{2s}{1+s^2},\qquad |s|>1$$

Both are smooth on their domains, and the remaining pairs are checked similarly. Since the union of the two atlases is a smooth atlas, from Theorem 1, they determine the same smooth structure on $S^1$.
{% endexample %}


