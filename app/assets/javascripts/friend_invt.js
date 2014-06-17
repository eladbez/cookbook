# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$function()(
(".return").on("click", function() {
              var upperWindow = window.opener
              window.close
              upperWindow.focus
              upperWindow.location.reload
              
            };
        }