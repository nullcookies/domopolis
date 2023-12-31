<div class="reviews-col__item">
	<div class="reviews__author-name">
		<span class="rate rate-<?php echo $review['rating']; ?>"></span> <?php if ($review['purchased'] == 1 ) { ?>
				<span style="display: inline-block;vertical-align: sub;width: 24px;height: 25px;margin-right: 10px;text-align: center;line-height: 25px;">
					<svg id="Capa_1" enable-background="new 0 0 512 512" height="20" viewBox="0 0 512 512" width="20" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g><g><path d="m508.996 156.995c-2.833-3.774-7.277-5.995-11.996-5.995h-92.076c-7.301-50.816-51.119-90-103.924-90-52.804 0-96.623 39.184-103.924 90h-78.055l-19.599-138.107c-1.049-7.396-7.38-12.893-14.851-12.893h-69.571c-8.284 0-15 6.716-15 15s6.716 15 15 15h56.55c.025.175 42.112 297.596 42.12 297.646 2.607 17.204 11.015 32.968 23.729 44.638-10.009 8.26-16.399 20.756-16.399 34.716 0 20.723 14.085 38.209 33.181 43.414-2.044 5.137-3.181 10.73-3.181 16.586 0 24.813 20.187 45 45 45s45-20.187 45-45c0-5.258-.915-10.305-2.58-15.01h125.16c-1.665 4.705-2.58 9.751-2.58 15.01 0 24.813 20.187 45 45 45s45-20.187 45-45-20.187-45-45-45h-240c-8.271 0-15-6.729-15-15s6.729-15 15-15h224.7c33.444 0 63.05-22.36 72.024-54.39l48.679-167.422c1.318-4.532.426-9.419-2.407-13.193zm-102.996 295.005c8.271 0 15 6.729 15 15s-6.729 15-15 15-15-6.729-15-15 6.729-15 15-15zm-210 0c8.271 0 15 6.729 15 15s-6.729 15-15 15-15-6.729-15-15 6.729-15 15-15zm105-361c41.355 0 75 33.645 75 75s-33.645 75-75 75-75-33.645-75-75 33.645-75 75-75zm132.851 238.468c-5.345 19.155-23.089 32.532-43.151 32.532-8.541 0-190.327 0-202.801 0-22.39 0-41.119-16.307-44.559-38.781l-20.074-142.219h73.81c7.301 50.816 51.12 90 103.924 90 52.805 0 96.623-39.184 103.924-90h72.094s-43.153 148.416-43.167 148.468zm-158.457-122.862c5.857 5.857 15.355 5.858 21.213 0l45-45c5.858-5.858 5.858-15.355 0-21.213-5.857-5.858-15.355-5.858-21.213 0l-34.394 34.394-4.394-4.393c-5.857-5.858-15.355-5.858-21.213 0s-5.858 15.355 0 21.213z" fill="#51a881"/></g></g></svg>
				</span>
			<?php } ?><span class="name"><? echo $review['author']; ?></span> <span class="date"><? echo $review['date_added']; ?></span>
			
	</div>
	<div class="reviews__desc">
		<?php echo $review['text']; ?>
	</div>
	
	<?php if ($review['good'] || $review['bads']) { ?>
		<div class="ratings-item-good-bad">
			<div class="good">
				<ul>
					<?php $goodonce = explode("\n", nl2br($review['good'])) ?>
					<?php foreach($goodonce as $good_item){ ?>
						<?php if($good_item != ''){ ?>
							<li><?php echo $good_item;?></li>
						<?php }?>
					<?php }?>
				</ul>				
			</div>
			<div class="bad">									
				<ul>
					<?php $badonce = explode("\n", nl2br($review['bads'])) ?>
					<?php foreach($badonce as $bad_item){ ?>
						<?php if($bad_item != ''){ ?>
							<li><?php echo $bad_item;?></li>
						<?php }?>
					<?php }?>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	<? } ?>	
	<?php if ($review['addimage']) { ?>
		<div class="reviews__img">
			<img src="<?php echo $review['addimage']; ?>"  onclick="colorbox(this)" class="colorbox"  style="width:150px;" />
		</div>

	<?php } ?>
</div>
