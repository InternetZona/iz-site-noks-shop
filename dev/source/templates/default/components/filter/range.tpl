<select name="filter[price_range]" class="filter__control">
    <option value="" selected>-</option>

    {$price_range = [
    [
    'key'   => '0:150000'
    ,'value'    => 'до 150 000'
    ]
    ,[
    'key'   => '150000:200000'
    ,'value'    => '150 000 - 200 000'
    ]
    ,[
    'key'   => '200000:0'
    ,'value'    => 'от 200 000'
    ]
    ]}

    {foreach $price_range as $range}
        {$selected = ($range.key == $smarty.get.filter.price_range) ? 'selected' : '' }
        <option value="{$range.key}" {$selected}>{$range.value}</option>
    {/foreach}
</select>
