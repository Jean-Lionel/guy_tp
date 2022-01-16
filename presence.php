<?php 
require_once "include/require.php";
startSingleSession();

$class_id = isset($_GET['class_id']) ? $_GET['class_id'] : 0 ;
$cours_id = isset($_GET['cours_id']) ? $_GET['cours_id'] : 0 ;

if(isset($_GET['is_absente'])){
  $is_absente = $_GET['is_absente'];
  $professeur_id = $_SESSION['user']['id'] ?? 0;
  $sql = "INSERT INTO `presences`(`eleve_id`, `professeur_id`,cours_id, `present_time`,is_present) VALUES 
  ($is_absente ,$professeur_id,$cours_id,now(),0)";
  executeQuery($sql);
  
}
if(isset($_GET['is_present'])){
  $is_present = $_GET['is_present'];
   $professeur_id = $_SESSION['user']['id'] ?? 0;

    $sql = "INSERT INTO `presences`(`eleve_id`, `professeur_id`, `present_time`,is_present, cours_id) VALUES 
  ($is_present ,$professeur_id,now(),1, $cours_id)";
   executeQuery($sql);
}
$name =  isset($_GET['name']) ? $_GET['name'] : "" ;

$departements = selectAll("departement");
$facultes = selectAll("faculte");
$classes = selectAll("classe");
$eleves = [];

$cours = [];

if(isset($class_id) && $class_id){
  $cours = customerSelect("SELECT * FROM cours WHERE classe_id=". $class_id .' AND professeur_id='. $_SESSION['user']['id']);
}

if(isset($class_id) && $class_id && $cours_id){
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

                <?= getEntryInTable($facultes, $val['departement_id'])['name'] ?> |
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
            <div class="btn btn-primary" class="present">PRESENT</div>
          <?php else: ?>
            <div class="btn btn-danger" class="abscent">ABSENT</div>
          <?php endif; ?>
        <?php else : ?>
        <div class="btn_presence">
            <button class="btn btn-outline-danger" onclick="is_absente(<?= $el['id'] ?>)"> ABSCENT </button>
            <button class="btn btn-outline-primary" onclick="is_present(<?= $el['id'] ?>)"> PRESENT </button>
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
  let cours_id = document.querySelector("#cours_id")
  cours_id.addEventListener("change", (e)=>{
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