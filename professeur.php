<?php 
require_once "include/require.php";
startSingleSession();

$professeur_name;
$professeur_id;
if(isset($_POST['save'])){
  if(!empty($_POST['nom']) && !empty($_POST['prenom'])){
    extract($_POST);
   
    $password = sha1($password);
    executeQuery("INSERT INTO `professeur`( `nom`,`prenom`,`classe_id`,`login`, `password`) VALUES 
      ('$nom', '$prenom',$classe_id,'$login','$password')");
  }
}
if(isset($_POST['update'])){
  if(!empty($_POST['nom'])){
    extract($_POST);
    executeQuery("UPDATE `professeur` SET `nom` = '$nom', `prenom` = '$prenom', 
      classe_id = $classe_id WHERE id=". $_GET['id']);
    $professeur_name = "";
    $professeur_id = "";
    $classe_id = "";
  }
}

if(isset($_GET['id'])){
  $id = intval($_GET['id']);
  if($_GET['action'] == "modifier"){
    $professeur = selectById("professeur", $id);
    $professeur_name = $professeur['nom'];
    $professeur_prenom = $professeur['prenom'];
    $professeur_id = $professeur['id'];
    $classe_id_value = $professeur['classe_id'];
    $professeur_login = $professeur['login'];
  }
  if($_GET['action'] == "delete"){
    executeQuery("DELETE FROM professeur WHERE id =". $id);
    
  }
}

$departements = selectAll("departement");
$facultes = selectAll("faculte");
$professeurs = selectAll("professeur");
$classes = selectAll("classe");

include "include/header.php";
?>
<div>
  
  <form action="" method="post">
    <div>
      <input type="hidden" name="id" value="<?= $professeur_id??"" ?>">

      <label for="">NOM DU PROFESSEUR</label>
      <input type="text" name="nom"  value="<?= $professeur_name ?? "" ?>"  required=""> 
      <label for="">PRENOM DU PROFESSEUR</label>
      <input type="text" name="prenom"  value="<?= $professeur_prenom ?? "" ?>"  required="">
      <label for="">LOGIN</label>
      <input type="text" name="login"  value="<?= $professeur_login ?? "" ?>"  required="">
      <label for="">PASSWORD</label>
      <input type="password" name="password"  value=""  required="">
      <label for=""> FACULTE | CLASSE</label>

      <select name="classe_id" id="classe_id">
        <option value=""></option>

        <?php foreach($classes as $classe) :?>
          <option value="<?= $classe['id'] ?>"> 
        
          <?php 
            $dep = selectById('faculte',$classe['faculte_id']);

            echo($dep['name'] .' | '. $classe['name']);
           ?>

           </option>
        <?php endforeach; ?>
      </select>
     <!--  <select name="classe_id" required> 
        <option value="">...</option>

        <?php foreach($classes as $val): ?>
          <option value="<?= $val['id'] ?>" <?php if(isset($classe_id_value) and $classe_id_value == $val['id']) :?> selected  <?php endif ?>> 
            <?php 
           $fac_id = getEntryInTable($classes, $val['classe_id'] ?? 0)['departement_id'];
            echo getEntryInTable($facultes, $fac_id)['name'];
           ?> | 
            <?= $val['name'] ?>
          </option>
        <?php endforeach; ?>
      </select> -->
      <label></label>

      <?php if(isset($professeur_id)): ?>
      <input class="btn btn-outline-info" type="submit" name="update" value="Modifier">
    <?php else: ?>
       <input class="btn btn-outline-primary" type="submit" name="save" value="Enregistrer">
    <?php endif ?>
    </div>
  </form>

  <div>
    <h5>Liste des Facultés</h5>
    <table>
      <thead>
        <tr>
          <th># </th>
          <th>NUMERO </th>
          <th>NOM</th>
          <th>PRENOM</th>
          <th>CLASSE</th>
          <th>FACULTE</th>
          <th>ACTION</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($professeurs  as $key => $value) : ?>

        <tr>
          <td><?= ++$key  ?></td>
          <td><?= $value['id'] ?></td>
          <td><?= $value['nom'] ?></td>
          <td><?= $value['prenom'] ?></td>
          <td>
            <?php
            $cl = selectById('classe', $value['classe_id']);
             echo($cl['name'] ?? '');
             ?>
            
          </td>
          <td>
            <?php 
            $fac_id = $cl['faculte_id'] ?? 0;

             $fac = selectById('faculte', $fac_id);
             echo($fac['name'] ?? '');
           ?>
           </td>
           
          <td>
            <a class="btn btn-outline-info" href="professeur.php?action=modifier&&id=<?= $value['id'] ?>">Modifier</a>
            <!-- <a href="professeur.php?action=delete&&id=<?= $value['id'] ?>" onclick="return confirm('êtes-vous sûr ?')">Supprimer</a> -->
           
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