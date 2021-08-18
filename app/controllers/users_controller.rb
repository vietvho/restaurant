class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    # render 'page/contact'
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save
        if (params[:email_subject]) 
          UserMailer.with(user: @user, email_subject: params[:email_subject] ).welcome_email.deliver_later
          UserMailer.with(user: @user, email_subject: params[:email_subject], message: params[:message] ).to_admin.deliver_later
        end
        respond_to do |format|
            format.turbo_stream do
                # render turbo_stream: turbo_stream.append('iced_coffee',
                #             partial: "users/item_id",
                #             locals: { user: @user, categories: $categories })

                # render partial: :show, formats: [:html], locals: { user: @user, type: 'turbo_stream', action: 'replace', target: 'c-user__form--stream'}, location:  user_path(@user)
                # redirect_to @user
                #end turbo format
                # render turbo_stream: turbo_stream.replace('c-user__form--stream',
                #             partial: user_path(@user),
                #             locals: { user: @user})
                render turbo_stream: turbo_stream.replace('c-user__form--stream',
                partial: "users/contact",
                locals: { user: @user})
            end
                #end format
        end
            # render partial: "users/item_id", object: @user, as: "user"
    else
        # render "new"
        render turbo_stream: turbo_stream.replace('c-user__form--stream',
                            partial: "users/form",
                            locals: { user: @user})

        # end if save
    end

  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user,).permit(:name, :email, :login, :subject)
    end
end
