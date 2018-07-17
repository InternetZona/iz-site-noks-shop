{$total = 0}
<table style="border-collapse:collapse;width:100%;border-top:1px solid #dddddd;border-left:1px solid #dddddd;margin-bottom:20px">
    <thead>
    <tr>
        <td style="font-size:12px;border-right:1px solid #dddddd;border-bottom:1px solid #dddddd;background-color:#efefef;font-weight:bold;text-align:left;padding:7px;color:#222222">Товар</td>
        <td style="font-size:12px;border-right:1px solid #dddddd;border-bottom:1px solid #dddddd;background-color:#efefef;font-weight:bold;text-align:right;padding:7px;color:#222222; width:100px;">Цена</td>
    </tr>
    </thead>
    <tbody>
        {foreach $data as $value}

            {if $product = $modx->getObject('modResource', $value@key)}

                {$total = $total + $value}

                <tr>
                    <td style="font-size:12px;border-right:1px solid #dddddd;border-bottom:1px solid #dddddd;text-align:left;padding:7px">{$product->pagetitle}</td>
                    <td style="font-size:12px;border-right:1px solid #dddddd;border-bottom:1px solid #dddddd;text-align:right;padding:7px;">{$value|number_format:0:',':' '|cat:' руб.'}</td>
                </tr>

            {/if}

        {/foreach}
    </tbody>
    <tfoot>
    <tr>
        <td style="font-size:12px;border-right:1px solid #dddddd;border-bottom:1px solid #dddddd;text-align:right;padding:7px"><b>Итого:</b></td>
        <td style="font-size:12px;border-right:1px solid #dddddd;border-bottom:1px solid #dddddd;text-align:right;padding:7px"><b>{$total|number_format:0:',':' '|cat:' руб.'}</b></td>
    </tr>
    </tfoot>
</table>