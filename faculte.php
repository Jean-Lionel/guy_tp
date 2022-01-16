<?php 
require_once "include/require.php";
startSingleSession();

$faculte_name;
$departement_id;
if(isset($_POST['save'])){
  if(!empty($_POST['name'])){
    extract($_POST);
    $sql = "INSERT INTO `faculte`( `name`,`departement_id`) VALUES ('$name',$departement_id)";
    $departement_id = 0;
    executeQuery($sql);
  }
}
if(isset($_POST['update'])){
  if(!empty($_POST['name'])){
    extract($_POST);
    executeQuery("UPDATE `faculte` SET `name` = '$name', 
      departement_id = $departement_id WHERE id=". $_GET['id']);
    $faculte_name = "";
    $departement_id = "";
    $departement_id = "";
  }
}

if(isset($_GET['id'])){
  $id = intval($_GET['id']);
  if($_GET['action'] == "modifier"){
    $faculte = selectById("faculte", $id);
    $faculte_name = $faculte['name'];
    $departement_id = $faculte['id'];
    $departement_id_value = $faculte['departement_id'];
  }
  if($_GET['action'] == "delete"){
    executeQuery("DELETE FROM faculte WHERE id =". $id); 
  }
}

$facultes = selectAll("faculte");
$departements = selectAll("departement");


include "include/header.php";
?>
<div>
  
  <form action="" method="post">
    <div>
      <input type="hidden" name="id" value="<?= $departement_id??"" ?>">

      <label for="">FACULTE</label>
      <input type="text" name="name"  value="<?= $faculte_name ?? "" ?>"  required="">
      <label for=""> Departement</label>
      <select name="departement_id"> 
        <option value="">...</option>
        <?php foreach($departements as $val): ?>
         <option value="<?= $val['id'] ?>"><?= $val['name'] ?></option>
        <?php endforeach; ?>
      </select>
      <label for=""></label>
      <label for=""></label>
      <label for=""></label>

      <?php if(isset($departement_id) and (intval($departement_id) != 0)): ?>
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
           <th>FACULTE</th>
          <th> DEPARTEMENT</th>
          <th>ACTION</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($facultes  as $key => $value) : ?>
        <tr>
          <td><?= ++$key  ?></td>
          <td><?= $value['id'] ?></td>
          <td><?= $value['name'] ?></td>
          <td>
            <?= 
              selectById('departement', $value['departement_id'])['name']
           ?>
           </td>
          
          <td>
            <a class="btn btn-outline-info" href="faculte.php?action=modifier&&id=<?= $value['id'] ?>">Modifier</a>
            <a class="btn btn-outline-danger" href="faculte.php?action=delete&&id=<?= $value['id'] ?>" onclick="return confirm('êtes-vous sûr ?')">Supprimer</a>
           
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