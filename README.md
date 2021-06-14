# Amy Lee Lab Website

The file `_README.md` came with the template used for this site and provides a helpful explanation of this site's various parts. This file will focus more on explaining the changes added to the template.

---

## The `_data` folder

This folder is home to YAML files which contain data used across the site.

---

### The `settings.yml` file

Most of this file is explained in the `_README.md` file. It contains basic settings such as the site title and favicon. Note that the contact form from the template has been changed into a contact page for this site. Settings which were not part of the template can be found by scrolling to the bottom:

`people` – Includes various settings which change how the table of people looks. If someone doesn't have a headshot image, the path to a default headshot image is set here.

`urls` – URLs used throughout the site can be placed here.

---

### The `people.yml` file

#### Current lab members

The first section in this file contains current people at the lab. If no `image_path` is specified for a person, the default headshot image, `blank_headshot_image_path` in `settings.yml`, is used instead.

Another optional setting is `image_offset`. The first number controls the *x* offset, and the second number controls the *y* offset.

#### Lab alumni

Lab alumni only have a name and position. If there are no lab alumni specified in `people.yml`, this section will be omitted in the `/people` page of the site.

---

### The `publications.yml` file

Includes a list of publications which are added to the `/publications` page of the site. Note that the created plugin `pmid.rb` (in the `_plugins` folder) will automatically make each PMID a link.

---

## Editing pages

Most pages are markdown files which can be found in the `_pages` folder. At the top of the file, there are special **front matter variables**:

`title` – controls the title of the page, which appears in the browser's title bar as well. It is also shown in search engine results and social shares.

`subtitle` – Appears below the title. If not wanted, leave it blank.

`description` – Shown in search engine results and social shares.

`featured_image` – The header image of the page. It is also shown in search engine results and social shares. To make the image lighter or darker, change `overlay_opacity` in `_data/settings.yml`. In order to have the page itself omit the featured image, without having to change any of the page's content, simply drag the file from the `_pages` folder to the `_basic_pages` folder. Once in the `_basic_pages` folder, the page will use the `basic_page.html` layout, which doesn't include the featured image in the page's display.

Some pages might have additional front matter variables. To add custom ones, first define it like normal in the front matter. Next, access it in the markdown below by typing `{{ page.<variable_name> }}`.

A few other notes:
- A newline can be forced in markdown by putting two spaces at the end of a line.
- Text can be styled using markdown or HTML. For example, bold text could be displayed by doing `**text**` or `<b>text</b>`. Although using HTML seems out of place in a markdown file, it works. In fact, styling text with HTML can look better.

---

### Special pages

`index.html` – The home page, found in the root directory. To edit the main text of the home page, go to `_includes/index.md`. Also, since a plugin has been added (described at the bottom of this file), liquid syntax (such as variables with the double curly braces) can be used within the markdown.

`404.html` – Shows when a requested page cannot be found, found in the root directory.

`lab-life/index.html` – The lab life blog page. This `index.html` file is in the `lab-life` folder in the root directory. The `lab-life` folder used to be named `blog`, but was renamed.

---

### Lab life (blog) posts

The actual posts for lab life are found in the `_posts` folder. There is an example demo post which goes over how to create page content (style markdown, add images/videos/galleries, etc.).

---

### Research (projects)

This is the home page, which has a list of research projects, similar to the posts on the lab life page. The posts for the research page are in the `_projects` folder.

---

## Images

Images are placed in the `/images/` folder:

- `/images/people/current/` has lab headshots. The default blank headshot image is under `/images/people/`.
- `social.jpg` is the default image to be used during social shares. If a page has a `featured_image` specified, that image will be used instead.
- `favicon.png` is simply the favicon image of the site.
- `logo.png` is the main site logo.
- `/logos/` has other lab logos that could be used if wanted.
- `/projects/` can be used as a place to keep images for projects.
- `/posts/` can be used as a place to keep images for posts.
- `/scenery/` has various SFU scenery.

---

## Plugins

Plugins can be found in the `_plugins` folder. Added plugins are:

- `flatify.rb`: allows the use of liquid syntax inside front matter. In other words, it allows variables to be used in front matter. For example, without the plugin, if someone wanted to change the site title, they would have to go through each page and manually change front matter. Now, a front matter variable can be changed from something such as `Lee Lab publications.` to `"{{ site.data.settings.basic_settings.site_title }} publications."` (note the addition of double quotes around the text). With the liquid syntax with the double curly braces, the title will update automatically to match the title set in `_data/settings.yml`. In order to have the liquid syntax evaluated, when accessing the front matter variable in the page, make sure to change `{{ page.<variable_name> }}` to `{{ page.<variable_name> | flatify }}`.

- `pmid.rb`: this function simply turns the PMID in a publication into a link.
