require 'find'

test = File.expand_path('../application_insights', __FILE__)
Find.find test do |path|
  if FileTest.file? path
    require path
  end
end
