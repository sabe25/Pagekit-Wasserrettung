(function ($) {

    $("<div/>",{class:"scroll-box title"}).appendTo(".title-container");
     $(".icon-item").each(function () {
         $(this).click(function () {
            $(".icon-item.selected").toggleClass("selected");
            $(this).toggleClass("selected");
            var id = $(this).data("id");
            $(".scroll-box.text").css("top", (id-1) * -500);
         });
         $(this).on("mouseenter",function(){
           $(this).toggleClass("h");
           var id = $(this).data("id");
           $(".scroll-box.title").css("top", (id-1) * -50);
         })
         $(this).on( "mouseleave", function() {
           $(this).toggleClass("h");
           setTimeout(function(){
             if($(".icon-item.h").length == 0){
               var id = $(".icon-item.selected").data("id");
               $(".scroll-box.title").css("top", (id-1) * -50);
             }
           },100);

         });
         var title = $(this).data("title");
         var ignore = $(this).data("ignore");
         if(!ignore){
           $(".scroll-box.title").append($("<div/>",{class:"icon-title"}).append($("<h2/>").html(title)));
         }
     })

 })(jQuery);
