---
title: People
subtitle:
description: "People at the {{ site.data.settings.basic_settings.site_title }}."
# featured_image: /images/mbb/mbb-dept.jpg
featured_image: /images/scenery/quadrangle-reflection.jpg
---

## Current

<div class="people">
  <table>
    {% for person in site.data.people.current %}
    <tr>
      <td>
        {% if person.image_path %}
          {% if person.image_offset %}
            <img src="{{ person.image_path }}" alt="{{ person.name }}'s Headshot"
            style="object-position: {{ person.image_offset }};">
          {% else %}
            <img src="{{ person.image_path }}" alt="{{ person.name }}'s Headshot">
          {% endif %}
        {% else %}
        <img src="{{ site.data.settings.people.blank_headshot_image_path }}" alt="{{ person.name }}'s Headshot">
        {% endif %}
      </td>
      <td>
        <p><b>{{ person.name }}</b>
        <br>{{ person.position }}</p>
        <div id="about">
        <p>{{ person.about | markdownify }}</p>
        </div>
      </td>
    </tr>
    {% endfor %}
  </table>
</div>

{% assign alumni_size = site.data.people.alumni | size %}
{% if alumni_size != 0 %}
## Lab Alumni

{% for person in site.data.people.alumni %}
<b>{{ person.name }}</b>, {{ person.position }}
{% endfor %}
{% endif %}
