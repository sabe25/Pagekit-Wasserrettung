
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
			<button class='uk-button uk-button-primary' data-uk-modal="{target:'#modal_new_event'}" >New Event</button>
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
						
				    </div>


			        <div class="uk-modal-footer uk-text-right">
				        <button class="uk-button uk-modal-close" >Cancel</button> 
				        <button class="uk-button uk-button-primary uk-modal-close" v-on:click="new_event()" >Speichern</button>
			        </div>
		    </div>
</div>
        </div>
    </div>
	<div id='calendar-app'></div>

</div>
