#!/usr/bin/env ruby
#
# Check for changed posts

Jekyll::Hooks.register [:documents,:posts], :post_init do |post|
  # Skip drafts and static files
  next unless post.respond_to?(:collection)
  # for the root of _post be triged twice.
  next if post.data['lastmod_checked']

  commit_num = `git rev-list --count HEAD "#{ post.path }"`

  if commit_num.to_i > 1
    lastmod_date = `git log -1 --pretty="%ad" --date=iso "#{ post.path }"`.strip
    unless lastmod_date.empty?
      post.data['lastmod_checked'] = true
      post.data['last_modified_at'] = lastmod_date
    end
  end
end