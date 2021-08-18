class ArticlesController < ApplicationController
    #http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show] 
    $categories = ["Iced Coffee", "Hot Coffee", "Fruit Juice"]
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def create
        # newu co params truyen den tu articles
        @article = Article.new(articles_params)
        if @article.save
            p "save"
            p @article
            respond_to do |format|
                format.turbo_stream do
                    cat = [];
                    if (@article.categories.kind_of?(Array))
                        @article.categories.each  do |category| 
                            if (!category.empty?)
                                cat_id = category.gsub(" ","_")
                                cat.push(".#{cat_id.underscore}");
                            end
                        #end each categories
                        end 
                    else 
                        cat.push(".uncategorized");
                    # end of if check article.categories
                    end 
                    # render turbo_stream: turbo_stream.append('iced_coffee',
                    #             partial: "articles/item_id",
                    #             locals: { article: @article, categories: $categories })

                    render partial: "articles/item_id", formats: [:html], locals: { article: @article, type: 'turbo_stream', action: 'append', targets: cat.join(',')}, location:  article_path(@article)
                    # redirect_to @article
                    #end turbo format
                end
                    #end format
            end
                # render partial: "articles/item_id", object: @article, as: "article"
        else
            # render "new"
            render turbo_stream: turbo_stream.replace('c-article__form--stream',
                                partial: "articles/form",
                                locals: { article: @article, categories: $categories })

            # end if save
        end

           
        #neu co params truyen den tu articles va @article update thanh cong
        # respond_to do |format|
        #   if @article.save
        #     # format.html{ redirect_to articles_url, notice: 'Article was successfully created.'}
        #     format.turbo_stream do
        #       render turbo_stream: turbo_stream.replace("c-list-item--#{@article.id}",
        #                           partial: "articles/item_id",
        #                           locals: { article: @article })
        #     end
        
        #   else
        #     format.turbo_stream do
        #       render turbo_stream: turbo_stream.replace('c-article__form--stream',
        #                           partial: "articles/form",
        #                           locals: { article: @article, categories: $categories })
        #     end
        #   end
        # end
    
    end

    def edit 
        @article = Article.find(params[:id])
    
    end

    def update
        # newu co params truyen den tu articles
        @article = Article.find(params[:id])
        @id = @article.id;
        if @article.update(articles_params)
            p "save"
            p @article
            respond_to do |format|
                format.turbo_stream do
                    cat = [];
                    if (@article.categories.kind_of?(Array))
                        @article.categories.each  do |category| 
                            if (!category.empty?)
                                cat_id = category.gsub(" ","_")
                                cat.push(".#{cat_id.underscore}");
                            end
                        #end each categories
                        end 
                    else 
                        cat.push(".uncategorized");
                    # end of if check article.categories
                    end 
                    # render turbo_stream: turbo_stream.append('iced_coffee',
                    #             partial: "articles/item_id",
                    #             locals: { article: @article, categories: $categories })

                    render partial: "articles/item_id", formats: [:html], locals: { article: @article, type: 'turbo_stream', action: 'replace', targets: ".c-list-item--#{@article.id}"}, location:  article_path(@article)
                    # redirect_to @article
                    #end turbo format
                end
                    #end format
            end
           
                # render partial: "articles/item_id", object: @article, as: "article"
        else
            # render "new"
            render turbo_stream: turbo_stream.replace('c-article__form--stream',
                                partial: "articles/form",
                                locals: { article: @article, categories: $categories })

            # end if save
        end

           
        #neu co params truyen den tu articles va @article update thanh cong
        # respond_to do |format|
        #   if @article.save
        #     # format.html{ redirect_to articles_url, notice: 'Article was successfully created.'}
        #     format.turbo_stream do
        #       render turbo_stream: turbo_stream.replace("c-list-item--#{@article.id}",
        #                           partial: "articles/item_id",
        #                           locals: { article: @article })
        #     end
        
        #   else
        #     format.turbo_stream do
        #       render turbo_stream: turbo_stream.replace('c-article__form--stream',
        #                           partial: "articles/form",
        #                           locals: { article: @article, categories: $categories })
        #     end
        #   end
        # end
    
    end

    def update_bak
    
        @article = Article.find(params[:id])
        @id = params[:id]
        #neu co params truyen den tu articles va @article update thanh cong
        respond_to do |format|
        if @article.update(articles_params)
            # format.html{ redirect_to articles_url, notice: 'Article was successfully created.'}
            format.turbo_stream do
                cat = [];
                if (@article.categories.kind_of?(Array))
                    @article.categories.each  do |category| 
                        if (!category.empty?)
                            cat_id = category.gsub(" ","_")
                            cat.push(cat_id);
                        end
                    #end each categories
                    end 
                else 
                    cat.push(".uncategorized");
                # end of if check article.categories
                end 
                # "<turbo-stream action='replace' targets='c-list-item--#{@id}'>"
                #     '<template>'
                    render partial: "articles/item_id", object: @article, as: "article"
                #     '</template>'
                # "</turbo-stream>"
                # render turbo_stream: turbo_stream.replace("c-list-item--#{@id}",
                #                     partial: "articles/item_id",
                #                     rel: "test",
                #                     locals: { article: @article })
                # end turbor format
            end
        
        else
            format.turbo_stream do
            render turbo_stream: turbo_stream.replace('c-article__form--stream',
                                partial: "articles/form",
                                locals: { article: @article, categories: $categories })
            end
        end
        end
        
    end

    # delete
    def destroy
        @article = Article.find(params[:id])
        @id = params[:id];
        @article.destroy
        render turbo_stream: turbo_stream.remove("c-list-item--#{@id}");
    end

    private 
        def articles_params
        #params permit  tat ca thong so cho  truyen vao
        params.require(:article).permit(:body,:title, :status, :price, :picture, categories:[])
        end
end
