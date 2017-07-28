$Header
<main class="main-content__container" id="main-content__container">
	<% if $BackgroundImage %>
		<% include FeaturedImage %>
	<% end_if %>

	<% if $YoutubeBackgroundEmbed %>
		<div class="backgroundvideo">
			<div id="ESEE" class="backgroundvideo__container" data-interchange="[http://img.youtube.com/vi/$YoutubeBackgroundEmbed/sddefault.jpg, small], [http://img.youtube.com/vi/$YoutubeBackgroundEmbed/maxresdefault.jpg, large]">
				<a href="http://www.youtube.com/embed/$YoutubeBackgroundEmbed" data-video="$YoutubeBackgroundEmbed" class="backgroundvideo__link">
				</a>
			</div>
		</div>
	<% end_if %>

	$Breadcrumbs

	<% if not $BackgroundImage %>
		<div class="column row">
			<div class="main-content__header">
				<h1>$Title</h1>
				<% if $Summary %>
					<div class="blogpost__summary">$Summary</div>
				<% end_if %>
			</div>
			<% if $FeaturedImage %>
				<% if FeaturedImage.Width >= 1200 %>
					<p class="post-image"><img class="dp-lazy" src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7" data-original="$FeaturedImage.CroppedFocusedImage(1200,700).URL" width="1200" height="700" alt="" role="presentation" /></p>
				<% end_if %>
			<% end_if %>
		</div>
	<% end_if %>

	$BlockArea(BeforeContent)

	<div class="row">
		<article role="main" class="main-content main-content--with-padding <% if $Children || $Menu(2) || $SidebarBlocks ||  $SidebarView.Widgets %>main-content--with-sidebar<% else %>main-content--full-width<% end_if %>">
			$BlockArea(BeforeContentConstrained)
			<div class="main-content__text">
				<% if $FeaturedImage %>
					<% if FeaturedImage.Width >= 700 && FeaturedImage.Width < 1200 %>
						<p class="post-image"><img class="dp-lazy" src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7" data-original="$FeaturedImage.SetWidth(840).URL" alt="" role="presentation" width="840" height="$FeaturedImage.SetWidth(840).Height" /></p>
					<% end_if %>
				<% end_if %>
				<div class="content">

					<div class="blogmeta clearfix">
						<% include ByLine %>
						<ul class="blogmeta__social">
							<li><a href="javascript:window.open('http://www.facebook.com/sharer/sharer.php?u=$AbsoluteLink', '_blank', 'width=400,height=500');void(0);"  title="Share on Facebook"><img src="{$ThemeDir}/dist/images/icon_facebook.png" alt="Share on Facebook"></a>
							</li>
							<li><a href="https://twitter.com/intent/tweet?text=$AbsoluteLink" title="Share on Twitter" target="_blank"><img src="{$ThemeDir}/dist/images/icon_twitter.png" alt="Share on Twitter"></a></li>
							<li><a href="javascript:window.open('https://www.linkedin.com/cws/share?url=$AbsoluteLink', '_blank', 'width=400,height=500');void(0);" title="Share on LinkedIn" target="_blank"><img src="{$ThemeDir}/dist/images/icon_linkedin.png" alt="share on linkedid"></a></li>
						</ul>
						<div class="clearfix"></div>
						<p><a class="blogmeta__support" href="https://goldrush.uiowa.edu/rvap" target="_blank">Support RVAP now</a></p>
					</div>
					<% if $FeaturedImage %>
						<% if FeaturedImage.Width < 700 %>
							<img class="dp-lazy" src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7" data-original="$FeaturedImage.URL" alt="" class="right post-image">
						<% end_if %>
					<% end_if %>
					$Content
<%-- 					<% if $ExternalURL %>
						<p><a href="$ExternalURL" class="button--shaded" target="_blank">$ExternalURLText</a></p>
					<% end_if %> --%>
				</div>
				$BlockArea(AfterContentConstrained)
				<% include TagsCategories %>
			</div>
			$Form
		</article>
		<aside class="sidebar dp-sticky">
			<% include SideNav %>
			<% if $SideBarView %>
				$SideBarView
			<% end_if %>
			$BlockArea(Sidebar)
		</aside>
	</div>
	$BlockArea(AfterContent)
</main>

<% if $RelatedNewsEntries %>
<div class="block_area block_area_aftercontent">
	<section class="content-block__container recentnews" aria-labelledby="RelatedNewsSection">
		<div class="content-block row">
			<div class="newsblock">
				<div class="column">
					<h3 class="newsblock-title text-center" id="RelatedNewsSection">Related News</h3>
				</div>
				<ul class="medium-up-3 ">
					<% loop $RelatedNewsEntries.limit(3) %>
						<li class="column column-block">
							<% include BlogCard %>
						</li>
					<% end_loop %>
				</ul>
			</div>
		</div>
	</section>
</div>
<% end_if %>









