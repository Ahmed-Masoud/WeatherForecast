# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def shared_pods
pod 'Alamofire'
pod 'Kingfisher'
end

target 'WeatherForecast' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for WeatherForecast
	shared_pods
  target 'WeatherForecastTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'WeatherForecast-Staging' do
	shared_pods
  end

end
