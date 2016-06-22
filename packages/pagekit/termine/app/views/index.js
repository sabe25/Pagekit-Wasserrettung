!function(t){function n(o){if(e[o])return e[o].exports;var i=e[o]={exports:{},id:o,loaded:!1};return t[o].call(i.exports,i,i.exports,n),i.loaded=!0,i.exports}var e={};return n.m=t,n.c=e,n.p="",n(0)}([function(t,n){
t.exports={
	el:"#termine",
	data:{
		loc:0,
		options:[
			{text:"intern",value:1},
			{text:"extern",value:0}
		]
	},
	methods:{
		add:function(){
			window.location= "termine/id";
			/*this.$http.get("admin/termine/id/",{}).then(function(){
					this.$notify("Settings saved.")
				},function(t){
					this.$notify(t,"danger")
				})*/
		},
		delete:function(id){
			this.$http.post("admin/termine/delete",{id:id}).then(function(t){
				if(t.data == false){
					this.$notify("Error: 404");
				}
				else{
					this.$notify("Termin erfolgreich gelöscht");
					location.reload(); 
				}				
			},function(t){
					this.$notify(t.data,"danger")
				})
		},
		edit:function(id){
			window.location= "termine/id?dbid=" + id ;
			/*this.$http.get("admin/termine/id/",{}).then(function(){
					this.$notify("Settings saved.")
				},function(t){
					this.$notify(t,"danger")
				})*/
		},
		getParam : function(name) {
		    url = window.location.href;
		    name = name.replace(/[\[\]]/g, "\\$&");
		    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
		        results = regex.exec(url);
		    if (!results) return null;
		    if (!results[2]) return '';
		    return decodeURIComponent(results[2].replace(/\+/g, " "));
		}

	},
	watch:{
		'loc':function(){
			if(this.getParam('intern') != this.loc)
			window.location= "termine?intern=" + this.loc;
		}
	},
	created: function () {
    // `this` points to the vm instance
		this.loc = this.getParam('intern') || 0;
  }
},
Vue.ready(t.exports)}
]);
