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
    render "display_simulator"
    return
  end

  def reset_data
    default_data = [
    {
      serial_number: "SAMPLESN",
      lon: -122.008973,
      lat: 37.334901,
      timestamp: "2019-01-22 22:00:48 UTC",
      radish: 437,
      pea: 0,
      marigold: 32,
      morning_glory: 8,
      unidentified: 66,
      pump_time: 20
    },
    {
      serial_number: "SAMPLESN2",
      lon: -122.008913,
      lat: 37.334921,
      timestamp: "2019-01-26 23:22:12 UTC",
      radish: 621,
      pea: 0,
      marigold: 44,
      morning_glory: 2,
      unidentified: 92,
      pump_time: 25
    },
    {
      serial_number: "SAMPLESN",
      lon: -122.008973,
      lat: 37.334901,
      timestamp: "2019-02-01 16:16:45 UTC",
      radish: 0,
      pea: 324,
      marigold: 12,
      morning_glory: 0,
      unidentified: 16,
      pump_time: 18
    },
    {
      serial_number: "SAMPLESN",
      lon: -122.008973,
      lat: 37.334901,
      timestamp: "2019-02-02 18:45:11 UTC",
      radish: 0,
      pea: 211,
      marigold: 66,
      morning_glory: 2,
      unidentified: 7,
      pump_time: 36
    },
    {
      serial_number: "SAMPLESN",
      lon: -122.008973,
      lat: 37.334901,
      timestamp: "2019-02-03 17:17:31 UTC",
      radish: 2,
      pea: 150,
      marigold: 3,
      morning_glory: 6,
      pump_time: 9
    }
  ]
  Record.destroy_all
  default_data.each{ |record| Record.create!( entry: record.to_json) }

  render "display_simulator"
  return

  end

  def completely_clear_data
    Record.destroy_all
    render "display_simulator"
  end

  def display_simulator
  end

  def return_data
    render plain: "no data"
    return
  end

  def return_sample_data

    #my_rel2 = Bin.joins("LEFT JOIN skus ON skus.id = bins.sku_id").
    #  select('sku_id, skus.name, sum(bins.qty) as quantity, skus.minimum_stocking_level as reorder').
    #  group("sku_id", "skus.minimum_stocking_level", "skus.name").
    #  having("sum(bins.qty) < max(skus.minimum_stocking_level)")



    respond_to do |format|

      puts Record.pluck(:entry).as_json

      format.json { render :json => Record.pluck(:entry).to_json.gsub(/\\/,'') }
      end
    end


end
