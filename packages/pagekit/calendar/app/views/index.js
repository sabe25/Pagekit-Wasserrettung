module.exports={
	el:"#calendar",
	data:{
		events:window.$data,
		create_new_event:{
			e_title: "",
			e_description: "",
			e_start: "",
			e_end: ""
		}
		
	},
	methods:{
		new_event:function(){

			this.postnew(0,"title,description,start,end",this.e_title + "," + this.e_description + "," + this.e_start + "," + this.e_end, "Event erfolgreich erstellt");
			this.$http.post("admin/api/calendar/").then(function(t){
				if(t.data == false){
					this.$notify("Fehler beim laden des Kalenders");
				}
				else{
					this.events = t.data.$data;
					$('#calendar-app').fullCalendar('removeEvents');
					$('#calendar-app').fullCalendar('addEventSource',this.events);
}				
			},function(t){
					this.$notify(t.data,{timeout:0})
		});

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
		},
		postupdate:function(id,keys,vals,successMsg,calendar){
			this.$http.post("admin/api/calendar/update",
	        		{dbid:id,
	        		 key:keys,
	        		 val:vals
	        		}).then(function(t){
						if(t.data == false){
							this.$notify(t.data,{timeout:0});
							if(calendar != null)
								calendar.revertFunc();
						}
						else{
							this.$notify(successMsg);
						}				
					},function(t){
							this.$notify(t.data,{timeout:0})							
							if(calendar != null)
								calendar.revertFunc();
				});
		},
		postnew:function(id,keys,vals,successMsg){
			this.$http.post("admin/api/calendar/new",
	        		{key:keys,
	        		 val:vals
	        		}).then(function(t){
						if(t.data == false){
							this.$notify(t.data,{timeout:0});
						}
						else{
							//this.$notify(t.data,{timeout:0});
							this.$notify(successMsg);
						}				
					},function(t){
							this.$notify(t.data,{timeout:0})
				});
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

					        
					        if(event.editable == "0" || event.startEditable == "0"){
					        	vue.$notify("Event kann nicht verschoben werden");
								revertFunc();
					        }
					        else{
					        	vue.postupdate(event.id,"start", event.start.format(), "Event erfolgreich verschoben");
					        	
					        }
					    },
					    eventResize: function(event, delta, revertFunc) {

					        if(event.editable == "0" || event.durationEditable == "0"){
					        	vue.$notify("Die Länge des Events kann nicht verändert werden");
								revertFunc();
					        }
					        else{
					        	vue.postupdate(event.id,"end", event.end.format(), "Event erfolgreich geändert",this);
					        	
					        }
					    },
					    eventClick: function(calEvent, jsEvent, view) {

					        alert('Event: ' + calEvent.title);
					        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
					        alert('View: ' + view.name);

					        // change the border color just for fun
					        $(this).css('border-color', 'red');

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

		$('.datepicker').each(function () {
	    	var datepicker = $.UIkit.datepicker(this);
		});

  }
};
Vue.ready(module.exports);
