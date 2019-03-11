require 'rubystats'
class DashboardController < ApplicationController

  def display_main_screen
  end

  def display_select_weed_screen
  end

  def display_statistics_screen
  end

  def display_upload_screen
  end

  def upload_data
    what_was_read = JSON.parse( CGI.unescape(params[:json_entry]) )
    if what_was_read.kind_of?(Array)
      what_was_read.each{ |record| Record.create!( entry: record.to_json) }
    else
      Record.create!( entry: what_was_read.to_json )
    end
    render "display_main_screen"
    return
  end

  def reset_data
    default_data = [
    {
      serial_number: "SPRAYER0000",
      lon: -122.008973,
      lat: 37.334901,
      timestamp: "2019-01-22T22:00:48Z",
      radish: 437,
      pea: 0,
      marigold: 32,
      morning_glory: 8,
      unidentified: 66,
      pump_time: 20
    },
    {
      serial_number: "SPRAYER0002",
      lon: -122.008913,
      lat: 37.334921,
      timestamp: "2019-01-26T23:22:12Z",
      radish: 621,
      pea: 0,
      marigold: 44,
      morning_glory: 2,
      unidentified: 92,
      pump_time: 25
    },
    {
      serial_number: "SPRAYER0005))))",
      lon: -122.008973,
      lat: 37.334901,
      timestamp: "2019-02-01T16:16:44Z",
      radish: 0,
      pea: 324,
      marigold: 12,
      morning_glory: 0,
      unidentified: 16,
      pump_time: 18
    },
    {
      serial_number: "SPRAYER0000",
      lon: -122.008973,
      lat: 37.334901,
      timestamp: "2019-02-02T18:45:11Z",
      radish: 0,
      pea: 211,
      marigold: 66,
      morning_glory: 2,
      unidentified: 7,
      pump_time: 36
    },
    {
      serial_number: "SPRAYER0000",
      lon: -122.008973,
      lat: 37.334901,
      timestamp: "2019-02-03T17:17:31Z",
      radish: 2,
      pea: 150,
      marigold: 3,
      morning_glory: 6,
      pump_time: 9
    }
  ]
  Record.destroy_all
  default_data.each{ |record| Record.create!( entry: record.to_json) }

  render "display_main_screen"
  return

  end

  def completely_clear_data
    Record.destroy_all
    render "display_main_screen"
  end

  def display_simulator
  end

  def return_data
    respond_to do |format|
      format.json { render :json => Record.pluck(:entry).to_json.gsub(/\\/,'').gsub(/\[\"/, "[").gsub(/\"\]/, "]").gsub('}","{', "},{" ) }
    end
  end


  def return_sample_data

    #my_rel2 = Bin.joins("LEFT JOIN skus ON skus.id = bins.sku_id").
    #  select('sku_id, skus.name, sum(bins.qty) as quantity, skus.minimum_stocking_level as reorder').
    #  group("sku_id", "skus.minimum_stocking_level", "skus.name").
    #  having("sum(bins.qty) < max(skus.minimum_stocking_level)")

    if ( params[:start_date] == 'simd')
      srand 42
    end
    if ( params[:start_date] =~ /simd?/)
      the_list = []
      rngN = Rubystats::NormalDistribution.new(0.0, 0.02)
      #rng = Random.new(params[:end_date].to_i)
      params[:end_date].to_i.downto(1) do |index|
        angle = rand * 2.0 * 3.1415926535
        #radius = 0.03 * Math::sqrt(rand)
        radius = rngN.rng

        the_list.push( { serial_number: "SPRAYER000" + (index % 6).to_s,
          #lon: -122.008973 + ( rand * 0.06 ) - 0.03,
          #lat: 37.334901 + ( rand * 0.06 ) - 0.03,
          lon: -122.008973 + radius * Math::cos(angle),
          lat: 37.334901 + radius * Math::sin(angle),
          timestamp: (Time.now - index.days - rand(4).hours - rand(30).minutes - rand(50).seconds).utc.iso8601,

          radish: 6 + rand(index) * 2,
          pea: ( index > 3 ? rand(index) * 10 : 0),
          marigold: 3 + rand(30),
          morning_glory: rand(10),
          unidentified: rand(index) + 21,
          pump_time: 5 + rand(index)

        } )
      end

      respond_to do |format|
        format.json { render :json => the_list.to_json.gsub(/\\/,'').gsub(/\[\"/, "[").gsub(/\"\]/, "]").gsub('}","{', "},{" ) }
      end

    else
      respond_to do |format|
        format.json { render :json => Record.pluck(:entry).to_json.gsub(/\\/,'').gsub(/\[\"/, "[").gsub(/\"\]/, "]").gsub('}","{', "},{" ) }
      end
    end
  end


  def return_sample_images

    #my_rel2 = Bin.joins("LEFT JOIN skus ON skus.id = bins.sku_id").
    #  select('sku_id, skus.name, sum(bins.qty) as quantity, skus.minimum_stocking_level as reorder').
    #  group("sku_id", "skus.minimum_stocking_level", "skus.name").
    #  having("sum(bins.qty) < max(skus.minimum_stocking_level)")


    respond_to do |format|
      format.json { render :json =>   Picture.where( sn: params[:sn] ).as_json(only: [:sn, :created_at, :url]) }
    end

  end



end
