String.prototype.getChLength=function(){return this.replace(/[\u4e00-\u9fa5]/g,'  ').length;}
String.prototype.getDcLength=function(){return this.replace(/[^x00-xff]/g,'  ').length;}
String.prototype.trim=function(){return this.replace(/(^\s*)|(\s*$)/g,'');}
String.prototype.ltrim=function(){return this.replace(/(^\s*)/g,'');}
String.prototype.rtrim=function(){return this.replace(/(\s*$)/g,'');}
String.prototype.isNull=function(){return this.trim().length==0?true:false;}
String.prototype.isInteger=function(){var reg=/^([0-9]|[1-9][0-9]*)$/;return this.Regular(reg);}
String.prototype.isTimeInt=function(){var reg=/^([0-9]|[0-9][0-9]|[1-9][0-9]*)$/;return this.Regular(reg);}
String.prototype.isDouble=function(){var reg=/^[0-9]+(.[0-9]{1,2})?$/;return this.Regular(reg);}
String.prototype.isLetter=function(){var reg=/^[a-zA-Z]+$/;return this.Regular(reg);}
String.prototype.isChinese=function(){var reg=/^[\u0391-\uFFE5]+$/;return this.Regular(reg);}
String.prototype.isHalfOrChinese=function(){var reg=/^[^\uFF00-\uFFFF]+$/;return this.Regular(reg);}
String.prototype.isHalfWidth=function(){var reg=/^[\u0000-\u00FF]+$/;return this.Regular(reg);}
String.prototype.isFullWidth=function(){var reg=/^[\uFF00-\uFFFF]+$/;return this.Regular(reg);}
String.prototype.isVersion=function(){var reg=/^([a-zA-Z_])([a-zA-Z0-9_.])*$/;return this.Regular(reg);}
String.prototype.isString=function(){var reg=/^[^']*$/;return this.Regular(reg);}
String.prototype.isEmail=function(){var reg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;return this.Regular(reg);}
String.prototype.isIP=function(){var reg=/^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/;return this.Regular(reg);}
String.prototype.isDate=function(){var reg=/^((\d{2}(([02468][048])|([13579][26]))[\-\/\s]?((((0?[13578])|(1[02]))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\-\/\s]?((0?[1-9])|([1-2][0-9])))))|(\d{2}(([02468][1235679])|([13579][01345789]))[\-\/\s]?((((0?[13578])|(1[02]))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\-\/\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))?$/;return this.Regular(reg);}
String.prototype.isDateTime=function(){var reg=/^((\d{2}(([02468][048])|([13579][26]))[\-\/\s]?((((0?[13578])|(1[02]))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\-\/\s]?((0?[1-9])|([1-2][0-9])))))|(\d{2}(([02468][1235679])|([13579][01345789]))[\-\/\s]?((((0?[13578])|(1[02]))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\-\/\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\-\/\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))(\s(((0?[0-9])|(1[0-9])|(2[0-3]))\:([0-5]?[0-9])((\s)|(\:([0-5]?[0-9])))))?$/;return this.Regular(reg);}
String.prototype.isZIP=function(){var reg=/^\d{6}$/;return this.Regular(reg);}
String.prototype.isIDCard=function(){var reg=/(\d{15}$)|(\d{17}(?:\d|x|X)$)/;return this.Regular(reg);}
String.prototype.charEncode=function(){return this.replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/\'/g,'&apos;').replace(/\"/g,'&quot;').replace(/ /g,'&nbsp;');}
String.prototype.charDecode=function(){return this.replace(/&amp;/g,'&').replace(/&lt;/g,'<').replace(/&gt;/g,'>').replace(/&apos;/g,'\'').replace(/&quot;/g,'\"').replace(/&nbsp;/g,' ');}
String.prototype.Regular=function(reg){var result=true;if(this.length>0){if(!reg.test(this)){result=false;}}
return result;}
Date.prototype.format=function(date){var o={"M+":this.getMonth()+1,"d+":this.getDate(),"h+":this.getHours(),"m+":this.getMinutes(),"s+":this.getSeconds(),"q+":Math.floor((this.getMonth()+3)/3),"S":this.getMilliseconds()};if(/(y+)/.test(date)){date=date.replace(RegExp.$1,(this.getFullYear()+"").substr(4-RegExp.$1.length));}
for(var k in o){if(new RegExp("("+k+")").test(date)){date=date.replace(RegExp.$1,(RegExp.$1.length==1)?(o[k]):(("00"+o[k]).substr((""+o[k]).length)));}}
return date;}