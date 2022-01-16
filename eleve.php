<?php 
require_once "include/require.php";
startSingleSession();

$eleve_name;
$eleve_id;
if(isset($_POST['save'])){
  if(!empty($_POST['nom']) && !empty($_POST['prenom'])){
    extract($_POST);

    executeQuery("INSERT INTO `eleve`( `nom`,`prenom`,`classe_id`) VALUES 
      ('$nom', '$prenom',$classe_id)");
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
    $eleve = selectById("eleve", $id);
    $eleve_name = $eleve['nom'];
    $eleve_prenom = $eleve['prenom'];
    $eleve_id = $eleve['id'];
    $classe_id_value = $eleve['classe_id'];
  }
  if($_GET['action'] == "delete"){
    executeQuery("DELETE FROM eleve WHERE id =". $id);
    
  }
}

$departements = selectAll("departement");
$facultes = selectAll("faculte");
$eleves = selectAll("eleve");
$classes = selectAll("classe");

  include "include/header.php";
?>
<div>
  
  <form action="" method="post">
    <div>
      <input type="hidden" name="id" value="<?= $eleve_id??"" ?>">

      <label for="">NOM </label>
      <input type="text" name="nom"  value="<?= $eleve_name ?? "" ?>"  required=""> 
      <label for="">PRENOM </label>
      <input type="text" name="prenom"  value="<?= $eleve_prenom ?? "" ?>"  required="">
      <label for=""> FACULTE | CLASSE</label>
      <select name="classe_id" required> 
        <option value="">...</option>

        <?php foreach($classes as $val): ?>
          <option value="<?= $val['id'] ?>" <?php if(isset($classe_id_value) and $classe_id_value == $val['id']) :?> selected  <?php endif ?>> 
            <?= getEntryInTable($facultes, $val['departement_id'])['name'] ?> |
        
            <?= $val['name'] ?>
          </option>
        <?php endforeach; ?>
      </select>

      <label for=""></label>

      <?php if(isset($eleve_id)): ?>
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
        <?php foreach ($eleves  as $key => $value) : ?>
        <tr>
          <td><?= ++$key  ?></td>
          <td><?= $value['id'] ?></td>
          <td><?= $value['nom'] ?></td>
          <td><?= $value['prenom'] ?></td>
          <td>
            <?= getEntryInTable($classes, $val['classe_id'] ?? 0)['name'] ?>
      
            
          </td>

           </td>
           <td>
            <?php 
            $fac_id = getEntryInTable($classes, $val['classe_id'] ?? 0)['departement_id'];
            echo getEntryInTable($facultes, $fac_id)['name'];
           ?> 
           </td>
          <td>
            <a class="btn btn-outline-info" href="eleve.php?action=modifier&&id=<?= $value['id'] ?>">Modifier</a>
            <a class="btn btn-outline-danger" href="eleve.php?action=delete&&id=<?= $value['id'] ?>" onclick="return confirm('êtes-vous sûr ?')">Supprimer</a>
           
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