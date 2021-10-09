class ArticlesController < ApplicationController
    #http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show] 
    $categories = ["Iced Coffee", "Hot Coffee", "Fruit Juice"]
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
        @mob = params[:mob];
    end

    def new
        @article = Article.new()
    end

    def create
        # newu co params truyen den tu articles
        @article = Article.new(articles_params.except(:mob))
        if @article.save
            if (articles_params[:mob].nil?) 
                p 'new save'
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
                p 'new redirect'

                redirect_to @article
            end
        else
            # render "new"
            if (articles_params[:mob].nil?) 
                p 'new rerender turbo'

                render turbo_stream: turbo_stream.replace('c-article__form--stream',
                partial: "articles/form",
                locals: { article: @article, categories: $categories })
            else
                p 'new rerender new'
                render partial: "articles/form", locals: { article: @article, categories: $categories, params: articles_params }, layout: 'application'
            end
            # end if save
        end

    end

    def edit 
        @article = Article.find(params[:id])
    
    end

    def update
        # newu co params truyen den tu articles
        @article = Article.find(params[:id])
        @id = @article.id;
        if @article.update(articles_params.except(:mob))
            if (articles_params[:mob].nil?) 
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
            else
                redirect_to @article
                # render partial: "articles/item_id", formats: [:html], locals: { article: @article}, location:  article_path(@article)
            end
        else
            # render "edit"
            
            if (params[:mob].nil?) 
                render turbo_stream: turbo_stream.replace('c-article__form--stream',
                                partial: "articles/form",
                                locals: { article: @article, categories: $categories })
            else
                render partial: "articles/form", locals: { article: @article, categories: $categories }
            end

            # end if save
        end

           
        #neu co params truyen den tu articles va @article update thanh cong
    
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
        params.require(:article).permit(:body,:title,:mob, :status, :price, :picture, categories:[])
        end
end
