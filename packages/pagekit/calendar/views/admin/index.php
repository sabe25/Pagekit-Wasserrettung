
<?php $view->script('moment', 'calendar:assets/fullcalendar/lib/moment.min.js', ['vue', 'jquery']) ?>
<?php $view->script('fullcalendar', 'calendar:assets/fullcalendar/fullcalendar.js', ['vue', 'jquery']) ?>

<?php $view->script('calendar', 'calendar:app/bundle/index.js', ['vue', 'jquery']) ?>
<?php $view->style( 'calendar', 'calendar:assets/fullcalendar/fullcalendar.css') ?>


<div id='calendar'>
	<div class="uk-margin uk-flex uk-flex-space-between uk-flex-wrap" data-uk-margin>
        <div data-uk-margin>
            <h2 class="uk-margin-remove">Calendar</h2>
        </div>
        <div data-uk-margin>
			<button class='uk-button uk-button-primary' @click.prevent='new_event' >New Event</button>

        </div>
    </div>
	<div id='calendar-app'></div>

</div>
