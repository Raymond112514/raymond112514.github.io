---
layout: default
permalink: /notes/
title: Notes
nav: true
nav_order: 1
---

<div class="post notes-index">
  <header class="post-header">
    <h1 class="post-title">Notes</h1>
  </header>

  {% assign notes_posts = site.posts | where_exp: "post", "post.categories contains 'notes'" %}

  {% for series in site.data.notes %}
    {% assign chapters = notes_posts | where: "series", series.title | sort: "series_order" %}
    {% assign published_titles = chapters | map: "title" %}
    {% assign chapter_count = chapters | size %}
    {% if series.upcoming %}
      {% assign upcoming_count = series.upcoming | size %}
    {% else %}
      {% assign upcoming_count = 0 %}
    {% endif %}

    <details class="notes-series"{% if series.open %} open{% endif %}>
      <summary>
        <span class="notes-series-title">{{ series.title }}</span>
        {% if series.status %}
          <span class="notes-series-status">· {{ series.status }}</span>
        {% endif %}
      </summary>

      {% if chapter_count == 0 and upcoming_count == 0 %}
        <p class="notes-empty">No notes yet.</p>
      {% else %}
        <ol class="notes-series-list">
          {% assign note_index = 0 %}
          {% for post in chapters %}
            {% assign note_index = note_index | plus: 1 %}
            <li>
              <span class="notes-num">{% if note_index < 10 %}0{{ note_index }}{% else %}{{ note_index }}{% endif %}</span>
              <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
            </li>
          {% endfor %}
          {% if series.upcoming %}
            {% for item in series.upcoming %}
              {% unless published_titles contains item %}
                {% assign note_index = note_index | plus: 1 %}
                <li>
                  <span class="notes-num">{% if note_index < 10 %}0{{ note_index }}{% else %}{{ note_index }}{% endif %}</span>
                  <span class="notes-planned">{{ item }}</span>
                </li>
              {% endunless %}
            {% endfor %}
          {% endif %}
        </ol>
      {% endif %}
    </details>
  {% endfor %}
</div>
