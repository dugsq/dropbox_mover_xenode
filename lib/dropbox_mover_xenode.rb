# Copyright Nodally Technologies Inc. 2013
# Licensed under the Open Software License version 3.0
# http://opensource.org/licenses/OSL-3.0

# 
# @version 0.1.0
#
# Dropbox Mover Xenode monitors a specific file on Dropbox and moves it to another location on the same Dropbox. 
# It leverages the "dropbox-sdk" Ruby Gem to perform the file move operation. 
#
# Config file options:
#   loop_delay:         Expected value: a float. Defines number of seconds the Xenode waits before running process(). 
#   enabled:            Expected value: true/false. Determines if the xenode process is allowed to run.
#   debug:              Expected value: true/false. Enables extra logging messages in the log file.
#   move_from_path:     Expected value: a string. Specifies the source location of the file to move.
#   move_to_path:       Expected value: a string. Specifies the target location of the file to move.
#   named_file:         Expected value: a string. Specifies the file to move.
#   access_token:       Expected value: a string. Specify the access token for your Dropbox account.
#
# Example Configuration File:
#   enabled: true
#   loop_delay: 60
#   debug: false
#   move_from_path: "/source"
#   move_to_path: "/destination"
#   named_file: "hello.txt"
#   access_token: "1234567890abcdefg"
#
# Example Input:    The Dropbox Mover Xenode does not expect nor handle any input.  
#
# Example Output:   The Dropbox Mover Xenode does not generate any output. 
#

require 'dropbox_sdk'

class DropboxMoverXenode
  include XenoCore::NodeBase
  
  def startup
    mctx = "#{self.class}.#{__method__} - [#{@xenode_id}]"

    begin      
      @access_token = @config[:access_token]
      @named_file   = @config[:named_file]
      @from_path    = @config[:move_from_path]
      @to_path      = @config[:move_to_path]

      if @access_token == nil
        do_debug("#{mctx} - Missing required Dropbox Access Token.")
      end  
    
    rescue Exception => e
      catch_error("#{mctx} - #{e.inspect} #{e.backtrace}")
    end
  end
    
  def process
    mctx = "#{self.class}.#{__method__} - [#{@xenode_id}]"
    
    begin
      
      client = DropboxClient.new(@access_token)
     
      full_from_path = File.join(@from_path, @named_file)
      full_to_path = File.join(@to_path, @named_file)
         
      contents = client.file_move(full_from_path, full_to_path)
      
      if contents  
        do_debug("#{mctx} - File Move Successful: #{full_to_path}")
      end
      
      rescue Exception => e
        catch_error("#{mctx} - #{e.inspect} #{e.backtrace}")
    end
  end
  
end