---
layout: about
title: About
permalink: /
subtitle: <a href="mailto:r112358@berkeley.edu">Email</a>&nbsp;&middot;&nbsp;<a href="https://github.com/raymond112514">GitHub</a>&nbsp;&middot;&nbsp;<a href="https://www.linkedin.com/in/r112514">LinkedIn</a>&nbsp;&middot;&nbsp;<a href="/assets/pdf/Raymond_Resume.pdf">CV</a>

profile:
  align: right
  image: Raymond-Tsao.png
  image_circular: false
  scale: 0.55 # 1.0 is the default size; smaller than 1 shrinks the photo
  offset_y: 30 # pixels to shift the photo up
  gap_x: 24 # pixels between the photo and the text to its left

selected_papers: false # includes a list of papers marked as "selected={true}"
social: false # includes social icons at the bottom of the page

announcements:
  enabled: false # includes a list of news items
  scrollable: false # adds a vertical scroll bar if there are more than 3 news items
  limit: 5 # leave blank to include all the news in the `_news` folder

latest_posts:
  enabled: false
  scrollable: false # adds a vertical scroll bar if there are more than 3 new posts items
  limit: 3 # leave blank to include all the blog posts
---

<style>
.post-title {
  text-transform: capitalize;
}

.post {
  line-height: 2.0;  /* or 1.25 if you prefer */
}

.publications .title a {
  color: var(--global-theme-color);
}

.research-links a {
  color: var(--global-theme-color);
}

.research-tldr,
.research-tldr-label,
.research-tldr-body {
  font-weight: 400 !important;
}

.research-tldr {
  display: inline;
  line-height: 1.5;
}

.research-tldr-toggle {
  position: absolute;
  opacity: 0;
  pointer-events: none;
}

.research-tldr-label {
  cursor: pointer;
  color: var(--global-theme-color);
  font-weight: 400;
}

.research-tldr-body {
  display: none;
  font-weight: 400;
  margin-top: 0.4rem;
}

.research-tldr-toggle:checked ~ .research-tldr-body {
  display: block;
}

.publications ol.bibliography li .abbr {
  margin-bottom: 0;
  display: flex;
  align-items: center;
}

.publications {
  margin-top: 0;
}

.research-heading {
  margin-top: 2rem; /* space above Research */
}

.publications-heading {
  margin-top: 2rem; /* space above Publications */
}

.research-intro ul {
  margin-bottom: 0;
}

.research-venue-highlight {
  color: var(--global-highlight-color, #00369f);
}

.post-header .desc a {
  color: var(--global-theme-color);
}
</style>

Hi! I’m Raymond, a fifth-year master’s student at UC Berkeley studying computer science and applied mathematics. I’m advised by [Andrew Wagenmaker](https://wagenmaker.github.io/) and [Sergey Levine](https://people.eecs.berkeley.edu/~svlevine/) in the [Robotic AI and Learning Lab](http://rail.eecs.berkeley.edu/)@[BAIR](http://bair.berkeley.edu/). Previously, I worked on LLM evaluation at Berkeley’s RISELab, where I co-led the development of the Berkeley Function Calling Leaderboard (BFCL) v4 web search benchmark.

**I’m seeking research engineer and machine learning engineer roles starting after my graduation in Spring 2027, with particular interests in robotics and reinforcement learning.**

{% capture research_intro %}
My research focuses on efficient RL finetuning of pretrained robot policies. Vision language action (VLA) models provide a promising starting point for general-purpose robotics, but deploying them in new real-world settings often requires further adaptation. I am interested in how RL can enable this adaptation efficiently, through two complementary directions:

- **Pretraining for adaptation:** How can we pretrain policies that are easier to finetune with RL?
- **Efficient finetuning:** How can we speed up RL improvement of existing pretrained policies?
{% endcapture %}
{% include research.liquid intro=research_intro %}
