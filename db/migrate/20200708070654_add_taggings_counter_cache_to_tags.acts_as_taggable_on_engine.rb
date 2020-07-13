# This migration comes from acts_as_taggable_on_engine (originally 3)
if ActiveRecord.gem_version >= Gem::Version.new('5.0')
  class AddTaggingsCounterCacheToTags < ActiveRecord::Migration[4.2]; end
else
  class AddTaggingsCounterCacheToTags < ActiveRecord::Migration; end
end
AddTaggingsCounterCacheToTags.class_eval do
  def change
    add_column ActsAsTaggableOn.tags_table, :taggings_count, :integer, default: 0

    ActsAsTaggableOn::Tag.reset_column_information
    ActsAsTaggableOn::Tag.find_each do |tag|
      ActsAsTaggableOn::Tag.reset_counters(tag.id, ActsAsTaggableOn.taggings_table)
    end
  end

end
