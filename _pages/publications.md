---
title: Publications
subtitle:
description: "{{ site.data.settings.basic_settings.site_title }} publications."
featured_image: /images/logos/hi-res-and-textured-300dpi-cropped.png
---

## Publications

See an up-to-date list of Lee Lab publications on [Google Scholar]({{ site.data.settings.urls.google_scholar }}).

#### Selected Publications

<ul>
  {% for publication in site.data.publications %}
  <div class="publication">
  <li>
    {{ publication | link_pubmed: 'PMID: ', 'PMCID: ' | markdownify }}
  </li>
  </div>
  <br>
  {% endfor %}
</ul>
