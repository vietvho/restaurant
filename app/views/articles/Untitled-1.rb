<% if (article.categories && article.categories.kind_of?(Array)) %>
    <% @article.categories.each do |category| %>
        <$= category %>
    <% end %>
<% end %>