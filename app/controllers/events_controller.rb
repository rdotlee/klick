require 'open-uri'
require 'json'
require 'net/http'

class EventsController < ApplicationController
  def index
    @events = Event.order("date ASC")
  end

  def show
    @event = Event.find(params[:id])
    address = @event.location.address
    url_safe_street_address = URI.encode(address)
    url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{url_safe_street_address}"

    raw_results = open(url).read

    parsed_results = JSON.parse(raw_results)

    location_hash = parsed_results["results"][0]["geometry"]["location"]

    @lat = location_hash["lat"]
    @lng = location_hash["lng"]
    puts @lat
    puts @lng
    puts parsed_results

    #key="AIzaSyBcgtY-v3hZRTQVEGqysw3AiCzO1qVrktY"

    # url = URI("https://maps.googleapis.com/maps/api/geocode/json")
   #  url.query= URI.encode_www_form({ address: "#{address}", key:"#{key}" })
   #  puts url
   #  puts '1'
   #  puts open(url).read
   #  puts '2'
   #  res = Net::HTTP::get_response(url)

   #  json_data = res.body if res.is_a?(Net::HTTPSuccess)
   #  @data = JSON.parse(json_data)
   # # puts @data
   #  v= @data['results'][0]
   #  puts v
   #  @lat = v['geometry']['location']['lat']
   #  @lng= v['geometry']['location']['lng']
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    @event.description = params[:description]
    @event.event_type_id = params[:event_type_id]
    @event.date = Chronic.parse(params[:date])
    @event.time = params[:time]
    @event.location_id = params[:location_id]
    @event.count_registration = params[:count_registration]
    @event.group_size = params[:group_size]
      puts @event
      puts @event.date
    if @event.save
      redirect_to "/events", :notice => "Event created successfully."
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    @event.description = params[:description]
    @event.event_type_id = params[:event_type_id]
    @event.date = Chronic.parse(params[:date])
    @event.time = params[:time]
    @event.location_id = params[:location_id]
    @event.count_registration = params[:count_registration]
    @event.group_size = params[:group_size]

    if @event.save
      redirect_to "/events", :notice => "Event updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy

    redirect_to "/events", :notice => "Event deleted."
  end
end
