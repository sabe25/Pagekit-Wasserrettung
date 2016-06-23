module.exports={
	el:"#calendar",
	data:{
		events:window.$data
		
	},
	methods:{
		new_event:function(){
			window.location= "calendar/new_event";
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
    	
		$('#calendar-app').fullCalendar({
			contentHeight:500,
			events:this.events
    	});

  }
};
Vue.ready(module.exports);
