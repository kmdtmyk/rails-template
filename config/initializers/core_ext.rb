# frozen_string_literal: true

Dir[File.join(Rails.root, 'app', 'core_ext', '**/*.rb')].each do |file|
  require file
end
