<?php $view->script('termine', 'termine:app/views/index.js', ['vue', 'jquery']) ?>

<div id="termine" class="uk-form uk-form-horizontal" >

    <div class="uk-margin uk-flex uk-flex-space-between uk-flex-wrap" data-uk-margin>
        <div data-uk-margin>
            <h2 class="uk-margin-remove">Termine</h2>
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
					</tr>
				</thead>
				<tbody>
					<?php foreach($termine as $termin){ echo "<tr><td>{$termin["id"]}</td><td>{$termin["Title"]}</td><td style='word-wrap:break-word;max-width:500px'>{$termin["Description"]}</td><td>{$termin["Date"]}</td><td><button class='uk-button uk-button-danger' @click.prevent='delete({$termin["id"]})'>X</button></td></tr>"; }?>
				</tbody>
			</table>
			
        </div>
    </div>

</div>
