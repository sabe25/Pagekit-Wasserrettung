<?php $view->script('termine', 'termine:app/views/id.js', ['vue', 'jquery']) ?>

<div id="termine-id" class="uk-form uk-form-horizontal" >

    <div class="uk-margin uk-flex uk-flex-space-between uk-flex-wrap" data-uk-margin>
        <div data-uk-margin>
            <h2 class="uk-margin-remove"><?= $text ?></h2>
        </div>
        <div data-uk-margin>
		<button class='uk-button uk-button-primary' @click.prevent='save'><?= $saveText ? 'Save' : 'Add'?></button>
		<a class='uk-button ' href="admin/termine">Cancle</a>

        </div>
    </div>

    <div class="uk-form-row">
        <div style="width:80%">
			<div class="uk-grid">
				<p class="uk-text-middle uk-width-1-2">ID:</p>
				<p id="term-id" class="uk-width-1-2" ><?= $termine != null ? $termine['id']: 'Manuelle ID zuweisung' ?></p>
			</div>
			<div class="uk-grid">
				<p class="uk-text-middle uk-width-1-2">Title:</p>
				<input id="term-title" class="uk-width-1-2" type="text" value="<?= $termine != null ? $termine['Title']: '' ?>"/>
			</div>
			<div class="uk-grid">
				<p class="uk-text-middle uk-width-1-2">Description:</p>
				<textarea id="term-desc" class="uk-width-1-2"  value="<?= $termine != null ? $termine['Description']: '' ?>"></textarea>
			</div>
			<div class="uk-grid">
				<p class="uk-text-middle uk-width-1-2">Date:</p>
				 <input onload="initdatepicker" id="term-date" class="uk-width-1-2" type="text" data-uk-datepicker="{format:'DD.MM.YYYY'}" value="<?= $termine != null ? $termine['Date']: '' ?>"/ >
				 <input type="text" data-uk-timepicker>
			</div>
			
        </div>
    </div>

</div>