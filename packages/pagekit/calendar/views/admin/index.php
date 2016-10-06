
<?php $view->script('jquery-ui', 'app/assets/jquery-ui/jquery-ui.min.js', ['vue', 'jquery']) ?>
<?php $view->script('moment', 'calendar:assets/fullcalendar/lib/moment.min.js', ['vue', 'jquery']) ?>
<?php $view->script('fullcalendar', 'calendar:assets/fullcalendar/fullcalendar.js', ['vue', 'jquery']) ?>

<?php $view->script('datepicker', '/app/assets/uikit/js/components/datepicker.js', ['vue', 'jquery', 'uikit']) ?>
<?php $view->script('calendar', 'calendar:app/bundle/index.js', ['vue', 'jquery']) ?>
<?php $view->style( 'calendar', 'calendar:assets/fullcalendar/fullcalendar.css') ?>
<?php $view->style( 'datepicker', '/app/assets/uikit/css/components/datepicker.css') ?>


<div id='calendar'>
	<div class="uk-margin uk-flex uk-flex-space-between uk-flex-wrap" data-uk-margin>
        <div data-uk-margin>
            <h2 class="uk-margin-remove">Calendar</h2>
        </div>
        <div data-uk-margin>
            <h2 class="uk-margin-remove" data-uk-tooltip title="Hier kannst du dich zu events hinzufügen damit andere wissen wann du wo bist">Bin dabei</h2>
            <div id="self-event" class="fc-event fc-event-dienst ui-draggable ui-draggable-handle">{{ username }}</div>
        </div>
        <div data-uk-margin>
			<button v-if="new_event_permission" class='uk-button uk-button-primary' data-uk-modal="{target:'#modal_new_event'}" >New Event</button>
			<button class="uk-button" data-uk-toggle="{target:'#legende', animation:'uk-animation-slide-top, uk-animation-slide-bottom',cls:'uk-invisible'}">Legende</button>
			<div id="legende" class="uk-margin uk-flex uk-flex-column uk-flex-space-between uk-flex-middle uk-flex-wrap uk-invisible uk-panel uk-panel-box fc-legende" style="z-index: 3;position: absolute;" data-uk-margin>
		    	<div data-uk-margin class="uk-margin">
		            <div id="self-event" class="fc-event " data-uk-tooltip title="normales Event ohne genauere Spezifizierung/Information zum Tag">Normalel Event / Information</div>
		        </div>
		        <div data-uk-margin class="uk-margin">
		            <div id="self-event" class="fc-event fc-event-veranstaltung " data-uk-tooltip title="Veranstaltung am See oder für die WR">Veranstaltung</div>
		        </div>
		        <div data-uk-margin class="uk-margin">
		            <div id="self-event" class="fc-event fc-event-big " data-uk-tooltip title="Große Veranstaltung und wichtiges Event für die WR">Große Veranstaltung</div>
		        </div>
		        <div data-uk-margin class="uk-margin">
		            <div id="self-event" class="fc-event fc-event-dienst " data-uk-tooltip title="Hier kannst du dich zu events hinzufügen damit andere wissen wann du wo bist">Dienst / Bin dabei</div>
		        </div>
		        <div data-uk-margin class="uk-margin">
		            <div id="self-event" class="fc-event fc-event-termin" data-uk-tooltip title="Termin aus dem Modul Termine(nur im Modul Termine bearbeitbar)">Termin (extern)</div>
		        </div>
		    </div>

        </div>
    </div>
    
	<div id='calendar-app'></div>
	<div id="modal_diplay_event" class="uk-modal">
	    <div class="uk-modal-dialog uk-form">
	     	<a class="uk-modal-close uk-close"></a>
	     	
	     	<div id="display_event" v-show="!d_edit">
	     		<h2 >{{ d_title }}    <small >{{ d_start.format() }} - {{ d_end.format() }}</small></h2>
	     		<p> {{ d_description }}</p>
	     	</div>


	     	<div class="uk-form-row" style="margin-top:20px" id="event_edit" v-if="d_editable" v-show="d_edit">
							
							
				<div class="uk-grid">
					<p class="uk-text-middle uk-width-1-2">Title:</p>
					<input id="d_title"" class="uk-width-1-2" type="text" v-model="d_title"/>
				</div>
				<div class="uk-grid">
					<p class="uk-text-middle uk-width-1-2">Description:</p>
					<textarea id="d_description" class="uk-width-1-2"  v-model="d_description"></textarea>
				</div>
	    	</div>
	    	<label v-if="d_editable"><input type="checkbox" v-model="d_edit" >  Event editieren </label>

	        <div class="uk-modal-footer uk-text-right">
		        <button class="uk-button uk-modal-close uk-button-danger" v-on:click="delete()" v-if="d_editable" >Löschen</button> 
		        <button class="uk-button uk-modal-close uk-button-primary" >Cancel</button> 
		        <button class="uk-button uk-modal-close uk-button-success" v-on:click="updateContent()" v-show="d_edit" v-if="d_editable">Speichern</button>
	        </div>
        </div>
    </div>
    <div id="modal_new_event" class="uk-modal">
	    <div class="uk-modal-dialog uk-form">
	     	<a class="uk-modal-close uk-close"></a>
	     	<h3>Neues Event erstellen</h3>
	     	<div class="uk-form-row" style="margin-top:20px">
					
					
					<div class="uk-grid">
						<p class="uk-text-middle uk-width-1-2">Title:</p>
						<input id="e_title"" class="uk-width-1-2" type="text" v-model="e_title"/>
					</div>
					<div class="uk-grid">
						<p class="uk-text-middle uk-width-1-2">Description:</p>
						<textarea id="e_description" class="uk-width-1-2"  v-model="e_description"></textarea>
					</div>
					<div class="uk-grid">
						<p class="uk-text-middle uk-width-1-2">Start Datum:</p>
						<input  id="e_start" class="uk-width-1-6 datepicker" type="text" data-uk-datepicker="{format:'YYYY-MM-DD'}" v-model="e_start"/ >
					</div>
					<div class="uk-grid">
						<p class="uk-text-middle uk-width-1-2">End Datum: <br/><small>Dieses Datum wird exclusive gewertet. Event endet dann um 00:00 am ausgewählten Datum</small></p>
						<input  id="e_end" class="uk-width-1-6 datepicker" type="text" data-uk-datepicker="{format:'YYYY-MM-DD'}" v-model="e_end"/ >
					</div>
					<div class="uk-grid">
						<p class="uk-text-middle uk-width-1-2">Art des Events:</p>
						<select  v-model="e_className" >
			            	<option v-for="option in classOptions" v-bind:value="option.val" >{{option.name}}</option>
			            </select>
					</div>
		    </div>


	        <div class="uk-modal-footer uk-text-right">
		        <button class="uk-button uk-modal-close" >Cancel</button> 
		        <button class="uk-button uk-button-primary uk-modal-close" v-on:click="new_event()" >Speichern</button>
	        </div>
    	</div>
	</div>
</div>


