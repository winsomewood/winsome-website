		<div id="pagelinks">
<?php
if ($ITEMS_PER_PAGE <= $totalitemcount[0]) {
	if ($page != 1) {
?>
			<a href="<?= $pagelinksquery ?>page=<?= $page - 1 ?>">&lt; Prev</a>
<?php
	}
	for ($i = 1; $i < $totalitemcount[0] / $ITEMS_PER_PAGE + 1; $i++) {
		if ($i != $page) {
?>
			<a href="<?= $pagelinksquery ?>page=<?= $i ?>"><?= $i ?></a>
<?php
		}
		else {
?>
			<span class="currentlink"><?= $i ?></span>
<?php
		}
	}
	if ($page < $totalitemcount[0] / $ITEMS_PER_PAGE) {
?>
			<a href="<?= $pagelinksquery ?>page=<?= $page + 1 ?>">Next &gt;</a>
<?php
	}
}
?>
		</div>
