class SearchController < ApplicationController
  def index
    p Skyscanner::Connection.browse_quotes({ :country => "GB", :currency => "GBP",
                                           :locale => "en-GB", :originPlace => "UK", 
                                           :destinationPlace => "anywhere", :outboundPartialDate => "anytime", 
                                           :inboundPartialDate => "anytime", :apikey => "prtl6749387986743898559646983194",
                                        })
  end
end
