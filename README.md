# Application Insights SDK for Ruby #

[![Gem Version](https://badge.fury.io/rb/application_insights.svg)](http://badge.fury.io/rb/application_insights)

>Ruby is a dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write. 
> -- <cite>[Ruby - Official Site](https://www.ruby-lang.org/en/)</cite>

This project extends the Application Insights API surface to support Ruby. [Application Insights](http://azure.microsoft.com/en-us/services/application-insights/) is a service that allows developers to keep their application available, performing and succeeding. This Ruby gem will allow you to send telemetry of various kinds (event, trace, exception, etc.) to the Application Insights service where they can be visualized in the Azure Portal. 


## Requirements ##

Ruby 1.9.3 is currently supported by this gem. 

## Installation ##

To install the latest release you can use *gem*.

```
$ gem install application_insights
```

## Usage ##

Once installed, you can send telemetry to Application Insights. Here are a few samples.

>**Note**: before you can send data to you will need an instrumentation key. Please see the [Getting an Application Insights Instrumentation Key](https://github.com/Microsoft/AppInsights-Home/wiki#getting-an-application-insights-instrumentation-key) section for more information.


**Sending a simple event telemetry item**
```ruby
require 'application_insights'
tc = ApplicationInsights::TelemetryClient.new
tc.context.instrumentation_key = '<YOUR INSTRUMENTATION KEY GOES HERE>'
tc.track_event 'My event'
tc.flush
```

**Sending an event telemetry item with custom properties and measurements**
```ruby
require 'application_insights'
tc = ApplicationInsights::TelemetryClient.new
tc.context.instrumentation_key = '<YOUR INSTRUMENTATION KEY GOES HERE>'
tc.track_event 'My event', :properties => { 'custom property' => 'some value' }, :measurements => { 'custom metric' => 13 }
tc.flush
```

**Sending a trace telemetry item with custom properties**
```ruby
require 'application_insights'
tc = ApplicationInsights::TelemetryClient.new
tc.context.instrumentation_key = '<YOUR INSTRUMENTATION KEY GOES HERE>'
tc.track_trace 'My trace statement', :properties => { 'custom property' => 'some value' }
tc.flush
```  

**Sending a metric telemetry item (without and with optional values)**
```ruby
require 'application_insights'
tc = ApplicationInsights::TelemetryClient.new
tc.context.instrumentation_key = '<YOUR INSTRUMENTATION KEY GOES HERE>'
tc.track_metric 'My metric', 42
# with all optional values set
tc.track_metric 'My metric', 42, :kind => ApplicationInsights::Channel::Contracts::DataPointType::AGGREGATION, :count => 3, :min => 1, :max => 100, :std_dev => 10, :properties => { 'custom property' => 'some value' }
tc.flush
``` 

**Sending an exception telemetry item with custom properties and measurements**
```ruby
require 'application_insights'
tc = ApplicationInsights::TelemetryClient.new
tc.context.instrumentation_key = '<YOUR INSTRUMENTATION KEY GOES HERE>'
begin
  raise ArgumentError, 'Something has gone wrong!'
rescue => e
  tc.track_exception e
end
tc.flush
```  

**Configuring context for a telemetry client instance**
```ruby
require 'application_insights'
tc = ApplicationInsights::TelemetryClient.new
tc.context.instrumentation_key = '<YOUR INSTRUMENTATION KEY GOES HERE>'
tc.context.application.id = 'My application'
tc.context.application.ver = '1.2.3'
tc.context.device.id = 'My current device'
tc.context.device.oem_name = 'Asus'
tc.context.device.model = 'X31A'
tc.context.device.type = "Other"
tc.context.user.id = 'santa@northpole.net'
tc.track_trace 'My trace with context'
tc.flush
```  

**Configuring channel related properties**
```ruby
require 'application_insights'
tc = ApplicationInsights::TelemetryClient.new
# flush telemetry if we have 10 or more telemetry items in our queue
tc.channel.queue.max_queue_length = 10
# send telemetry to the service in batches of 5
tc.channel.sender.send_buffer_size = 5
```



