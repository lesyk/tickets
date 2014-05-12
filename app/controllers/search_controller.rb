class SearchController < ApplicationController
  before_action :authenticate_user!
  TOKEN = "prtl6749387986743898559646983194"

  def index
    if params["from"] && params["to"] && params["date"] && params["date_back"]
      @from = params["from"].empty? ? "LON" : params["from"]
      @to = params["to"].empty? ? "anywhere" : params["to"]
      @date = params["date"].empty? ? "anytime" : params["date"]
      @date_back = params["date_back"].empty? ? "anytime" : params["date_back"]
      Skyscanner::Connection.apikey = TOKEN
      @results = Skyscanner::Connection.browse_quotes({
                                             # :market => "UA",
                                             :country => "GB",
                                             :currency => "GBP",
                                             :locale => "en-GB",
                                             :originPlace => "#{@from}",
                                             :destinationPlace => "#{@to}",
                                             :outboundPartialDate => "#{@date}",
                                             :inboundPartialDate => "#{@date_back}"
                                          })
      @results = @results["Quotes"]
      @booking = Booking.new  
      # puts @results
      respond_to do |format|
        format.html { render action: 'index' }
        format.json { render json: @results }
      end
    end
  end
  
  def lookup_directions
    SearchWorker.perform_async('message', 5)
    
    respond_to do |format|
      format.html { redirect_to search_index_path }
      format.json { render json: {:message => "We will send you email with results"}.to_json }
    end
  end

private  
  # Never trust parameters from the scary internet, only allow the white list through.
  def search_params
    params.require(:search).permit(:from, :to, :date, :date_back)
  end

end