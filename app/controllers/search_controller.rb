class SearchController < ApplicationController
  def index
    # p Skyscanner::Connection.instance_variables
    # Skyscanner::Connection.browse_quotes({ :country => "GB", :curency => "GBP",
    #                                        :locale => "en-GB", :originPlace => "UK", 
    #                                        :destinationPlace => "anywhere", :outboundPartialDate => "anytime", 
    #                                        :inboundPartialDate => "anytime", :apikey => "prtl6749387986743898559646983194"
    #                                     })
  end
end
