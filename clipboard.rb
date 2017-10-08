<h1>Please Select all retailers that carry <%=@brand.name%> </h1>
<form class="form-group" action="/add_stores_success/<%=@brand.id%>" method="post">
  <input type="hidden" name="_method" value="patch">
  <ul>
    <%if @stores.any? %>
      <%@stores.each do |store| %>

        <% @stores.each do |store| %>
            <% @brand.store_ids.each do |store_already_checked| %>
              <% if @brand.store_id == store_already_checked %>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="store_ids[]" value="<%= store.id() %>" checked><%= store.name() %>
                    </label>
                  </div>
              <% else %>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="store_ids[]" value="<%= store.id() %>"><%= store.name() %>
                  </label>
                </div>
              <% end %>
            <% end %>
        <% end %>
      <% end %>
    <% else %>
    <p>There are no brands yet.</p>
    <% end %>
  </ul>
  <button type="submit" class="btn btn-primary" >submit</button>
</form>
