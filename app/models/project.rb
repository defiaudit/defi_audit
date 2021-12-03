class Project
  include ActiveModel::Model
  attr_accessor :name, :ticker, :website, :audit, :icon_url, :ticker_url, :contract_url

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
end
