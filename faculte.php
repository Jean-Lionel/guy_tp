<?php 
require_once "include/require.php";
startSingleSession();

$departement_name;
$departement_id;
if(isset($_POST['save'])){
  if(!empty($_POST['name'])){
    extract($_POST);
    executeQuery("INSERT INTO `departement`( `name`,`faculte_id`) VALUES ('$name',$faculte_id)");
  }
}
if(isset($_POST['update'])){
  if(!empty($_POST['name'])){
    extract($_POST);
    executeQuery("UPDATE `departement` SET `name` = '$name', 
      faculte_id = $faculte_id WHERE id=". $_GET['id']);
    $departement_name = "";
    $departement_id = "";
    $faculte_id = "";
  }
}

if(isset($_GET['id'])){
  $id = intval($_GET['id']);
  if($_GET['action'] == "modifier"){
    $departement = selectById("departement", $id);
    $departement_name = $departement['name'];
    $departement_id = $departement['id'];
    $faculte_id_value = $departement['faculte_id'];
  }
  if($_GET['action'] == "delete"){
    executeQuery("DELETE FROM departement WHERE id =". $id); 
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
      <input type="text" name="name"  value="<?= $departement_name ?? "" ?>"  required="">
      <label for=""> DEPARTEMENT</label>
      <select name="faculte_id"> 
        <option value="">...</option>
        <?php foreach($facultes as $val): ?>
          <option value="<?= $val['id'] ?>" <?php if(isset($faculte_id_value) and $faculte_id_value == $val['id']) :?> selected  <?php endif ?>> <?= $val['name'] ?></option>
        <?php endforeach; ?>
      </select>
      <label for=""></label>
      <label for=""></label>
      <label for=""></label>

      <?php if(isset($departement_id)): ?>
      <input type="submit" name="update" value="Modifier">
    <?php else: ?>
       <input type="submit" name="save" value="Enregistrer">
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
          <th> DEPARTEMENT</th>
          <th>FACULTE</th>
          <th>ACTION</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($departements  as $key => $value) : ?>
        <tr>
          <td><?= ++$key  ?></td>
          <td><?= $value['id'] ?></td>
          <td>
            <?= 
              selectById('faculte', $value['faculte_id'])['name']
           ?>
           </td>
          <td><?= $value['name'] ?></td>
          <td>
            <a href="departement.php?action=modifier&&id=<?= $value['id'] ?>">Modifier</a>
            <a href="departement.php?action=delete&&id=<?= $value['id'] ?>" onclick="return confirm('êtes-vous sûr ?')">Supprimer</a>
           
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