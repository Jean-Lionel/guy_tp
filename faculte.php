<?php 
require_once "include/require.php";

$faculte_name;
$faculte_id;
if(isset($_POST['save'])){
  if(!empty($_POST['name'])){
    extract($_POST);
    executeQuery("INSERT INTO `faculte`( `name`) VALUES ('$name')");
  }
}
if(isset($_POST['update'])){
  if(!empty($_POST['name'])){
    extract($_POST);
    executeQuery("UPDATE `faculte` SET `name` = '$name' WHERE id=". $_GET['id']);
    $faculte_name = "";
    $faculte_id = "";
  }
}

if(isset($_GET['id'])){
  $id = intval($_GET['id']);
  if($_GET['action'] == "modifier"){
    $faculte = selectById("faculte", $id);
    $faculte_name = $faculte['name'];
    $faculte_id = $faculte['id'];
  }
  if($_GET['action'] == "delete"){
    executeQuery("DELETE FROM faculte WHERE id =". $id);
    
  }
}


$facultes = selectAll("faculte");


  include "include/header.php";
?>
<div>
  
  <form action="" method="post">
    <div>
      <input type="hidden" name="id" value="<?= $faculte_id??"" ?>">

      <label for="">FACULTE</label>
      <input type="text" name="name"  value="<?= $faculte_name ?? "" ?>"  required="">

      <?php if(isset($faculte_id)): ?>
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
          <th>FACULTE</th>
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
            <a href="faculte.php?action=modifier&&id=<?= $value['id'] ?>">Modifier</a>
            <a href="faculte.php?action=delete&&id=<?= $value['id'] ?>" onclick="return confirm('êtes-vous sûr ?')">Supprimer</a>
           
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