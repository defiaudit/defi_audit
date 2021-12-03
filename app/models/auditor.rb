class Auditor
  include ActiveModel::Model
  attr_accessor :name, :website, :icon_url, :slug

  class << self
    def all
      auditor_data.map do |auditor_json|
        new(auditor_json)
      end
    end

    def by_slug(name)
      all.detect { |auditor| auditor.slug == name }
    end

    def auditor_data
        file_name = Rails.root + "config/auditors.json"
        JSON.parse(File.read(file_name), symbolize_names: true)[:auditors].freeze if File.exist?(file_name)
    end
  end
end
