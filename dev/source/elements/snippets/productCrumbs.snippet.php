<?php

$output = '';

if ($productType = $modx->getObject('catalogProductType', array(
    'template_id' => $modx->resource->template
))) {

    if ($productFilters = $productType->getMany('ProductTypeFilters')) {

        foreach ($productFilters as $productFilter) {

            if ($filter = $productFilter->getOne('Filter')) {

                $q = $modx->newQuery('modResource');
                $q->where(array(
                    'template'  => $productType->seo_template_id
                    ,'hidemenu'  => 0
                    ,'published'    => 1
                    ,'deleted'  => 0
                ));
                $q->leftJoin('modTemplateVar', 'tv', "tv.name = '{$filter->tv_key}'");

                if ($filter->multiple == 'listbox'){
                    $q->innerJoin('modTemplateVarResource', 'ResourceTV', "ResourceTV.contentid = modResource.id AND ResourceTV.tmplvarid = tv.id AND ResourceTV.value = {$modx->resource->getTVValue($filter->tv_key)}");

                    if ($resource = $modx->getObject('modResource', $q)) {
                        $title = ($resource->menutitle) ? $resource->menutitle : $resource->pagetitle ;
                        $output .= "<a href=\"{$resource->uri}\" class=\"breadcrumb\">{$title}</a>";
                    }
                }
            }
        }
    }
}

return $output;