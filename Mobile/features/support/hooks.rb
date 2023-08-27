require 'report_builder'

Before do
    $driver.start_driver
end
  
After do
    $driver.driver_quit
end

at_exit do
    ReportBuilder.configure do |config|
      Dir.mkdir('reports') unless Dir.exist?('reports')
      if caps[:platformName] == 'iOS'
          File.new('cucumber_ios.json', 'w') unless File.exist?('cucumber_ios.json')
          config.input_path = 'cucumber_ios.json'
          config.report_path = 'reports/report_iOS'
          config.additional_info = { Platform: 'iOS', Environment: 'Develop' }
      else
          File.new('cucumber_android.json', 'w') unless File.exist?('cucumber_android.json')
          config.input_path = 'cucumber_android.json'
          config.report_path = 'reports/report_android'
          config.additional_info = { Platform: 'Android', Environment: 'Develop' }
      end
      config.report_types = %i[etry html]
      config.report_title = 'Desafio'
    end
    ReportBuilder.build_report
  end