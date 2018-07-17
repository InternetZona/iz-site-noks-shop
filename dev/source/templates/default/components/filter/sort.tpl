<select name="sorting" class="filter__control filter__control--sorting">
    <option value="">-</option>
    {$selected = ($smarty.get.sorting == "price_asc") ? 'selected' : ''}
    <option value="price_asc" {$selected}>по возрастанию цены</option>
    {$selected = ($smarty.get.sorting == "price_desc") ? 'selected' : ''}
    <option value="price_desc" {$selected}>по убыванию цены</option>
    {$selected = ($smarty.get.sorting == "sale") ? 'selected' : ''}
    <option value="sale" {$selected}>сначала со скидкой</option>
</select>