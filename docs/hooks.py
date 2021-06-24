# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

import mkdocs.config
import mkdocs.config.config_options
import mkdocs.structure.files
import mkdocs.structure.nav
import mkdocs.structure.pages

# Dynamically build template nav
def build_template_nav(nav: mkdocs.structure.nav.Navigation, config: mkdocs.config.Config, files: mkdocs.structure.files.Files) -> mkdocs.structure.nav.Navigation:
    children = []
    # item: mkdocs.structure.nav.Section = mkdocs.structure.nav.Section("Templates", children)
    # templates: mkdocs.structure.nav.Section = 
    # next(x for x in nav if x.title == "Templates")

    for f in files:
        if not f.is_documentation_page():
            continue

        if f._get_dest_path(False).__contains__("/templates/"):
            children.append(mkdocs.structure.pages.Page(f._get_stem(), f, config))

    # nav.items.append(item)
    
    # referenceItem.children.append(item)
    item: mkdocs.structure.nav.Section = mkdocs.structure.nav.Section("Templates", children)
    mkdocs.structure.nav._add_parent_links(item)
    nav.items.append(item)
    return nav
