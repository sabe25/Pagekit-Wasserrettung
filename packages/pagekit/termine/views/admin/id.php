<?php $view->script('termine', 'termine:app/bundle/id.js', ['vue', 'jquery', 'uikit']) ?>

<script type="text/javascript" src="/pagekit/app/assets/uikit/js/components/datepicker.js"></script>
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
				<p id="term-id" class="uk-width-1-2" v-model="id" ></p>
			</div>
			<div class="uk-grid">
				<p class="uk-text-middle uk-width-1-2">Anzeigebereich:</p>
				<select  v-model="intern" >
	            	<option v-for="option in options" v-bind:value="option.value" >{{option.text}}</option>
	            </select>
			</div>
			<div class="uk-grid">
				<p class="uk-text-middle uk-width-1-2">Title:</p>
				<input id="term-title" class="uk-width-1-2" type="text" v-model="Title"/>
			</div>
			<div class="uk-grid">
				<p class="uk-text-middle uk-width-1-2">Description:</p>
				<textarea id="term-desc" class="uk-width-1-2"  v-model="Description"></textarea>
			</div>
			<div class="uk-grid">
				<p class="uk-text-middle uk-width-1-2">Date:</p>
				 <input  id="term-date" class="uk-width-1-6 datepicker" type="text" data-uk-datepicker="{format:'DD.MM.YYYY'}" v-model="date"/ >
			</div>
			
        </div>
    </div>

</div>