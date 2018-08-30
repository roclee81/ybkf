(function(w){
    var x = {
        dom:{
            dMenu:$(".xMenu"),
            dRightbox:$(".xRightbox")
        },
        init:function(){
            var _self = this;
            _self.addEvent();
        },
        addEvent:function(){
            var _self = this;
            $(window).resize();
            _self.dom.dMenu.on(function(){

            });
            //侧栏导航
            _self.dom.dMenu.delegate("a","click",function(){
                var _this = $(this),
                    _ulArr = _self.dom.dMenu.find("ul"),
                    _ul = _this.next(),
                    _em = _this.find("em");

                if(!_this.hasClass("xMenuTwo")&!_this.hasClass("xMenuThree")){
                	
                    $(".xMenuonefocus1").removeClass("xMenuonefocus1");
                    $(".xMenuFocus").removeClass("xMenuFocus");
                    _this.removeClass("default-li-bg");
                    _this.addClass("active-li-bg");
                    _this.parent().siblings().find(".active-li-bg").removeClass("active-li-bg").addClass("default-li-bg");

                    _ulArr.slideUp(1);
                    if(_this.hasClass("xMenuOne")){                    	
                        _ul.toggle();
                        //有二级栏目，触发二级栏目第一个点击
                        _this.addClass("xMenuonefocus1");
                        _ul.find(".once").trigger("click");
                    }else{

                        var _rel = _this.attr("data-rel");
                        _this.addClass("xMenuonefocus1");

                        _self.dom.dRightbox.load(_rel,function(){
                            $(window).resize();
                            return true;
                        });
                    }
                }else if(_this.hasClass("xMenuTwo")){ //二级栏目点击
                    var _rel = _this.attr("data-rel"),_name = _this.text();
                    _ulArr.find(".xMenuFocus").removeClass("xMenuFocus");
                    _this.find("em").addClass("xMenuFocus");
                    if(_this.hasClass("xMenuTwo")){
                        _this.parent().siblings().find("ul").slideUp(1);
                        _this.parent().siblings().find(".xMenuonefocus1").removeClass("xMenuonefocus1");
                        _this.parent().siblings().find(".xMenuonefocus1").removeClass("xMenuonefocus1");
                        _self.dom.dRightbox.load(_rel,function(){
                            $(window).resize();
                        });
                    }

                }

                else if(_this.hasClass("xMenuThree")){
                    _ul.toggle();

                    _this.parent().siblings().find('ul').hide();
                    _this.parent().siblings().find(".xMenuonefocus1").removeClass("xMenuonefocus1");
                    _ulArr.find(".xMenuFocus").removeClass("xMenuFocus");

                    var _rel = _this.attr("data-rel"),_name = _this.text();
                    _this.find("em").addClass("xMenuFocus");
                    _this.addClass("xMenuonefocus1");

                    _self.dom.dRightbox.load(_rel,function(){
                        $(window).resize();
                    });


                }
            });

           /* $(".xMenu a:eq(0)").trigger("click");*/

        }

    };
    x.init();
})(window);