<?php $view->script('termine', 'termine:app/bundle/index.js', ['vue', 'jquery']) ?>

<div id="termine" class="uk-form uk-form-horizontal" >

    <div class="uk-margin uk-flex uk-flex-space-between uk-flex-wrap" data-uk-margin>
        <div data-uk-margin>
            <h2 class="uk-margin-remove">Termine</h2>
            <br/>
            <select  v-model="loc" >
            	<option v-for="option in options" v-bind:value="option.value" >{{option.text}}</option>
            </select>
        </div>
        <div data-uk-margin>
        
            <button class="uk-button uk-button-primary" @click.prevent="add">Add</button>
        </div>
    </div>

    <div class="uk-form-row">
        <div >
			<table class="uk-table">
				<thead>
					<tr>
						<th>ID</th>
						<th>Title</th>
						<th>Description</th>
						<th>Date</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<?php foreach($termine as $termin){ echo "<tr style='border-style: none none none solid;border-color: " . ($termin["intern"] == 1 ? "#3a94e0" : "#3ae040") . ";''>
					<td id='id_{$termin["id"]}'>{$termin["id"]}</td>
					<td id='title{$termin["id"]}'>{$termin["Title"]}</td>
					<td id='desc_{$termin["id"]}' style='word-wrap:break-word;max-width:500px'>{$termin["Description"]}</td>
					<td id='date_{$termin["id"]}'>{$termin["Date"]}</td>
					<td id='edit_{$termin["id"]}'><button class='uk-button uk-button-primary' @click.prevent='edit({$termin["id"]})'>Edit</button></td>
					<td id='del_{$termin["id"]}'><button class='uk-button uk-button-danger' @click.prevent='delete({$termin["id"]})'>X</button></td>
					</tr>"; }?>
				</tbody>
			</table>
			
        </div>
    </div>

</div>
