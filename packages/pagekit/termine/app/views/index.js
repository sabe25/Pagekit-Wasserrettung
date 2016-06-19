!function(t){function n(o){if(e[o])return e[o].exports;var i=e[o]={exports:{},id:o,loaded:!1};return t[o].call(i.exports,i,i.exports,n),i.loaded=!0,i.exports}var e={};return n.m=t,n.c=e,n.p="",n(0)}([function(t,n){
t.exports={
	el:"#termine",
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
		}
	}
},
Vue.ready(t.exports)}
]);
