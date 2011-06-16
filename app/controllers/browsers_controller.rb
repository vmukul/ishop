class BrowsersController < ActionController::Base
   def desktop
        cookies["browser"] = "desktop"
        redirect_to lists_path
      end

      def mobile
        cookies["browser"] = "mobile"
        redirect_to lists_path
      end

end