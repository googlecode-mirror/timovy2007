<?php echo $form->create('Stat',array('action'=> "export")); ?>
<?php echo $form->label('Stat.name_'.$lang,'__STATISTIKY NA VYBER',null); ?>
<?php echo $form->select('Stat.id',$statistics,'1',null,false); ?><br />
<?php echo $form->submit('__Vygenerovat excel'); ?>
<?php echo $form->end();?>


<span style="color: red;">
TODO:
Urobit daky pekny form na vyber statistiky a asi odstranit kecy co su dole pod tymto
</span>
<br /><br />

<h1>Zoznam štatistík</h1>

<h2>Štatistika prístupov</h2>
<small>Generated: 16.12.2007</small>
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Praesent neque sem, feugiat ut, bibendum laoreet, gravida et, leo. Sed laoreet. Proin arcu. Sed eget odio. Donec lorem. Mauris ornare, eros sed vehicula rhoncus, quam purus malesuada sem, ut viverra ipsum turpis nec tellus. Nam hendrerit</p>
<a href="">Stiahnuť pristupy.xls</a>, 
<a href="">Zobraziť</a>

<h2>Štatistika profilov</h2>
<small>Generated: 16.12.2007</small>
<p>
Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Praesent neque sem, feugiat ut, bibendum laoreet, gravida et, leo. Sed laoreet. Proin arcu. Sed eget odio. Donec lorem. Mauris ornare, eros sed vehicula rhoncus, quam purus malesuada sem, ut viverra ipsum turpis nec tellus. Nam hendrerit</p>
<a href="">Stiahnuť profily.xls</a>, 
<a href="">Zobraziť</a>

<h2>Štatistika výsledkov ankiet</h2>
<small>Generated: 16.12.2007</small>
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Praesent neque sem, feugiat ut, bibendum laoreet, gravida et, leo. Sed laoreet. Proin arcu. Sed eget odio. Donec lorem. Mauris ornare, eros sed vehicula rhoncus, quam purus malesuada sem, ut viverra ipsum turpis nec tellus. Nam hendrerit </p>
<a href="">Stiahnuť ankety.xls</a>, 
<a href="">Zobraziť</a>



