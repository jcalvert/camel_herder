# Load the rails application
require File.expand_path('../application', __FILE__)
require 'java'

ROUTE_ATTRIBUTES = ["ExchangesCompleted", "ExchangesFailed", "ExchangesTotal",
   "FirstExchangeCompletedTimestamp", "FirstExchangeFailureTimestamp", "InflightExchanges", 
   "LastExchangeCompletedTimestamp", "LastExchangeFailureTimestamp", "LastProcessingTime",
    "MaxProcessingTime", "MeanProcessingTime", "MinProcessingTime",
    "RouteId", "RoutePolicyList", "State"]

# Initialize the rails application
CamelHerder::Application.initialize!
