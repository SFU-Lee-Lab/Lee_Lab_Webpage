{% assign sorted_static_files = site.static_files | sort: "modified_time"  | reverse %}

<div class="gallery gallery__item--crop" data-columns="1">
  {% for file in sorted_static_files %}
    {% if file.path contains page.gallery_path %}
    {% unless file.path contains page.featured_image %}
      <img src="{{ file.path }}" alt="{{ file.basename }}">
    {% endunless %}
    {% endif %}
  {% endfor %}
</div>
