<?php echo $header; ?>
<div id="content">
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>
	<div class="box">
		<div class="heading">
			<h1><img src="view/image/payment.png" alt="" /> <?php echo $heading_title; ?></h1>
			<div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
		</div>
		<div class="content">
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
				<table class="form">
					<?php foreach ($languages as $language) { ?>
						<tr>
							<td><span class="required">*</span> <?php echo $entry_bank; ?></td>
							<td><textarea name="bank_transfer_bank_<?php echo $language['language_id']; ?>" cols="80" rows="2"><?php echo isset(${'bank_transfer_bank_' . $language['language_id']}) ? ${'bank_transfer_bank_' . $language['language_id']} : ''; ?></textarea>
								<img src="<?php echo DIR_FLAGS_NAME; ?><?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" style="vertical-align: top;" /><br />
								<?php if (isset(${'error_bank_' . $language['language_id']})) { ?>
									<span class="error"><?php echo ${'error_bank_' . $language['language_id']}; ?></span>
								<?php } ?></td>
						</tr>
					<?php } ?>
					<tr>
                        <td>Вторичный метод</td>
                        <td><select name="bank_transfer_ismethod">
                            <?php if ($bank_transfer_ismethod) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<?php } ?>
						</select></td>
					</tr>
					<tr>
						<td><?php echo $entry_total; ?></td>
						<td><input type="text" name="bank_transfer_total" value="<?php echo $bank_transfer_total; ?>" /></td>
					</tr>
					<tr>
						<td><?php echo $entry_order_status; ?></td>
						<td><select name="bank_transfer_order_status_id">
							<?php foreach ($order_statuses as $order_status) { ?>
								<?php if ($order_status['order_status_id'] == $bank_transfer_order_status_id) { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
								<?php } ?>
							<?php } ?>
						</select></td>
					</tr>

					<tr>
						<td>Включить в магазинах</td>
						<td>
							<div class="scrollbox" style="min-height: 150px;">
								<?php $class = 'even'; ?>
								<?php foreach ($stores as $store) { ?>
									<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
									<div class="<?php echo $class; ?>">
										<?php if (in_array($store['store_id'], $bank_transfer_store)) { ?>
											<input id="store_<?php echo $store['store_id']; ?>" class="checkbox" type="checkbox" name="bank_transfer_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
											<label for="store_<?php echo $store['store_id']; ?>"><?php echo $store['name']; ?></label>
											<?php } else { ?>
											<input id="store_<?php echo $store['store_id']; ?>" class="checkbox" type="checkbox" name="bank_transfer_store[]" value="<?php echo $store['store_id']; ?>" />
											<label for="store_<?php echo $store['store_id']; ?>"><?php echo $store['name']; ?></label>
										<?php } ?>
									</div>
								<?php } ?>
								
							</div>
							<a class="select_all" onclick="$(this).parent().find(':checkbox').attr('checked', true);">Выделить всё</a><a class="remove_selection" onclick="$(this).parent().find(':checkbox').attr('checked', false);">Снять выделение</a>
						</td>
					</tr>

					<tr>
						<td><?php echo $entry_geo_zone; ?></td>
						<td><select name="bank_transfer_geo_zone_id">
							<option value="0"><?php echo $text_all_zones; ?></option>
							<?php foreach ($geo_zones as $geo_zone) { ?>
								<?php if ($geo_zone['geo_zone_id'] == $bank_transfer_geo_zone_id) { ?>
									<option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
								<?php } ?>
							<?php } ?>
						</select></td>
					</tr>
					<tr>
						<td><?php echo $entry_status; ?></td>
						<td><select name="bank_transfer_status">
							<?php if ($bank_transfer_status) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<?php } ?>
						</select></td>
					</tr>
					<tr>
						<td><?php echo $entry_sort_order; ?></td>
						<td><input type="text" name="bank_transfer_sort_order" value="<?php echo $bank_transfer_sort_order; ?>" size="1" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
<?php echo $footer; ?>