<?php 
require_once "include/require.php";

$class_id = isset($_GET['class_id']) ? $_GET['class_id'] : 0 ;

$name =  isset($_GET['name']) ? $_GET['name'] : "" ;

$departements = selectAll("departement");
$facultes = selectAll("faculte");
$classes = selectAll("classe");

$eleves = customerSelect("SELECT * FROM eleve WHERE classe_id=". $class_id );

include "include/header.php";
?>

<div>
  <div>
    <form action="" id="form">
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
         <label for="">Nom </label>
         <input type="text" name="name" value="<?= $name  ?>"/>
    </form>

  </div>

  <div class="student_room">
     <?php foreach($eleves as $el):?>
      <div class="item_eleve">
        <b><?= ucfirst($el['nom'] ?? "").' '. ucfirst($el['prenom'] ?? "")   ?></b>
        <div> 
          <?= date('d/m/Y à H:i') ?>
        </div>
        <div class="btn_presence">
          <button> ABSCENT </button>
          <button> PRESENT </button>
        </div>
      </div>
     <?php endforeach ?>
  </div>

</div>
<script>

  let class_id = document.querySelector("#class_id")
  class_id.addEventListener("change", (e)=>{
    document.querySelector("form").submit()
  })
</script>
<?php 
  include "include/footer.php";
?>