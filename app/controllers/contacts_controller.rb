class ContactsController < ApplicationController
      
    # GET /contacts or /contacts.json
    def index
        @contacts = Contact.all
      end
    
      # GET /contacts/1 or /contacts/1.json
      def show
        @contact = Contact.find(params[:id])
       
      end
    
      # GET /contacts/new
      def new
        @contact = Contact.new
        # render 'page/contact'
      end
    
      # GET /contacts/1/edit
      def edit
      end
    
      # POST /contacts or /contacts.json
      def create
        @contact = Contact.new(contact_params)
       
          if @contact.save
            @contact.inspect
            UserMailer.welcome_email(@contact).deliver_later
            respond_to do |format|
              format.turbo_stream do
                render turbo_stream: turbo_stream.replace('contact_message',
                      partial: "contacts/welcome",
                      locals: { contact: @contact })
                  # format.html { redirect_to @contact, notice: "contact was successfully created." }
                  format.json { render :show, status: :created, location: @contact }
              end
            end
              
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @contact.errors, status: :unprocessable_entity }
          end
      end
    
      # PATCH/PUT /contacts/1 or /contacts/1.json
      def update
        respond_to do |format|
          if @contact.update(contact_params)
            format.html { redirect_to @contact, notice: "contact was successfully updated." }
            format.json { render :show, status: :ok, location: @contact }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @contact.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # DELETE /contacts/1 or /contacts/1.json
      def destroy
        @contact.destroy
        respond_to do |format|
          format.html { redirect_to contacts_url, notice: "contact was successfully destroyed." }
          format.json { head :no_content }
        end
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_contact
          @contact = contact.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def contact_params
          params.require(:contact).permit(:name, :email, :message)
        end
    
end
