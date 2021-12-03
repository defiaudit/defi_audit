class Project
  include ActiveModel::Model
  attr_accessor :name, :ticker, :website, :audit, :icon_url, :ticker_url, :contract_url, :audit_data

  def audits
    audit_data.map { |a| Audit.new(a) }
  end

  class << self
    def all
      @all ||= project_data.map do |project_json|
        new(project_json)
      end
    end

    def project_data
        file_name = Rails.root + "config/projects.json"
        JSON.parse(File.read(file_name), symbolize_names: true)[:projects].freeze if File.exist?(file_name)
    end
  end

  class Audit
    include ActiveModel::Model
    attr_accessor :auditor_name, :url

    def auditor
      Auditor.by_slug(auditor_name)
    end
  end
end
