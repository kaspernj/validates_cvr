module ValidatesCvr; end

class ValidatesCvr::Railtie < ::Rails::Railtie
  initializer "validates_cvr" do |app|
    ValidatesCvr::Railtie.instance_eval do
      pattern = pattern_from app.config.i18n.available_locales
      pattern = "config/locales/#{pattern}.yml"
      files = Dir[File.join(File.dirname(__FILE__), "../..", pattern)]
      I18n.load_path.concat(files)
    end
  end

  def self.pattern_from(args)
    array = Array(args || [])
    array.blank? ? "*" : "{#{array.join(',')}}"
  end
end
