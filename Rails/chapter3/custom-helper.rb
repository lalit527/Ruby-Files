<div class="feed"> 
  <% if @project %> 
    <%= link_to "Subscribe to #{@project.name} alerts.", 
      project_alerts_url(@project, :format => :rss), 
      :class => "feed_link" %>
  <% else %>
    <%= link_to "Subscribe to these alerts.", 
      alerts_url(format => :rss), 
      :class => "feed_link" %>

  <% end %> 
</div>

## helper rss_link
def rss_link(project = nil) 
  if project 
    link_to "Subscribe to #{project.name} alerts.", 
            project_alerts_url(project, :format => :rss), 
            :class => "feed_link"

  else
    link_to "Subscribe to these alerts.", 
            alerts_url(:format => :rss), 
            :class => "feed_link"
  end 
end

## alerts_rss_url
def alerts_rss_url(project = nil)
  if project
    project_alerts_url(project, :format => :rss)
  else
    alerts_url(:rss)
  end
end

## updated helper rss_link
def rss_link(project = nil) 
  if project 
    link_to "Subscribe to #{project.name if project} alerts.", 
            alerts_rss_url(project, :format => :rss), 
            :class => "feed_link"

end

## updated template
<div class="feed"> 
  <%= rss_link(@project) %> 
</div>