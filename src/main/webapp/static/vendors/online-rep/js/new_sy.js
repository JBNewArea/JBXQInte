$(function(){
	/*登陆注册五个切换*/
	$(function(){
		$('.main1_11 span').last().css('border-bottom','none');
		$('.main1_11>p').each(function(i){
			$(this).click(function(){
				$(this).addClass('on').siblings().removeClass('on');
				$('.main1_12>li').eq(i).stop(true).show().siblings().hide();
			})	
		})	
	});
	
	/*个人hover*/
	$('.main3_01_gr_main>li>a').hover(function(){
		$(this).find('span').css('background-image','url(http://www.jszwfw.gov.cn/picture/2/1706131403047034802.png)');
		$(this).find('em').css('color','#0cc6ce');
	},function(){
		$(this).find('span').css('background-image','url(http://www.jszwfw.gov.cn/picture/2/1706131403047464308.png)');
		$(this).find('em').css('color','#333');
	});
	/*法人hover*/

	$('.main3_01_fr_main>li>a').hover(function(){
		$(this).find('span').css('background-image','url(http://www.jszwfw.gov.cn/picture/2/1706131403047034802.png)');
		$(this).find('em').css('color','#7a99ed');
	},function(){
		$(this).find('span').css('background-image','url(http://www.jszwfw.gov.cn/picture/2/1706131403047464308.png)');
		$(this).find('em').css('color','#333');
	});
	
	/*个人点击展开收起*/
	var gr=1;
	$('.main3_01_gr_main>li:gt(15)').css('display','none');
	$('.main3_01_gr_more').click(function(){
		if (gr==1) {
			$('.main3_01_gr_main>li:gt(15)').slideDown();
			$(this).text('收起');
			gr=2;
		}else{
			$('.main3_01_gr_main>li:gt(15)').slideUp();
			$(this).text('查看全部');
			gr=1;
		}
	})

	/*法人点击展开收起*/
	var fr=1;
	$('.main3_01_fr_main>li:gt(15)').css('display','none');
	$('.main3_01_fr_more').click(function(){
		if(fr==1){
			$('.main3_01_fr_main>li:gt(15)').slideDown();
			$(this).text('收起');
			fr=2;
		}else{
			$('.main3_01_fr_main>li:gt(15)').slideUp();
			$(this).text('查看全部');
			fr=1;
		};
	});


	/*行政服务与便民服务切换*/
	$('.main3_tab>li').each(function(i){
		$(this).click(function(){
			$(this).addClass('on').siblings('li').removeClass('on');
			$('.main3_list').eq(i).stop(true).show().siblings('.main3_list').hide();
		});
	});
	$(".bmfw .bmfw_tab li").click(function(){
       
		var i=$(this).index();
		$(this).addClass("on").siblings().removeClass("on");         
		$(this).parents(".bmfw").siblings().find("li").removeClass("on");
        $(this).parents(".bmfw_1200").siblings().find(".bmfw_list_01").eq(i).addClass("on").siblings().removeClass("on");
		$(this).parents(".bmfw").siblings().find(".bmfw_list_01").removeClass("on");
	});
	$('.main3_01_gr_main span').eq(0).addClass('gr_bg_01');
	$('.main3_01_gr_main span').eq(1).addClass('gr_bg_02');
	$('.main3_01_gr_main span').eq(2).addClass('gr_bg_03');
	$('.main3_01_gr_main span').eq(3).addClass('gr_bg_04');
	$('.main3_01_gr_main span').eq(4).addClass('gr_bg_05');
	$('.main3_01_gr_main span').eq(5).addClass('gr_bg_06');
	$('.main3_01_gr_main span').eq(6).addClass('gr_bg_07');
	$('.main3_01_gr_main span').eq(7).addClass('gr_bg_08');
	$('.main3_01_gr_main span').eq(8).addClass('gr_bg_09');
	$('.main3_01_gr_main span').eq(9).addClass('gr_bg_10');
	$('.main3_01_gr_main span').eq(10).addClass('gr_bg_11');
	$('.main3_01_gr_main span').eq(11).addClass('gr_bg_12');
	$('.main3_01_gr_main span').eq(12).addClass('gr_bg_13');
	$('.main3_01_gr_main span').eq(13).addClass('gr_bg_14');
	$('.main3_01_gr_main span').eq(14).addClass('gr_bg_15');
	$('.main3_01_gr_main span').eq(15).addClass('gr_bg_16');
	$('.main3_01_gr_main span').eq(16).addClass('gr_bg_17');
	$('.main3_01_gr_main span').eq(17).addClass('gr_bg_18');
	$('.main3_01_gr_main span').eq(18).addClass('gr_bg_19');
	$('.main3_01_gr_main span').eq(19).addClass('gr_bg_20');
	$('.main3_01_gr_main span').eq(20).addClass('gr_bg_21');
	$('.main3_01_gr_main span').eq(21).addClass('gr_bg_22');
	$('.main3_01_gr_main span').eq(22).addClass('gr_bg_23');
	$('.main3_01_gr_main span').eq(23).addClass('gr_bg_24');
	$('.main3_01_gr_main span').eq(24).addClass('gr_bg_25');
	$('.main3_01_gr_main span').eq(25).addClass('gr_bg_26');
	$('.main3_01_gr_main span').eq(26).addClass('gr_bg_27');
	$('.main3_01_gr_main span').eq(27).addClass('gr_bg_28');
	$('.main3_01_gr_main span').eq(28).addClass('gr_bg_29');
	$('.main3_01_gr_main span').eq(29).addClass('gr_bg_30');
	$('.main3_01_gr_main span').eq(30).addClass('gr_bg_31');
	$('.main3_01_gr_main span').eq(31).addClass('gr_bg_32');
	$('.main3_01_gr_main span').eq(32).addClass('gr_bg_33');
	$('.main3_01_gr_main span').eq(33).addClass('gr_bg_34');
	$('.main3_01_gr_main span').eq(34).addClass('gr_bg_35');
	$('.main3_01_gr_main span').eq(35).addClass('gr_bg_36');
	$('.main3_01_gr_main span').eq(36).addClass('gr_bg_37');
	$('.main3_01_gr_main span').eq(37).addClass('gr_bg_38');
	$('.main3_01_gr_main span').eq(38).addClass('gr_bg_39');
	$('.main3_01_gr_main span').eq(39).addClass('gr_bg_40');
	
	$('.main3_01_fr_main span').eq(0).addClass('fr_bg_01');
	$('.main3_01_fr_main span').eq(1).addClass('fr_bg_02');
	$('.main3_01_fr_main span').eq(2).addClass('fr_bg_03');
	$('.main3_01_fr_main span').eq(3).addClass('fr_bg_04');
	$('.main3_01_fr_main span').eq(4).addClass('fr_bg_05');
	$('.main3_01_fr_main span').eq(5).addClass('fr_bg_06');
	$('.main3_01_fr_main span').eq(6).addClass('fr_bg_07');
	$('.main3_01_fr_main span').eq(7).addClass('fr_bg_08');
	$('.main3_01_fr_main span').eq(8).addClass('fr_bg_09');
	$('.main3_01_fr_main span').eq(9).addClass('fr_bg_10');
	$('.main3_01_fr_main span').eq(10).addClass('fr_bg_11');
	$('.main3_01_fr_main span').eq(11).addClass('fr_bg_12');
	$('.main3_01_fr_main span').eq(12).addClass('fr_bg_13');
	$('.main3_01_fr_main span').eq(13).addClass('fr_bg_14');
	$('.main3_01_fr_main span').eq(14).addClass('fr_bg_15');
	$('.main3_01_fr_main span').eq(15).addClass('fr_bg_16');
	$('.main3_01_fr_main span').eq(16).addClass('fr_bg_17');
	$('.main3_01_fr_main span').eq(17).addClass('fr_bg_18');
	$('.main3_01_fr_main span').eq(18).addClass('fr_bg_19');
	$('.main3_01_fr_main span').eq(19).addClass('fr_bg_20');
	$('.main3_01_fr_main span').eq(20).addClass('fr_bg_21');
	$('.main3_01_fr_main span').eq(21).addClass('fr_bg_22');
	$('.main3_01_fr_main span').eq(22).addClass('fr_bg_23');
	$('.main3_01_fr_main span').eq(23).addClass('fr_bg_24');
	$('.main3_01_fr_main span').eq(24).addClass('fr_bg_25');
	$('.main3_01_fr_main span').eq(25).addClass('fr_bg_26');
	$('.main3_01_fr_main span').eq(26).addClass('fr_bg_27');
	$('.main3_01_fr_main span').eq(27).addClass('fr_bg_28');
	$('.main3_01_fr_main span').eq(28).addClass('fr_bg_29');
	$('.main3_01_fr_main span').eq(29).addClass('fr_bg_30');
	$('.main3_01_fr_main span').eq(30).addClass('fr_bg_31');
	$('.main3_01_fr_main span').eq(31).addClass('fr_bg_32');
	$('.main3_01_fr_main span').eq(32).addClass('fr_bg_33');
	$('.main3_01_fr_main span').eq(33).addClass('fr_bg_34');
	$('.main3_01_fr_main span').eq(34).addClass('fr_bg_35');
	$('.main3_01_fr_main span').eq(35).addClass('fr_bg_36');
	$('.main3_01_fr_main span').eq(36).addClass('fr_bg_37');
	$('.main3_01_fr_main span').eq(37).addClass('fr_bg_38');
	$('.main3_01_fr_main span').eq(38).addClass('fr_bg_39');
	$('.main3_01_fr_main span').eq(39).addClass('fr_bg_40');
	
	$('.bmfw_list_11_12 li:nth-child(3n)').css('margin','0');
})