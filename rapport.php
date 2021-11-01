<?php 
require_once "include/require.php";
startSingleSession();

$class_id = isset($_GET['class_id']) ? $_GET['class_id'] : 0 ;
$cours_id = isset($_GET['cours_id']) ? $_GET['cours_id'] : 0 ;

$date_presence =  isset($_GET['date_presence']) ? $_GET['date_presence'] : "" ;

$departements = selectAll("departement");
$facultes = selectAll("faculte");
$classes = selectAll("classe");
$eleves = [];

$cours = [];
$presences  = [];

if(isset($class_id) && $class_id){
  $cours = customerSelect("SELECT * FROM cours WHERE classe_id=". $class_id .' AND professeur_id='. $_SESSION['user']['id']);
}

if(isset($class_id) && $class_id && $cours_id){
  $eleves = customerSelect("SELECT * FROM eleve WHERE classe_id=". $class_id );
}

if($date_presence && $class_id && $cours_id){
  $presences = customerSelect("SELECT * FROM presences WHERE 
    professeur_id=". $_SESSION['user']['id'] . " AND cours_id=". $cours_id. " AND present_time LIKE '$date_presence%'");
}


include "include/header.php";
?>

<div>
  <div>
    <form action="" id="form" class="no_printable">
        <label for="">Classe</label>
        <select name="class_id" id="class_id">
          <option value="">...</option>
          <?php foreach($classes as $val) : ?>
            <option value="<?= $val['id'] ?>" <?php if(isset($class_id ) and $class_id  == $val['id']) :?> selected  <?php endif ?>> 
                <?= getEntryInTable($facultes, $val['id'])['name'] ?> |
                <?php 
                $fac_id = getEntryInTable($facultes, $val['id'])['id'];
                echo getEntryInTable($departements, $fac_id)['name'] ?> |
                <?= $val['name'] ?>
              </option>
          <?php endforeach ?>
        </select> 

        <label for="">Cours</label>
        <select name="cours_id" id="cours_id">
          <option value="">...</option>
          <?php foreach($cours as $val) : ?>
            <option value="<?= $val['id'] ?>" 
              <?php if(isset($cours_id ) and $cours_id  == $val['id']) :?> selected  <?php endif ?>> 
                <?= $val['name']; ?>
              </option>
          <?php endforeach ?>
        </select>
         <label for="">Date </label>
         <input type="date" id="date_presence" name="date_presence" 
         value="<?= $date_presence  ?>"/>
    </form>

  </div>

  <div class="">
    
    <h4 style="text-align: center;">LISTE DES PRESENCE DU <?= $date_presence ?>
      
      <button id="print" class="no_printable">Imprimer</button>
    </h4>
    <table class="rapport">
      <thead>
        <tr>
          <th>NUMERO </th>
          <th>NOM ET PRENOM</th>
          <th>MENTION</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach($presences as $key => $el):?>
        <tr>
          <td><?= $el['eleve_id'] ?></td>
          <td><?php $eleve = getEntryInTable($eleves, $el['eleve_id']);

          echo $eleve['nom'] .' '.$eleve['prenom'];

           ?></td>

          <td><?= $el['is_present'] ? "P" : "A"  ?></td>
        
        </tr>
        <?php endforeach ?>
      </tbody>
    </table>


     
  </div>

</div>
<script>

  let print = document.querySelector("#print")

  print.addEventListener("click", (e)=>{
    e.preventDefault();
    window.print();
  })

  let class_id = document.querySelector("#class_id")
  class_id.addEventListener("change", (e)=>{
    document.querySelector("form").submit()
  })
  let cours_id = document.querySelector("#cours_id")
  cours_id.addEventListener("change", (e)=>{
    document.querySelector("form").submit()
  })
  let date_presence = document.querySelector("#date_presence")
  date_presence.addEventListener("change", (e)=>{
    document.querySelector("form").submit()
  })

  function is_absente(id){
    window.location = window.location.href + "&is_absente="+id;
    //console.log('Je suis un future milliardaire');
  }

  function is_present(id){
    window.location = window.location.href + "&is_present="+id;
  }
</script>
<?php 
  include "include/footer.php";
?>