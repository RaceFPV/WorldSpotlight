module MapHelper
  def get_weather_icon(temp)
    case temp
    when -500..0
      image_tag "verycold.png", class: 'weather-icon'
    when 1..31
       image_tag "cold.png", class: 'weather-icon'
    when 32..50
       image_tag "cool.png", class: 'weather-icon'
    when 51..86
       image_tag "warm.png", class: 'weather-icon'
    when 86..500
       image_tag "hot.png", class: 'weather-icon'
    end
  end
end
