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
    	initCalendar = function(vue){
			window.calendar = $('#calendar-app').fullCalendar({
						contentHeight:500,
						events:vue.events,
						eventDrop: function(event, delta, revertFunc) {

					        /*alert(event.title + " was dropped on " + event.start.format());

					        if (!confirm("Are you sure about this change?")) {
					            revertFunc();
					        }*/
					        if(event.editable == "0" || event.startEditable == "0"){
					        	vue.$notify("Event kann nicht verschoben werden");
								revertFunc();
					        }
					        else{
					        	vue.$http.post("admin/api/calendar/update",
					        		{dbid:event.id,
					        		 key:"start",
					        		 val:event.start.format()
					        		}).then(function(t){
										if(t.data == false){
											this.$notify(t.data,{timeout:0});
											revertFunc();
										}
										else{
											this.$notify("Event erfolgreich verschoben");
										}				
									},function(t){
											this.$notify(t.data,{timeout:0})
											revertFunc();
								});
					        }
					    },
					    eventResize: function(event, delta, revertFunc) {

					        if(event.editable == "0" || event.durationEditable == "0"){
					        	vue.$notify("Die Länge des Events kann nicht verändert werden");
								revertFunc();
					        }
					        else{
					        	vue.$http.post("admin/api/calendar/update",
					        		{dbid:event.id,
					        		 key:"end",
					        		 val:event.end.format()
					        		}).then(function(t){
										if(t.data == false){
											this.$notify(t.data,{timeout:0});
											revertFunc();
										}
										else{
											this.$notify("Event erfolgreich geändert");
										}				
									},function(t){
											this.$notify(t.data,{timeout:0})
											revertFunc();
								});
					        }
					    }
    			
						
			});
    	};


    	this.$http.post("admin/api/calendar/").then(function(t){
				if(t.data == false){
					this.$notify("Fehler beim laden des Kalenders");
				}
				else{
					this.events = t.data.$data;
					initCalendar(this);
				}				
			},function(t){
					this.$notify(t.data,{timeout:0})
		});
		

  }
};
Vue.ready(module.exports);
