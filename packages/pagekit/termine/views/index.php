

<div class="uk-form-row">
        <div >
			<table class="uk-table">
				<thead>
					<tr>
						<th>Title</th>
						<th>Description</th>
						<th>Date</th>
					</tr>
				</thead>
				<tbody>
					<?php foreach($termine as $termin){ echo "<tr>
					<td id='title{$termin["id"]}'>{$termin["Title"]}</td>
					<td id='desc_{$termin["id"]}' style='word-wrap:break-word;max-width:500px'>{$termin["Description"]}</td>
					<td id='date_{$termin["id"]}'>{$termin["Date"]}</td>
					</tr>"; }?>
				</tbody>
			</table>
			
        </div>
    </div>