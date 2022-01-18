<?php 
require_once "include/require.php";
startSingleSession();

$eleve_name;
$eleve_id;
if(isset($_POST['save'])){
  if(!empty($_POST['nom'])){
    extract($_POST);
    executeQuery("INSERT INTO `cours`(`name`, `professeur_id`, `classe_id`) VALUES('$nom', 
    	$professeur_id,$classe_id)");
  }
}
if(isset($_POST['update'])){
  if(!empty($_POST['nom'])){
    extract($_POST);
    executeQuery("UPDATE `eleve` SET `nom` = '$nom', `prenom` = '$prenom', 
      classe_id = $classe_id WHERE id=". $_GET['id']);
    $eleve_name = "";
    $eleve_id = "";
    $classe_id = "";
  }
}

if(isset($_GET['id'])){
  $id = intval($_GET['id']);
  if($_GET['action'] == "modifier"){
    
  }
  if($_GET['action'] == "delete"){
    executeQuery("DELETE FROM cours WHERE id =". $id);
    
  }
}

$departements = selectAll("departement");
$facultes = selectAll("faculte");
$eleves = selectAll("eleve");
$classes = selectAll("classe");
$professeurs = selectAll("professeur");
$cours = selectAll("cours");

 include "include/header.php";
?>
<div>
  
  <form action="" method="post">
    <div>
      <input type="hidden" name="id" value="<?= $eleve_id??"" ?>">

      <label for="">NOM DU COURS </label>
      <input type="text" name="nom"  value="<?= $eleve_name ?? "" ?>"  required=""> 
      
      <label for="">FACULTE | CLASSE</label>
      <select name="classe_id" required> 
        <option value="">...</option>

        <?php foreach($classes as $val): ?>
          <option value="<?= $val['id'] ?>" <?php if(isset($classe_id_value) and $classe_id_value == $val['id']) :?> selected  <?php endif ?>> 
            <?php 
            echo getEntryInTable($facultes, $val['departement_id'])['name'] ?> |
            <?= $val['name'] ?>
          </option>
        <?php endforeach; ?>
      </select>

      <label for="">PROFESSEUR</label>

      <select  name="professeur_id" required>
      	<option option="">Select</option>
        <?php foreach($professeurs as $val): ?>
        	<option value="<?= $val['id'] ?>">
        		<?= $val['nom'] ?>
        		<?= $val['prenom'] ?>
        	</option>
         <?php endforeach; ?>
      </select>
      <label></label>
      <?php if(isset($eleve_id)): ?>
      <input class="btn btn-outline-info" type="submit" name="update" value="Modifier">
    <?php else: ?>
       <input class="btn btn-outline-primary" type="submit" name="save" value="Enregistrer">
    <?php endif ?>
    </div>
  </form>

  <div>
    <h5>Liste des Cours</h5>
    <table>
      <thead>
        <tr>
          <th># </th>
          <th>NUMERO </th>
          <th>NOM</th>
          <th>PRENOM</th>
          <th>FACULTE | CLASSE</th>
          
          <th>ACTION</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($cours  as $key => $value) : ?>
        <tr>
          <td><?= ++$key  ?></td>
          <td><?= $value['id'] ?></td>
          <td><?= $value['name'] ?></td>
          <td>
          	<?= getEntryInTable($professeurs, $value['professeur_id'])['nom'] ?>
          	<?= getEntryInTable($professeurs, $value['professeur_id'])['prenom'] ?>
          </td>
          <td>
            <?php 
             $cl = selectById('classe', $value['classe_id']);
             $fac = selectById('faculte', $cl['departement_id']);
             echo(($fac['name'] ?? '') .' | '. $cl['name']  );

            ?>
           
          </td>
         
           </td>
          <td>
            <!-- <a href="cours.php?action=modifier&&id=<?= $value['id'] ?>">Modifier</a> -->
            <a class="btn btn-outline-danger" href="cours.php?action=delete&&id=<?= $value['id'] ?>" onclick="return confirm('êtes-vous sûr ?')">Supprimer</a>
           
          </td>
        </tr>

       <?php endforeach; ?>
      </tbody>
    </table>
  </div>
</div>

<?php 
  include "include/footer.php";
?>