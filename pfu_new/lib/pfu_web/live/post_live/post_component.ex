defmodule PfuWeb.PostLive.PostComponent do
  use PfuWeb, :live_component

  def render(assigns) do
    #https://www.w3schools.com/w3css/img_avatar6.png
    ~L"""
      <%= if @current_user do %>
      <div id="post-<%= @post.id %>" class="post_card">
        <div class="row">
          <div class="column column-10">
            <div class="post_avatar">
              <img src="https://www.w3schools.com/w3css/img_avatar2.png" alt="Avatar" class="avatar">
            </div>
          </div>
          <div class="column column-90 post-body">
            <b>@<%= @user.username %></b>
            <br/>
            <%= @post.body %>
          </div>
        </div>

        <div class="post_card" style="background-color: rgb(0, 0, 0);">
          <div class="post_line">
            <a href="#" phx-click="like" phx-target="<%= @myself %>"
            <i class="fa-regular fa-thumbs-up" style="color: rgb(255, 255, 255);"></i> <%= @post.likes_count %>
            </a>
            <a href="#" phx-click="unlike" phx-target="<%= @myself %>"
            <i class="fa-regular fa-thumbs-down" style="color: rgb(255, 255, 255);"></i>
            </a>
          </div>
          <div class="post_line">
            <a href="#" phx-click="repost" phx-target="<%= @myself %>"
              <i class="fa fa-retweet" style="color: rgb(255, 255, 255);"></i> <%= @post.reposts_count %>
            </a>
          </div>
          <%= if @current_user.id == @user.id || @current_user.username == "root" do %>
          <div class="post_line">
            <%= live_patch to: Routes.post_index_path(@socket, :edit, @post.id) do %>
              <i class="fa fa-edit" style="color: rgb(255, 255, 255);"></i>
            <% end %>
            <%= link to: "#", phx_click: "delete", phx_value_id: @post.id, data: [confirm: "Remover?"] do %>
              <i class="fa fa-trash" style="color: rgb(255, 255, 255);"></i>
            <% end %>
          </div>
          <% end %>
        </div>
      </div>
      <% end %>
    """
  end

  def handle_event("like", _, socket) do
    Pfu.Timeline.inc_likes(socket.assigns.post, 1)
    {:noreply, socket}
  end
  def handle_event("unlike", _, socket) do
    Pfu.Timeline.inc_likes(socket.assigns.post, -1)
    {:noreply, socket}
  end
  def handle_event("repost", _, socket) do
    Pfu.Timeline.inc_reposts(socket.assigns.post)
    {:noreply, socket}
  end
end
