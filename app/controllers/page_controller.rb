class PageController < ApplicationController
    def contact
        @page = "contact"
        @contact = Contact.new

    end

    def about
        @page = "about"
    end
end
