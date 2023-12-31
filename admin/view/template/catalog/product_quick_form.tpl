<div id="aqe-popup">
  <div id="save-overlay" class="save-overlay">
    <div class="tbl">
      <div class="tbl_cell"><img src="view/image/aqe-pro/aqe_loading.gif" style="margin:-2px;"/></div>
    </div>
  </div>
  <div class="notice-container"></div>
  <form enctype="multipart/form-data" id="aqe-popup-form" onsubmit="return false;">
    <input type="hidden" name="p_id" value="<?php echo $product_id; ?>" />
<?php
switch($parameter) {
  case "category": ?>
    <select name="p_c" multiple="multiple" size="10" style="width:100%;min-width:300px;height: 500px;">
    <?php foreach ($categories as $category) { ?>
    <option value="<?php echo $category['category_id']; ?>"<?php echo (in_array($category['category_id'], $product_category)) ? ' selected="selected"': ''; ?>><?php echo $category['name']; ?></option>
    <?php } ?>
    </select>
    <?php break;
  case "store": ?>
    <select name="p_s" multiple="multiple" size="10" style="width:100%;min-width:300px;height: 500px;">
    <?php foreach ($stores as $store) { ?>
    <option value="<?php echo $store['store_id']; ?>"<?php echo (in_array($store['store_id'], $product_store)) ? ' selected="selected"': ''; ?>><?php echo $store['name']; ?></option>
    <?php } ?>
    </select>
    <?php break;
  case "filter": ?>
    <select name="p_f" multiple="multiple" size="10" style="width:100%;min-width:300px;height: 500px;">
    <?php foreach ($filters as $filter) { ?>
    <option value="<?php echo $filter['filter_id']; ?>"<?php echo (in_array($filter['filter_id'], $product_filter)) ? ' selected="selected"': ''; ?>><?php echo strip_tags(html_entity_decode($filter['group'] . ' &gt; ' . $filter['name'], ENT_QUOTES, 'UTF-8')); ?></option>
    <?php } ?>
    </select>
    <?php break;
  case "download": ?>
    <select name="p_d" multiple="multiple" size="10" style="width:100%;min-width:300px;height: 500px;">
    <?php foreach ($downloads as $download) { ?>
    <option value="<?php echo $download['download_id']; ?>"<?php echo (in_array($download['download_id'], $product_download)) ? ' selected="selected"': ''; ?>><?php echo $download['name']; ?></option>
    <?php } ?>
    </select>
    <?php break;
  case 'attributes': ?>
    <table class="list quick">
      <thead>
        <tr>
          <td class="left"><?php echo $entry_attribute; ?></td>
          <td class="left"><?php echo $entry_text; ?></td>
          <td width="1"></td>
        </tr>
      </thead>
      <tbody id="attributes">
        <?php $attribute_row = 0; ?>
        <?php foreach ($product_attributes as $product_attribute) { ?>
        <tr id="attribute-row<?php echo $attribute_row; ?>">
          <td class="left"><input type="text" name="product_attribute[<?php echo $attribute_row; ?>][name]" value="<?php echo $product_attribute['name']; ?>" />
            <input type="hidden" name="product_attribute[<?php echo $attribute_row; ?>][attribute_id]" value="<?php echo $product_attribute['attribute_id']; ?>" /></td>
          <td class="left"><?php foreach ($languages as $language) { ?>
            <textarea name="product_attribute[<?php echo $attribute_row; ?>][product_attribute_description][<?php echo $language['language_id']; ?>][text]" cols="40" rows="1"><?php echo isset($product_attribute['product_attribute_description'][$language['language_id']]) ? $product_attribute['product_attribute_description'][$language['language_id']]['text'] : ''; ?></textarea>
            <img src="<?php echo DIR_FLAGS_NAME; ?><?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" /><br />
            <?php } ?></td>
          <td class="left"><a onclick="$('#attribute-row<?php echo $attribute_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
        </tr>
        <?php $attribute_row++; ?>
        <?php } ?>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="2"></td>
          <td class="left"><a onclick="addAttribute();" class="button"><?php echo $button_add_attribute; ?></a></td>
        </tr>
      </tfoot>
    </table>
<script type="text/javascript"><!--
var attribute_row = <?php echo $attribute_row; ?>;

function addAttribute() {
  html  = '  <tr id="attribute-row' + attribute_row + '">';
  html += '    <td class="left"><input type="text" name="product_attribute[' + attribute_row + '][name]" value="" /><input type="hidden" name="product_attribute[' + attribute_row + '][attribute_id]" value="" /></td>';
  html += '    <td class="left">';
  <?php foreach ($languages as $language) { ?>
  html += '<textarea name="product_attribute[' + attribute_row + '][product_attribute_description][<?php echo $language['language_id']; ?>][text]" cols="40" rows="1"></textarea><img src="<?php echo DIR_FLAGS_NAME; ?><?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" align="top" /><br />';
  <?php } ?>
  html += '    </td>';
  html += '    <td class="left"><a onclick="$(\'#attribute-row' + attribute_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
  html += '  </tr>';

  $('#attributes').append(html);

  attributeautocomplete(attribute_row);

  attribute_row++;
}

$.widget('custom.catcomplete', $.ui.autocomplete, {
  _renderMenu: function(ul, items) {
    var self = this, currentCategory = '';

    $.each(items, function(index, item) {
      if (item.category != currentCategory) {
        ul.append('<li class="ui-autocomplete-category">' + item.category + '</li>');

        currentCategory = item.category;
      }

      self._renderItem(ul, item);
    });
  }
});

function attributeautocomplete(attribute_row) {
  $('input[name=\'product_attribute[' + attribute_row + '][name]\']').catcomplete({
    delay: 0,
    source: function(request, response) {
      $.ajax({
        url: 'index.php?route=catalog/attribute/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
        dataType: 'json',
        success: function(json) {
          response($.map(json, function(item) {
            return {
              category: item.attribute_group,
              label: item.name,
              value: item.attribute_id
            }
          }));
        }
      });
    },
    select: function(event, ui) {
      $('input[name=\'product_attribute[' + attribute_row + '][name]\']').attr('value', ui.item.label);
      $('input[name=\'product_attribute[' + attribute_row + '][attribute_id]\']').attr('value', ui.item.value);

      return false;
    },
    focus: function(event, ui) {
          return false;
      }
  });
}

$('#attribute tbody').each(function(index, element) {
  attributeautocomplete(index);
});
//--></script>
    <?php break;
  case 'discounts': ?>
    <table class="list">
      <thead>
        <tr>
          <td class="left"><?php echo $entry_customer_group; ?></td>
          <td class="right"><?php echo $entry_quantity; ?></td>
          <td class="right"><?php echo $entry_priority; ?></td>
          <td class="right"><?php echo $entry_price; ?></td>
          <td class="left"><?php echo $entry_date_start; ?></td>
          <td class="left"><?php echo $entry_date_end; ?></td>
          <td width="1"></td>
        </tr>
      </thead>
      <tbody id="discounts">
        <?php $discount_row = 0; ?>
        <?php foreach ($product_discounts as $product_discount) { ?>
        <tr id="discount-row<?php echo $discount_row; ?>">
          <td class="left"><select name="product_discount[<?php echo $discount_row; ?>][customer_group_id]">
              <?php foreach ($customer_groups as $customer_group) { ?>
              <?php if ($customer_group['customer_group_id'] == $product_discount['customer_group_id']) { ?>
              <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>
          <td class="right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][quantity]" value="<?php echo $product_discount['quantity']; ?>" size="2" /></td>
          <td class="right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][priority]" value="<?php echo $product_discount['priority']; ?>" size="2" /></td>
          <td class="right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][price]" value="<?php echo $product_discount['price']; ?>" /></td>
          <td class="left"><input type="text" name="product_discount[<?php echo $discount_row; ?>][date_start]" value="<?php echo $product_discount['date_start']; ?>" class="date" /></td>
          <td class="left"><input type="text" name="product_discount[<?php echo $discount_row; ?>][date_end]" value="<?php echo $product_discount['date_end']; ?>" class="date" /></td>
          <td class="left"><a onclick="$('#discount-row<?php echo $discount_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
        </tr>
        <?php $discount_row++; ?>
        <?php } ?>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="6"></td>
          <td class="left"><a onclick="addDiscount();" class="button"><?php echo $button_add_discount; ?></a></td>
        </tr>
      </tfoot>
    </table>
<script type="text/javascript"><!--
var discount_row = <?php echo $discount_row; ?>;

function addDiscount() {
  html  = '  <tr id="discount-row' + discount_row + '">';
  html += '    <td class="left"><select name="product_discount[' + discount_row + '][customer_group_id]">';
  <?php foreach ($customer_groups as $customer_group) { ?>
  html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>';
  <?php } ?>
  html += '    </select></td>';
  html += '    <td class="right"><input type="text" name="product_discount[' + discount_row + '][quantity]" value="" size="2" /></td>';
  html += '    <td class="right"><input type="text" name="product_discount[' + discount_row + '][priority]" value="" size="2" /></td>';
  html += '    <td class="right"><input type="text" name="product_discount[' + discount_row + '][price]" value="" /></td>';
  html += '    <td class="left"><input type="text" name="product_discount[' + discount_row + '][date_start]" value="" class="date" /></td>';
  html += '    <td class="left"><input type="text" name="product_discount[' + discount_row + '][date_end]" value="" class="date" /></td>';
  html += '    <td class="left"><a onclick="$(\'#discount-row' + discount_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
  html += '  </tr>';

  $('#discounts').append(html);

  $('#discount-row' + discount_row + ' .date').datepicker({dateFormat: 'yy-mm-dd'});

  discount_row++;
}
//--></script>
    <?php break;
  case 'images': ?>
    <table class="list">
      <thead>
        <tr>
          <td class="left"><?php echo $entry_image; ?></td>
          <td class="right"><?php echo $entry_sort_order; ?></td>
          <td width="1"></td>
        </tr>
      </thead>
      <tbody id="images">
        <?php $image_row = 0; ?>
        <?php foreach ($product_images as $product_image) { ?>
        <tr id="image-row<?php echo $image_row; ?>">
          <td class="left"><div class="image"><img src="<?php echo $product_image['thumb']; ?>" alt="" id="thumb<?php echo $image_row; ?>" />
              <input type="hidden" name="product_image[<?php echo $image_row; ?>][image]" value="<?php echo $product_image['image']; ?>" id="image<?php echo $image_row; ?>" />
              <br />
              <a onclick="image_upload('image<?php echo $image_row; ?>', 'thumb<?php echo $image_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb<?php echo $image_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image<?php echo $image_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
          <td class="right"><input type="text" name="product_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $product_image['sort_order']; ?>" size="2" /></td>
          <td class="left"><a onclick="$('#image-row<?php echo $image_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
        </tr>
        <?php $image_row++; ?>
        <?php } ?>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="2"></td>
          <td class="left"><a onclick="addImage();" class="button"><?php echo $button_add_image; ?></a></td>
        </tr>
      </tfoot>
    </table>
<script type="text/javascript"><!--
var image_row = <?php echo $image_row; ?>;

function addImage() {
  html  = '  <tr id="image-row' + image_row + '">';
  html += '    <td class="left"><div class="image"><img src="<?php echo $no_image; ?>" alt="" id="thumb' + image_row + '" /><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="image' + image_row + '" /><br /><a onclick="image_upload(\'image' + image_row + '\', \'thumb' + image_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + image_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + image_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div></td>';
  html += '    <td class="right"><input type="text" name="product_image[' + image_row + '][sort_order]" value="" size="2" /></td>';
  html += '    <td class="left"><a onclick="$(\'#image-row' + image_row  + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
  html += '  </tr>';

  $('#images').append(html);

  image_row++;
}

function image_upload(field, thumb) {
  $('#dialog').remove();

  $('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');

  $('#dialog').dialog({
    title: '<?php echo $text_image_manager; ?>',
    close: function (event, ui) {
      if ($('#' + field).attr('value')) {
        $.ajax({
          url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
          dataType: 'text',
          success: function(text) {
            $('#' + thumb).replaceWith('<img src="' + text + '" alt="" id="' + thumb + '" />');
          }
        });
      }
    },
    bgiframe: false,
    width: 800,
    height: 400,
    resizable: false,
    modal: false
  });
};
//--></script>
    <?php break;
  case 'options': ?>
    <div id="vtab-option" class="vtabs">
      <?php $option_row = 0; ?>
      <?php foreach ($product_options as $product_option) { ?>
      <a href="#tab-option-<?php echo $option_row; ?>" id="option-<?php echo $option_row; ?>"><?php echo $product_option['name']; ?>&nbsp;<img src="view/image/delete.png" alt="" onclick="$('#vtabs a:first').trigger('click'); $('#option-<?php echo $option_row; ?>').remove(); $('#tab-option-<?php echo $option_row; ?>').remove(); return false;" /></a>
      <?php $option_row++; ?>
      <?php } ?>
      <span id="option-add">
      <input name="option" value="" style="width: 130px;" />
      &nbsp;<img src="view/image/add.png" alt="<?php echo $button_add_option; ?>" title="<?php echo $button_add_option; ?>" /></span>
    </div>
    <?php $option_row = 0; ?>
    <?php $option_value_row = 0; ?>
    <?php foreach ($product_options as $product_option) { ?>
    <div id="tab-option-<?php echo $option_row; ?>" class="vtabs-content">
      <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_id]" value="<?php echo $product_option['product_option_id']; ?>" />
      <input type="hidden" name="product_option[<?php echo $option_row; ?>][name]" value="<?php echo $product_option['name']; ?>" />
      <input type="hidden" name="product_option[<?php echo $option_row; ?>][option_id]" value="<?php echo $product_option['option_id']; ?>" />
      <input type="hidden" name="product_option[<?php echo $option_row; ?>][type]" value="<?php echo $product_option['type']; ?>" />
      <table class="form">
        <tr>
          <td><?php echo $entry_required; ?></td>
          <td><select name="product_option[<?php echo $option_row; ?>][required]">
              <?php if ($product_option['required']) { ?>
              <option value="1" selected="selected"><?php echo $text_yes; ?></option>
              <option value="0"><?php echo $text_no; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_yes; ?></option>
              <option value="0" selected="selected"><?php echo $text_no; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <?php if ($product_option['type'] == 'text') { ?>
        <tr>
          <td><?php echo $entry_option_value; ?></td>
          <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" /></td>
        </tr>
        <?php } ?>
        <?php if ($product_option['type'] == 'textarea') { ?>
        <tr>
          <td><?php echo $entry_option_value; ?></td>
          <td><textarea name="product_option[<?php echo $option_row; ?>][option_value]" cols="40" rows="1"><?php echo $product_option['option_value']; ?></textarea></td>
        </tr>
        <?php } ?>
        <?php if ($product_option['type'] == 'file') { ?>
        <tr style="display: none;">
          <td><?php echo $entry_option_value; ?></td>
          <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" /></td>
        </tr>
        <?php } ?>
        <?php if ($product_option['type'] == 'date') { ?>
        <tr>
          <td><?php echo $entry_option_value; ?></td>
          <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" class="date" /></td>
        </tr>
        <?php } ?>
        <?php if ($product_option['type'] == 'datetime') { ?>
        <tr>
          <td><?php echo $entry_option_value; ?></td>
          <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" class="datetime" /></td>
        </tr>
        <?php } ?>
        <?php if ($product_option['type'] == 'time') { ?>
        <tr>
          <td><?php echo $entry_option_value; ?></td>
          <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" class="time" /></td>
        </tr>
        <?php } ?>
      </table>
      <?php if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') { ?>
      <table id="option-value<?php echo $option_row; ?>" class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $entry_option_value; ?></td>
            <td class="right"><?php echo $entry_quantity; ?></td>
            <td class="left"><?php echo $entry_subtract; ?></td>
            <td class="right"><?php echo $entry_price; ?></td>
            <td class="right"><?php echo $entry_option_points; ?></td>
            <td class="right"><?php echo $entry_weight; ?></td>
            <td></td>
          </tr>
        </thead>
        <?php foreach ($product_option['product_option_value'] as $product_option_value) { ?>
        <tbody id="option-value-row<?php echo $option_value_row; ?>">
          <tr>
            <td class="left"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][option_value_id]">
                <?php if (isset($option_values[$product_option['option_id']])) { ?>
                <?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
                <?php if ($option_value['option_value_id'] == $product_option_value['option_value_id']) { ?>
                <option value="<?php echo $option_value['option_value_id']; ?>" selected="selected"><?php echo $option_value['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
                <?php } ?>
                <?php } ?>
                <?php } ?>
              </select>
              <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][product_option_value_id]" value="<?php echo $product_option_value['product_option_value_id']; ?>" /></td>
            <td class="right"><input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][quantity]" value="<?php echo $product_option_value['quantity']; ?>" size="3" /></td>
            <td class="left"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][subtract]">
                <?php if ($product_option_value['subtract']) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } ?>
              </select></td>
            <td class="right"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price_prefix]">
                <?php if ($product_option_value['price_prefix'] == '+') { ?>
                <option value="+" selected="selected">+</option>
                <?php } else { ?>
                <option value="+">+</option>
                <?php } ?>
                <?php if ($product_option_value['price_prefix'] == '-') { ?>
                <option value="-" selected="selected">-</option>
                <?php } else { ?>
                <option value="-">-</option>
                <?php } ?>
              </select>
              <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price]" value="<?php echo $product_option_value['price']; ?>" size="5" /></td>
            <td class="right"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points_prefix]">
                <?php if ($product_option_value['points_prefix'] == '+') { ?>
                <option value="+" selected="selected">+</option>
                <?php } else { ?>
                <option value="+">+</option>
                <?php } ?>
                <?php if ($product_option_value['points_prefix'] == '-') { ?>
                <option value="-" selected="selected">-</option>
                <?php } else { ?>
                <option value="-">-</option>
                <?php } ?>
              </select>
              <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points]" value="<?php echo $product_option_value['points']; ?>" size="5" /></td>
            <td class="right"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight_prefix]">
                <?php if ($product_option_value['weight_prefix'] == '+') { ?>
                <option value="+" selected="selected">+</option>
                <?php } else { ?>
                <option value="+">+</option>
                <?php } ?>
                <?php if ($product_option_value['weight_prefix'] == '-') { ?>
                <option value="-" selected="selected">-</option>
                <?php } else { ?>
                <option value="-">-</option>
                <?php } ?>
              </select>
              <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight]" value="<?php echo $product_option_value['weight']; ?>" size="5" /></td>
            <td class="left"><a onclick="$('#option-value-row<?php echo $option_value_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
          </tr>
        </tbody>
        <?php $option_value_row++; ?>
        <?php } ?>
        <tfoot>
          <tr>
            <td colspan="6"></td>
            <td class="left"><a onclick="addOptionValue('<?php echo $option_row; ?>');" class="button"><?php echo $button_add_option_value; ?></a></td>
          </tr>
        </tfoot>
      </table>
      <select id="option-values<?php echo $option_row; ?>" style="display: none;">
        <?php if (isset($option_values[$product_option['option_id']])) { ?>
        <?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
        <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
      <?php } ?>
    </div>
    <?php $option_row++; ?>
    <?php } ?>
<script type="text/javascript"><!--
var option_row = <?php echo $option_row; ?>;

$.widget('custom.catcomplete', $.ui.autocomplete, {
  _renderMenu: function(ul, items) {
    var self = this, currentCategory = '';

    $.each(items, function(index, item) {
      if (item.category != currentCategory) {
        ul.append('<li class="ui-autocomplete-category">' + item.category + '</li>');

        currentCategory = item.category;
      }

      self._renderItem(ul, item);
    });
  }
});

$('input[name=\'option\']').catcomplete({
  delay: 0,
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=catalog/option/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            category: item.category,
            label: item.name,
            value: item.option_id,
            type: item.type,
            option_value: item.option_value
          }
        }));
      }
    });
  },
  select: function(event, ui) {
    html  = '<div id="tab-option-' + option_row + '" class="vtabs-content">';
    html += ' <input type="hidden" name="product_option[' + option_row + '][product_option_id]" value="" />';
    html += ' <input type="hidden" name="product_option[' + option_row + '][name]" value="' + ui.item.label + '" />';
    html += ' <input type="hidden" name="product_option[' + option_row + '][option_id]" value="' + ui.item.value + '" />';
    html += ' <input type="hidden" name="product_option[' + option_row + '][type]" value="' + ui.item.type + '" />';
    html += ' <table class="form">';
    html += '   <tr>';
    html += '   <td><?php echo $entry_required; ?></td>';
    html += '       <td><select name="product_option[' + option_row + '][required]">';
    html += '       <option value="1"><?php echo $text_yes; ?></option>';
    html += '       <option value="0"><?php echo $text_no; ?></option>';
    html += '     </select></td>';
    html += '     </tr>';

    if (ui.item.type == 'text') {
      html += '     <tr>';
      html += '       <td><?php echo $entry_option_value; ?></td>';
      html += '       <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" /></td>';
      html += '     </tr>';
    }

    if (ui.item.type == 'textarea') {
      html += '     <tr>';
      html += '       <td><?php echo $entry_option_value; ?></td>';
      html += '       <td><textarea name="product_option[' + option_row + '][option_value]" cols="40" rows="1"></textarea></td>';
      html += '     </tr>';
    }

    if (ui.item.type == 'file') {
      html += '     <tr style="display: none;">';
      html += '       <td><?php echo $entry_option_value; ?></td>';
      html += '       <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" /></td>';
      html += '     </tr>';
    }

    if (ui.item.type == 'date') {
      html += '     <tr>';
      html += '       <td><?php echo $entry_option_value; ?></td>';
      html += '       <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" class="date" /></td>';
      html += '     </tr>';
    }

    if (ui.item.type == 'datetime') {
      html += '     <tr>';
      html += '       <td><?php echo $entry_option_value; ?></td>';
      html += '       <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" class="datetime" /></td>';
      html += '     </tr>';
    }

    if (ui.item.type == 'time') {
      html += '     <tr>';
      html += '       <td><?php echo $entry_option_value; ?></td>';
      html += '       <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" class="time" /></td>';
      html += '     </tr>';
    }

    html += '  </table>';

    if (ui.item.type == 'select' || ui.item.type == 'radio' || ui.item.type == 'checkbox' || ui.item.type == 'image') {
      html += '  <table id="option-value' + option_row + '" class="list">';
      html += '    <thead>';
      html += '      <tr>';
      html += '        <td class="left"><?php echo $entry_option_value; ?></td>';
      html += '        <td class="right"><?php echo $entry_quantity; ?></td>';
      html += '        <td class="left"><?php echo $entry_subtract; ?></td>';
      html += '        <td class="right"><?php echo $entry_price; ?></td>';
      html += '        <td class="right"><?php echo $entry_option_points; ?></td>';
      html += '        <td class="right"><?php echo $entry_weight; ?></td>';
      html += '        <td></td>';
      html += '      </tr>';
      html += '    </thead>';
      html += '    <tfoot>';
      html += '      <tr>';
      html += '        <td colspan="6"></td>';
      html += '        <td class="left"><a onclick="addOptionValue(' + option_row + ');" class="button"><?php echo $button_add_option_value; ?></a></td>';
      html += '      </tr>';
      html += '    </tfoot>';
      html += '  </table>';
      html += '  <select id="option-values' + option_row + '" style="display: none;">';

      for (i = 0; i < ui.item.option_value.length; i++) {
        html += '  <option value="' + ui.item.option_value[i]['option_value_id'] + '">' + ui.item.option_value[i]['name'] + '</option>';
      }

      html += '  </select>';
      html += '</div>';
    }

    $('#aqe-popup-form').append(html);

    $('#option-add').before('<a href="#tab-option-' + option_row + '" id="option-' + option_row + '">' + ui.item.label + '&nbsp;<img src="view/image/delete.png" alt="" onclick="$(\'#vtab-option a:first\').trigger(\'click\'); $(\'#option-' + option_row + '\').remove(); $(\'#tab-option-' + option_row + '\').remove(); return false;" /></a>');

    $('#vtab-option a').tabs();

    $('#option-' + option_row).trigger('click');

    $('.date').datepicker({dateFormat: 'yy-mm-dd'});
    $('.datetime').datetimepicker({
      dateFormat: 'yy-mm-dd',
      timeFormat: 'h:m'
    });

    $('.time').timepicker({timeFormat: 'h:m'});

    option_row++;

    return false;
  },
  focus: function(event, ui) {
      return false;
   }
});

var option_value_row = <?php echo $option_value_row; ?>;

function addOptionValue(option_row) {
  html  = '<tbody id="option-value-row' + option_value_row + '">';
  html += '  <tr>';
  html += '    <td class="left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][option_value_id]">';
  html += $('#option-values' + option_row).html();
  html += '    </select><input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][product_option_value_id]" value="" /></td>';
  html += '    <td class="right"><input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][quantity]" value="" size="3" /></td>';
  html += '    <td class="left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][subtract]">';
  html += '      <option value="1"><?php echo $text_yes; ?></option>';
  html += '      <option value="0"><?php echo $text_no; ?></option>';
  html += '    </select></td>';
  html += '    <td class="right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price_prefix]">';
  html += '      <option value="+">+</option>';
  html += '      <option value="-">-</option>';
  html += '    </select>';
  html += '    <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price]" value="" size="5" /></td>';
  html += '    <td class="right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points_prefix]">';
  html += '      <option value="+">+</option>';
  html += '      <option value="-">-</option>';
  html += '    </select>';
  html += '    <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points]" value="" size="5" /></td>';
  html += '    <td class="right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight_prefix]">';
  html += '      <option value="+">+</option>';
  html += '      <option value="-">-</option>';
  html += '    </select>';
  html += '    <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight]" value="" size="5" /></td>';
  html += '    <td class="left"><a onclick="$(\'#option-value-row' + option_value_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
  html += '  </tr>';
  html += '</tbody>';

  $('#option-value' + option_row + ' tfoot').before(html);

  option_value_row++;
}
$('.date').datepicker({dateFormat: 'yy-mm-dd'});
$('.datetime').datetimepicker({
  dateFormat: 'yy-mm-dd',
  timeFormat: 'h:m'
});
$('.time').timepicker({timeFormat: 'h:m'});
$('#vtab-option a').tabs();
//--></script>
    <?php break;
  case 'profiles': ?>
      <table class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $entry_profile ?></td>
            <td class="left"><?php echo $entry_customer_group ?></td>
            <td class="left"></td>
          </tr>
        </thead>
        <tbody id="profiles">
          <?php $profile_count = 0; ?>
          <?php foreach ($product_profiles as $product_profile) { ?>
          <tr id="profile-row<?php echo $profile_count ?>">
            <td class="left">
              <select name="product_profiles[<?php echo $profile_count ?>][profile_id]">
                <?php foreach ($profiles as $profile) { ?>
                  <?php if ($profile['profile_id'] == $product_profile['profile_id']) { ?>
                    <option value="<?php echo $profile['profile_id'] ?>" selected="selected"><?php echo $profile['name'] ?></option>
                  <?php } else { ?>
                    <option value="<?php echo $profile['profile_id'] ?>"><?php echo $profile['name'] ?></option>
                  <?php } ?>
                <?php } ?>
              </select>
            </td>
            <td class="left">
              <select name="product_profiles[<?php echo $profile_count ?>][customer_group_id]">
                <?php foreach ($customer_groups as $customer_group) { ?>
                  <?php if ($customer_group['customer_group_id'] == $product_profile['customer_group_id']) { ?>
                    <option value="<?php echo $customer_group['customer_group_id'] ?>" selected="selected"><?php echo $customer_group['name'] ?></option>
                  <?php } else { ?>
                    <option value="<?php echo $customer_group['customer_group_id'] ?>"><?php echo $customer_group['name'] ?></option>
                  <?php } ?>
                <?php } ?>
              </select>
            </td>
            <td class="left">
              <a class="button" onclick="$('#profile-row<?php echo $profile_count ?>').remove()"><?php echo $button_remove ?></a>
            </td>
          </tr>
          <?php $profile_count++ ?>
          <?php } ?>
        </tbody>
        <tfoot>
          <tr>
            <td colspan="2"></td>
            <td class="left"><a onclick="addProfile()" class="button"><?php echo $button_add_profile ?></a></td>
          </tr>
        </tfoot>
      </table>
<script type="text/javascript"><!--
var profile_count = <?php echo $profile_count ?>;

function addProfile() {
  profile_count++;

  var html = '';
  html += '<tr id="profile-row' + profile_count + '">';
  html += '  <td class="left">';
  html += '    <select name="product_profiles[' + profile_count + '][profile_id]">';
  <?php foreach ($profiles as $profile) { ?>
  html += '      <option value="<?php echo $profile['profile_id'] ?>"><?php echo $profile['name'] ?></option>';
  <?php } ?>
  html += '    </select>';
  html += '  </td>';
  html += '  <td class="left">';
  html += '    <select name="product_profiles[' + profile_count + '][customer_group_id]">';
  <?php foreach ($customer_groups as $customer_group) { ?>
  html += '      <option value="<?php echo $customer_group['customer_group_id'] ?>"><?php echo $customer_group['name'] ?></option>';
  <?php } ?>
  html += '    <select>';
  html += '  </td>';
  html += '  <td class="left">';
  html += '    <a class="button" onclick="$(\'#profile-row' + profile_count + '\').remove()"><?php echo $button_remove ?></a>';
  html += '  </td>';
  html += '</tr>';

  $('#profiles').append(html);
}
//--></script>
    <?php break;
  case 'specials': ?>
    <table class="list">
      <thead>
        <tr>
          <td class="left"><?php echo $entry_customer_group; ?></td>
          <td class="right"><?php echo $entry_priority; ?></td>
          <td class="right"><?php echo $entry_price; ?></td>
          <td class="left"><?php echo $entry_date_start; ?></td>
          <td class="left"><?php echo $entry_date_end; ?></td>
          <td></td>
        </tr>
      </thead>
      <tbody id="specials">
        <?php $special_row = 0; ?>
        <?php foreach ($product_specials as $product_special) { ?>
        <tr id="special-row<?php echo $special_row; ?>">
          <td class="left">
            <select name="product_special[<?php echo $special_row; ?>][customer_group_id]">
              <?php foreach ($customer_groups as $customer_group) { ?>
              <?php if ($customer_group['customer_group_id'] == $product_special['customer_group_id']) { ?>
              <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </td>
          <td class="right"><input type="text" name="product_special[<?php echo $special_row; ?>][priority]" value="<?php echo $product_special['priority']; ?>" size="2" /></td>
          <td class="right"><input type="text" name="product_special[<?php echo $special_row; ?>][price]" value="<?php echo $product_special['price']; ?>" /></td>
          <td class="left"><input type="text" name="product_special[<?php echo $special_row; ?>][date_start]" value="<?php echo $product_special['date_start']; ?>" class="date" /></td>
          <td class="left"><input type="text" name="product_special[<?php echo $special_row; ?>][date_end]" value="<?php echo $product_special['date_end']; ?>" class="date" /></td>
          <td class="left"><a onclick="$('#special-row<?php echo $special_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
        </tr>
        <?php $special_row++; ?>
        <?php } ?>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="5"></td>
          <td class="left"><a onclick="addSpecial();" class="button"><?php echo $button_add_special; ?></a></td>
        </tr>
      </tfoot>
    </table>
<script type="text/javascript"><!--
var special_row = <?php echo $special_row; ?>;

function addSpecial() {
  html  = '  <tr id="special-row' + special_row + '">';
  html += '    <td class="left"><select name="product_special[' + special_row + '][customer_group_id]">';
  <?php foreach ($customer_groups as $customer_group) { ?>
  html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>';
  <?php } ?>
  html += '    </select></td>';
  html += '    <td class="right"><input type="text" name="product_special[' + special_row + '][priority]" value="" size="2" /></td>';
  html += '    <td class="right"><input type="text" name="product_special[' + special_row + '][price]" value="" /></td>';
  html += '    <td class="left"><input type="text" name="product_special[' + special_row + '][date_start]" value="" class="date" /></td>';
  html += '    <td class="left"><input type="text" name="product_special[' + special_row + '][date_end]" value="" class="date" /></td>';
  html += '    <td class="left"><a onclick="$(\'#special-row' + special_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
  html += '  </tr>';

  $('#specials').append(html);

  $('#special-row' + special_row + ' .date').datepicker({dateFormat: 'yy-mm-dd'});

  special_row++;
}
//--></script>
    <?php break;
  case 'filters': ?>
    <table class="form">
      <tr>
        <td colspan="2">
          <select id="filter_group" style="margin-bottom: 5px;" onchange="getFilters();">
            <?php foreach ($filter_groups as $filter_group) { ?>
            <option value="<?php echo $filter_group['filter_group_id']; ?>"><?php echo $filter_group['name']; ?></option>
            <?php } ?>
          </select>
        </td>
        <td ><input type="text" name="filter" value="" placeholder="<?php echo $text_autocomplete; ?>" /></td>
      </tr>
      <tr>
        <td style="padding-right:0px;"><select multiple="multiple" id="filter" style="height:200px;width:350px;"></select></td>
        <td style="vertical-align: middle;" width="1">
          <input type="button" value="--&gt;" onclick="addLink();" /><br />
        <td style="padding-left:0px;" >
          <div id="product-filter" class="scrollbox" style="height:200px;">
            <?php foreach ($product_filters as $product_filter) { ?>
            <div id="product-filter<?php echo $product_filter['filter_id']; ?>"><?php echo $product_filter['group']; ?> &gt; <?php echo $product_filter['name']; ?><img src="view/image/delete.png" />
              <input type="hidden" name="product_filters[]" value="<?php echo $product_filter['filter_id']; ?>" />
            </div>
            <?php } ?>
          </div>
        </td>
      </tr>
    </table>
<script type="text/javascript"><!--
$('input[name=\'filter\']').autocomplete({
  delay: 400,
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item.name,
            value: item.filter_id
          }
        }));
      }
    });

  },
  select: function(event, ui) {
    $('#product-filter' + ui.item.value).remove();

    $('#product-filter').append('<div id="product-filter' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" /><input type="hidden" name="product_filters[]" value="' + ui.item.value + '" /></div>');

    return false;
  },
  focus: function(event, ui) {
      return false;
   }
});

$('#product-filter div img').live('click', function() {
  $(this).parent().remove();
});

function addLink() {
    $('#filter :selected').each(function() {
        $('#product-filter' + $(this).attr('value')).remove();

        $('#product-filter').append('<div id="product-filter' + $(this).attr('value') + '">' + $(this).attr('data-group') + ' &gt; ' + $(this).text() + '<img src="view/image/delete.png" /><input type="hidden" name="product_filters[]" value="' + $(this).attr('value') + '" /></div>');
    });
}

function getFilters() {
    $('#filter option').remove();
    $.ajax({
        url: 'index.php?route=catalog/product_ext/filter&token=<?php echo $token; ?>&filter_group_id=' + $('#filter_group').attr('value'),
        dataType: 'json',
        success: function(data) {
            for (i = 0; i < data.length; i++) {
                $('#filter').append('<option value="' + data[i]['filter_id'] + '" data-group="' + data[i]['group'] + '">' + data[i]['name'] + '</option>');
            }
        }
    });
}
getFilters();
//--></script>
    <?php break;
  case 'related': ?>
    <table class="form">
      <tr>
        <td colspan="2">
          <select id="category" style="margin-bottom: 5px;" onchange="getProducts();">
            <?php foreach ($categories as $category) { ?>
            <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
            <?php } ?>
          </select>
        </td>
        <td ><input type="text" name="related" value="" placeholder="<?php echo $text_autocomplete; ?>" /></td>
      </tr>
      <tr>
        <td style="padding-right:0px;"><select multiple="multiple" id="product" style="height:200px;width:350px;"></select></td>
        <td style="vertical-align: middle;" width="1">
          <input type="button" value="--&gt;" onclick="addLink();" /><br />
        <td style="padding-left:0px;" >
          <div id="product-related" class="scrollbox" style="height:200px;">
            <?php foreach ($product_related as $product_related) { ?>
            <div id="product-related<?php echo $product_related['product_id']; ?>"> <?php echo $product_related['name'] . ' (' . $product_related['model'] . ')'; ?><img src="view/image/delete.png" />
              <input type="hidden" name="product_related[]" value="<?php echo $product_related['product_id']; ?>" />
            </div>
            <?php } ?>
          </div>
        </td>
      </tr>
    </table>
<script type="text/javascript"><!--
$('input[name=\'related\']').autocomplete({
  delay: 0,
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=catalog/product_ext/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item.name + ' (' + item.model + ')',
            value: item.product_id
          }
        }));
      }
    });

  },
  select: function(event, ui) {
    $('#product-related' + ui.item.value).remove();

    $('#product-related').append('<div id="product-related' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" /><input type="hidden" name="product_related[]" value="' + ui.item.value + '" /></div>');

    return false;
  },
  focus: function(event, ui) {
      return false;
   }
});

$('#product-related div img').live('click', function() {
  $(this).parent().remove();
});

function addLink() {
    $('#product :selected').each(function() {
        $('#product-related' + $(this).attr('value')).remove();

        $('#product-related').append('<div id="product-related' + $(this).attr('value') + '">' + $(this).text() + '<img src="view/image/delete.png" /><input type="hidden" name="product_related[]" value="' + $(this).attr('value') + '" /></div>');
    });
}

function getProducts() {
    $('#product option').remove();
    $.ajax({
        url: 'index.php?route=catalog/product_ext/category&token=<?php echo $token; ?>&category_id=' + $('#category').attr('value'),
        dataType: 'json',
        success: function(data) {
            for (i = 0; i < data.length; i++) {
                $('#product').append('<option value="' + data[i]['product_id'] + '">' + data[i]['name'] + ' (' + data[i]['model'] + ') </option>');
            }
        }
    });
}
getProducts();
//--></script>
    <?php break;
  case 'descriptions': ?>
    <div id="languages" class="htabs">
      <?php foreach ($languages as $language) { ?>
      <a href="#language<?php echo $language['language_id']; ?>"><img src="<?php echo DIR_FLAGS_NAME; ?><?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
      <?php } ?>
    </div>
    <?php foreach ($languages as $language) { ?>
    <div id="language<?php echo $language['language_id']; ?>">
      <textarea name="product_description[<?php echo $language['language_id']; ?>][description]" id="description<?php echo $language['language_id']; ?>"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['description'] : ''; ?></textarea>
    </div>
    <?php } ?>
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('description<?php echo $language['language_id']; ?>', {
  filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
  filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
  filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
  filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
  filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
  filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
$('#languages a').tabs();
//--></script>
    <?php break;
  default:
    break;
}
?>
  </form>
</div>
