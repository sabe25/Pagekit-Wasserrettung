!function(t){function n(o){if(e[o])return e[o].exports;var i=e[o]={exports:{},id:o,loaded:!1};return t[o].call(i.exports,i,i.exports,n),i.loaded=!0,i.exports}var e={};return n.m=t,n.c=e,n.p="",n(0)}([function(t,n){
t.exports={
	el:"#termine-id",
	data: function () {
        return window.$data;
    },
	methods:{
		save:function(){
			var isNaN = function(value) {
				return Number.isNaN(Number(value));
			};
			if(isNaN(this.id)) this.id= 0;
			this.$http.post("admin/termine/save",{id:this.id,title:this.Title,desc:this.Description,date:this.date}).then(function(t){
				if(t.data == 1){
					this.$notify("Termin gespeichert.");
					window.location = window.location.href.replace("/id", "");
				}
				else{
					this.$notify(t.data,"danger")
				}
			},
			function(t){
				this.$notify(t.data,{timeout: 0,status:'danger'})
			})
		}
	}
},
Vue.ready(t.exports)}
]);

$(function() {
	initdatepicker();
	
});
function initdatepicker(){
	/*var element = document.getElementById("term-date");
	var datepicker = UIkit.datepicker(element, {  });*/
	$('.datepicker').each(function () {
	    var datepicker = $.UIkit.datepicker(this);
	});
}