# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "radiant-page_list_view-extension"
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrew vonderLuft", "Sean Cribbs"]
  s.date = "2013-01-24"
  s.description = "Enables viewing site pages in a list sortable by attibute."
  s.email = "avonderluft@avlux.net"
  s.extra_rdoc_files = [
    "README.textile"
  ]
  s.files = [
    ".gitmodules",
    "HELP.textile",
    "README.textile",
    "Rakefile",
    "VERSION",
    "app/helpers/admin/list_view_helper.rb",
    "app/views/admin/pages/_page.html.haml",
    "app/views/admin/pages/_page_list_view_styles.html.haml",
    "app/views/admin/pages/page_list_view.html.haml",
    "config/routes.rb",
    "lib/page_list_view/admin_page_controller_extensions.rb",
    "lib/page_list_view/page_extensions.rb",
    "lib/tasks/page_list_view_extension_tasks.rake",
    "page_list_view_extension.rb",
    "public/images/admin/application_cascade.png",
    "public/images/admin/application_side_tree.png",
    "public/images/admin/application_view_detail.png",
    "public/images/admin/application_view_list.png",
    "public/javascripts/admin/tablekit.js",
    "radiant-page_list_view-extension.gemspec",
    "spec/controllers/admin_page_controller_extensions_spec.rb",
    "spec/models/page_extensions_spec.rb",
    "spec/spec.opts",
    "spec/spec_helper.rb"
  ]
  s.homepage = "https://github.com/avonderluft/radiant-page_list_view-extension"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Page List View Extension for Radiant CMS"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<radiant>, [">= 0.9.1"])
    else
      s.add_dependency(%q<radiant>, [">= 0.9.1"])
    end
  else
    s.add_dependency(%q<radiant>, [">= 0.9.1"])
  end
end

