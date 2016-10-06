module.exports={
	el:"#calendar",
	data:{
		events:window.$data,
		create_new_event:{
			e_title: "",
			e_description: "",
			e_start: "",
			e_end: "",
			e_className:""
		},
		d_id:"",
		d_title: "",
		d_description: "",
		d_start: "",
		d_end: "",
		d_edit: false,
		d_editable:false,
		username: window.$pagekit.user.name,
		classOptions:[
			{name:"Veranstaltung",val:"fc-event-veranstaltung"},
			{name:"Große Veranstaltung",val:"fc-event-big"},
			{name:"Dienst",val:"fc-event-dienst"}],
		new_event_permission:""
		
		
	},
	methods:{
		new_event:function(){

			this.postnew("title,description,start,end,className",this.e_title + "|" + this.e_description + "|" + this.e_start + "|" + this.e_end + "|" + this.e_className, "Event erfolgreich erstellt");
			this.$http.post("admin/api/calendar/").then(function(t){
				if(t.data == false){
					this.$notify("Fehler beim laden des Kalenders");
				}
				else{
					this.events = t.data.$data.result;
					$('#calendar-app').fullCalendar('removeEvents');
					$('#calendar-app').fullCalendar('addEventSource',this.events);
}				
			},function(t){
					this.$notify(t.data,{timeout:0})
		});

		},
		delete:function(){
			this.$http.post("admin/api/calendar/delete",{id:this.d_id}).then(function(t){
				if(t.data == false){
					this.$notify("Error: 404");
				}
				else{
					this.$notify("Event erfolgreich gelöscht");
					window.calendar.fullCalendar('removeEvents', this.d_id);
				}				
			},function(t){
					this.$notify(t.data,"danger")
				})
		},
		updateContent:function(){
			this.postupdate(this.d_id, "title|description", this.d_title + "|" + this.d_description,"Event erfolgreich geändert");
			var event = window.calendar.fullCalendar( 'clientEvents', this.d_id );	
			event[0].title= this.d_title;
			event[0].description = this.d_description;
			window.calendar.fullCalendar('updateEvent', event[0]);
		},
		getTermine:function(){
				this.$http.post("admin/api/calendar/gettermine").then(function(t){
						if(t.data == false){
							this.$notify("Fehler beim laden der Termine");
						}
						else{
							if(t.data.$data){
								var termine = t.data.$data;
								var tevents = {events:[]};

								for (var i = 0; i < termine.length; i++) {
									tevents.events[i] = {title :termine[i].Title,
												description: termine[i].Description,
												start:termine[i].Date,
												editable:false,
												className:"fc-event-termin"};
								}
								window.calendar.fullCalendar("addEventSource", tevents);
							}
							
						}				
					},function(t){
							this.$notify(t.data,{timeout:0})
				});
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
		postnew:function(keys,vals,successMsg){
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
	
	created: function () {
    // `this` points to the vm instance
    	initCalendar = function(vue){
			window.calendar = $('#calendar-app').fullCalendar({
						contentHeight:500,
						events:vue.events,
						firstDay:1,
						eventDrop: function(event, delta, revertFunc) {

					        
					        if(!event.editable || !event.startEditable){
					        	vue.$notify("Event kann nicht verschoben werden");
								revertFunc();
					        }
					        else{
					        	vue.postupdate(event.id,"start", event.start.format(), "Event erfolgreich verschoben");
					        	
					        }
					    },
					    eventResize: function(event, delta, revertFunc) {

					        if(!event.editable || !event.durationEditable){
					        	vue.$notify("Die Länge des Events kann nicht verändert werden");
								revertFunc();
					        }
					        else{
					        	vue.postupdate(event.id,"end", event.end.format(), "Event erfolgreich geändert",this);
					        	
					        }
					    },
					    eventClick: function(calEvent, jsEvent, view) {
					    	vue.d_id= calEvent.id;
					    	vue.d_title = calEvent.title;
					    	vue.d_description = calEvent.description;
					    	vue.d_start = calEvent.start;
					    	vue.d_end = calEvent.end;
					    	vue.d_edit = false;
					    	vue.d_editable =calEvent.editable;
					    	var modal = UIkit.modal("#modal_diplay_event");
							modal.show();
								
					    },
					    droppable: true,
					    drop: function(date) {
					        var event = $('#' +this.id).data("event");
					        if(event != undefined)
					        	vue.postnew("title,description,start,end,className",event.title + "|" + event.description + "|" + date.format() + "|" + date.format() + "|" + event.className, "ich bin am " + date.format() + " im Einsatz");
					        else
					        	vue.$notify("Es wurde keine Informationen zu diesem Event gefunden","danger");
					    }
    			
						
			});
    	};


    	this.$http.post("admin/api/calendar/").then(function(t){
				if(t.data == false){
					this.$notify("Fehler beim laden des Kalenders");
				}
				else{
					this.events = t.data.$data.result;
					this.new_event_permission = t.data.$data.newEvent

					initCalendar(this);
					this.getTermine();
				}				
			},function(t){
					this.$notify(t.data,{timeout:0})
		});

		$('.datepicker').each(function () {
	    	var datepicker = $.UIkit.datepicker(this);
		});
		$('.ui-draggable').draggable({
		    revert: true,      // immediately snap back to original position
		    revertDuration: 0  //
		});
		var selfevent = $("#self-event");
		selfevent.data('event', {
			title:this.username,
			description:"Ich bin hier im Einsatz",
			className:"fc-event-dienst",
			editable:true
			});
  }
};
Vue.ready(module.exports);
