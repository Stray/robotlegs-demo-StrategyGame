#!/usr/bin/ruby1.8
# find classes that extend event or a superclass of event
# find classes that extend mediator or a superclass of mediator

# search for events inside mediators        

require 'pp'
require 'yaml'

def recurse_search_src_files_to_find_events_and_mediators(srcDirName, foundEventFiles, foundMediatorFiles, foundEventTypes)
  Dir::chdir(srcDirName)
  dirContents = Dir['*'] 
  dirContents.each do |nextItem|
    if(File::directory?(nextItem))
      recurse_search_src_files_to_find_events_and_mediators(nextItem, foundEventFiles, foundMediatorFiles, foundEventTypes)
    else 
      fileType = check_if_is_event_or_mediator(nextItem, foundEventTypes)
      if(fileType == "Event")
        foundEventFiles << File::expand_path(nextItem)
      elsif(fileType == "Mediator")
          foundMediatorFiles << File::expand_path(nextItem)
      end
    end
  end
  Dir::chdir('..')      
end
      
def check_if_is_event_or_mediator(srcFileName, foundEventTypes)
  srcFile = File::open(srcFileName)
    
  extendsEvent = false
  extendsMediator = false
  
  inComments = false

  srcFile.each do |line|
    if(inComments)
      inComments = !line.include?('*/')
    else
      inComments = line.include?('/*')
    end                               
    
    if(!inComments)
      event_match = line.scan(/.+\bclass\b.+\bextends\b.*Event\W/)
      if(!event_match.empty?)
        extendsEvent = true
        break
      else
        mediator_match = line.scan(/.+\bclass\b.+\bextends.+\b.*Mediator/)
        if(!mediator_match.empty?)
          extendsMediator = true 
          break
        end
      end 
    end
  end                
  
  if(extendsEvent)
    eventClass = srcFileName.split(".")[0]
    foundEventTypes[eventClass] = search_event_for_types(srcFile)
  end
  
  srcFile.close      
  if(extendsEvent)
    return 'Event'
  elsif(extendsMediator)
    return 'Mediator'
  else
    return 'Nothing'
  end
end 

def search_event_for_types(eventFile)
  event_types_found = []
  eventFile.each do |line|
    event_type_match = line.scan(/.+\bpublic\b.+\bstatic\b.+\bconst\b (.*).*:.*String/)
    if(!event_type_match.empty?)
      event_types_found.push(event_type_match[0][0])
    end
  end
  return event_types_found
end

def search_mediators_for_event_types(mediatorFiles, eventTypes)
  
  mediatorFiles.each do |mediatorFileName|
    
    mediatorFile = File::open(mediatorFileName)
    mediatorFile.each do |line|   
      eventTypes.keys.each do |eventClass|
        eventTypes[eventClass].each do |eventType| 
          listener = ''
          if(line.include?(eventClass + "." + eventType))
            addContextListener_match = line.scan(/.+\baddContextListener.*\(#{eventClass}.#{eventType}\b[^,]*,([^,]*)\b/)
            if(!addContextListener_match.empty?) 
              listener = addContextListener_match[0][0]
            else
              mapListener_match = line.scan(/.+.mapListener.*\(.*eventDispatcher.*,[ ]*#{eventClass}.#{eventType}\b[^,]*,([^,]*)\b/)
              if(!mapListener_match.empty?)
                listener = mapListener_match[0][0] 
              else
                addEventListener_match = line.scan(/.+\beventDispatcher.addEventListener.*\(#{eventClass}.#{eventType}\b[^,]*,([^,]*)\b/)
                if(!addEventListener_match.empty?)
                  listener = addEventListener_match[0][0]
                end
              end
            end
            
            if(listener != '')
              log_relationship(mediatorFileName, eventClass, eventType, listener)
            end
            
          end
        end
      end
    end
  end
end
                    

def log_relationship(mediatorFileName, eventClass, eventType, listener)
  
  mediatorClassName = mediatorFileName.split("/").pop.split(".")[0]
  
  # puts mediatorClassName + " -> " + eventClass + "." + eventType + "  :: " + listener

  if(! @foundMappings['byMediator'].has_key?(mediatorClassName))
    @foundMappings['byMediator'][mediatorClassName] = Hash[]
  end
  
  if(! @foundMappings['byMediator'][mediatorClassName].has_key?(eventClass))
    @foundMappings['byMediator'][mediatorClassName][eventClass] = Hash[]
  end
  
  if(! @foundMappings['byMediator'][mediatorClassName][eventClass].has_key?(eventType))
    @foundMappings['byMediator'][mediatorClassName][eventClass][eventType] = Array[]
  end
  
  @foundMappings['byMediator'][mediatorClassName][eventClass][eventType].push(listener)
  
  if(! @foundMappings['byEvent'].has_key?(eventClass))
    @foundMappings['byEvent'][eventClass] = Hash[]
  end
  
  if(! @foundMappings['byEvent'][eventClass].has_key?(eventType))
    @foundMappings['byEvent'][eventClass][eventType] = Hash[]
  end
  
  if(! @foundMappings['byEvent'][eventClass][eventType].has_key?(mediatorClassName))
    @foundMappings['byEvent'][eventClass][eventType][mediatorClassName] = Array[]
  end 
  
  @foundMappings['byEvent'][eventClass][eventType][mediatorClassName].push(listener)

end

foundEventFiles = Array[]                 
foundMediatorFiles = Array[]
foundEventTypes = Hash[]
@foundMappings = Hash[] 
foundMappingsByMediator = Hash[]
foundMappingsByEventClass = Hash[]
@foundMappings['byMediator'] = foundMappingsByMediator
@foundMappings['byEvent'] = foundMappingsByEventClass

recurse_search_src_files_to_find_events_and_mediators('src', foundEventFiles, foundMediatorFiles, foundEventTypes)

search_mediators_for_event_types(foundMediatorFiles, foundEventTypes)

#puts @foundMappings.pretty_inspect
puts @foundMappings.to_yaml
