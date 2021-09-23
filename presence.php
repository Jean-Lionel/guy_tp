<?php 
require_once "include/require.php";
startSingleSession();

$class_id = isset($_GET['class_id']) ? $_GET['class_id'] : 0 ;

if(isset($_GET['is_absente'])){
  $is_absente = $_GET['is_absente'];
  $professeur_id = $_SESSION['user']['id'] ?? 0;
  $sql = "INSERT INTO `presences`(`eleve_id`, `professeur_id`, `present_time`,is_present) VALUES 
  ($is_absente ,$professeur_id,now(),0)";
  executeQuery($sql);
  
}
if(isset($_GET['is_present'])){
  $is_present = $_GET['is_present'];
   $professeur_id = $_SESSION['user']['id'] ?? 0;

    $sql = "INSERT INTO `presences`(`eleve_id`, `professeur_id`, `present_time`,is_present) VALUES 
  ($is_present ,$professeur_id,now(),1)";
   executeQuery($sql);
}
$name =  isset($_GET['name']) ? $_GET['name'] : "" ;

$departements = selectAll("departement");
$facultes = selectAll("faculte");
$classes = selectAll("classe");
$eleves = [];
if(isset($class_id) && $class_id){
  $eleves = customerSelect("SELECT * FROM eleve WHERE classe_id=". $class_id );
}


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
        <?php $val = checkStudentIsCalled($el['id']); if( $val ) :  ?> 
          <?php if($val['is_present']) : ?>
            <div class="present">PRESENT</div>
          <?php else: ?>
            <div class="abscent">ABSENT</div>
          <?php endif; ?>
        <?php else : ?>
        <div class="btn_presence">
            <button onclick="is_absente(<?= $el['id'] ?>)"> ABSCENT </button>
            <button onclick="is_present(<?= $el['id'] ?>)"> PRESENT </button>
        </div>
      <?php endif; ?>
      </div>
     <?php endforeach ?>
  </div>

</div>
<script>

  let class_id = document.querySelector("#class_id")
  class_id.addEventListener("change", (e)=>{
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