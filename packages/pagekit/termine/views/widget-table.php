<article>
	<?php if(count($termine) != 0): ?>

		<h3><?= $termine[0]['Title']  ?><?php echo " " . ($termine[0]["intern"] == 1 ? "<div class='uk-badge uk-badge-notification'>intern</div>" : "");?></h3>	
		<p class="uk-article-meta"><?=  $termine[0]['Date']  ?></p>
		<p class="uk-article-lead"><?= $termine[0]['Description']  ?></p>

	<?php else: ?>
		<h3>Es sind keine kommenden Termine verfügbar</h3>

	<?php endif?>
</article>