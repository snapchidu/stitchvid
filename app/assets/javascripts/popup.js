/*!
 * Bootstrap YouTube Popup Player Plugin
 * http://lab.abhinayrathore.com/bootstrap-youtube/
 * https://github.com/abhinayrathore/Bootstrap-Youtube-Popup-Player-Plugin
 */
!function(o){function t(t){h.html(o.trim(t))}function e(o){b.html(o)}function u(){t(""),e("")}function a(o){c.css({width:o+2*m})}function i(o,t){return["//www.youtube.com/embed/",o,"?rel=0&showsearch=0&autohide=",t.autohide,"&autoplay=",t.autoplay,"&controls=",t.controls,"&fs=",t.fs,"&loop=",t.loop,"&showinfo=",t.showinfo,"&color=",t.color,"&theme=",t.theme,"&wmode=transparent"].join("")}function l(o,t,e){return['<iframe title="YouTube video player" width="',t,'" height="',e,'" ','style="margin:0; padding:0; box-sizing:border-box; border:0; -webkit-border-radius:5px; -moz-border-radius:5px; border-radius:5px; margin:',m-1,'px;" ','src="',o,'" frameborder="0" allowfullscreen seamless></iframe>'].join("")}function d(e){o.ajax({url:window.location.protocol+"//query.yahooapis.com/v1/public/yql",data:{q:"select * from json where url ='http://www.youtube.com/oembed?url=http://www.youtube.com/watch?v="+e+"&format=json'",format:"json"},dataType:"jsonp",success:function(o){o&&o.query&&o.query.results&&o.query.results.json&&t(o.query.results.json.title)}})}function r(o){var t=/^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=)([^#\&\?]*).*/,e=o.match(t);return e&&11==e[2].length?e[2]:!1}var n,s=null,c=null,h=null,b=null,m=5;n={init:function(n){if(n=o.extend({},o.fn.YouTubeModal.defaults,n),null==s){s=o('<div class="modal fade '+n.cssClass+'" id="YouTubeModal" role="dialog" aria-hidden="true">');var m='<div class="modal-dialog" id="YouTubeModalDialog"><div class="modal-content" id="YouTubeModalContent"><div class="modal-header"><button type="button" class="close" data-dismiss="modal">&times;</button><h4 class="modal-title" id="YouTubeModalTitle"></h4></div><div class="modal-body" id="YouTubeModalBody" style="padding:0;"></div></div></div>';s.html(m).hide().appendTo("body"),c=o("#YouTubeModalDialog"),h=o("#YouTubeModalTitle"),b=o("#YouTubeModalBody"),s.modal({show:!1}).on("hide.bs.modal",u)}return this.each(function(){var u=o(this),c=u.data("YouTube");c||(u.data("YouTube",{target:u}),o(u).bind("click.YouTubeModal",function(c){var h=n.youtubeId;""==o.trim(h)&&u.is("a")&&(h=r(u.attr("href"))),(""==o.trim(h)||h===!1)&&(h=u.attr(n.idAttribute));var b=o.trim(n.title);""==b&&(n.useYouTubeTitle?d(h):b=u.attr("title")),b&&t(b),a(n.width);var m=i(h,n),f=l(m,n.width,n.height);e(f),s.modal("show"),c.preventDefault()}))})},destroy:function(){return this.each(function(){o(this).unbind(".YouTubeModal").removeData("YouTube")})}},o.fn.YouTubeModal=function(t){return n[t]?n[t].apply(this,Array.prototype.slice.call(arguments,1)):"object"!=typeof t&&t?void o.error("Method "+t+" does not exist on Bootstrap.YouTubeModal"):n.init.apply(this,arguments)},o.fn.YouTubeModal.defaults={youtubeId:"",title:"",useYouTubeTitle:!0,idAttribute:"rel",cssClass:"YouTubeModal",width:640,height:480,autohide:2,autoplay:1,color:"red",controls:1,fs:1,loop:0,showinfo:0,theme:"light"}}(jQuery);