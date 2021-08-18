module Visible
    extend ActiveSupport::Concern 

    VALID_STATUSES = ['public', 'privated', 'archived']

    #nho dung nham lan included & include 
    included do
        validates :status, inclusion: {in: VALID_STATUSES}
    end

    #some thing like class
    class_methods do
        def public_count
            # where se goi toi truy van where cua SQLite
            where(status: 'public').count 
        end
    end

    def archived
        status = 'archived'
    end
end