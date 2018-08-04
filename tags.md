---
title: Tags
---

<ul>
  {% for page in site.pages %}
    {% if page.title contains 'Tag:' %}
      {% assign tag = page %}
      <li><a href="{{ tag.url }}">{{ tag.title }}</a></li>
    {% endif %}
  {% endfor %}
</ul>
