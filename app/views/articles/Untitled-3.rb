<% output.each_with_index do |list_item, category|
    <div id="<%= category.dasherize %" class="c-tabs__content">
        <div class="c-list">
            <%= list_item %>
        </div>
    </div>
<% end %>