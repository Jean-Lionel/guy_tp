<?php 
require_once "include/require.php";
startSingleSession();

$departement_name;
$departement_id;
if(isset($_POST['save'])){
  if(!empty($_POST['name'])){
    extract($_POST);
    executeQuery("INSERT INTO `departement`( `name`) VALUES ('$name')");
  }
}
if(isset($_POST['update'])){
  if(!empty($_POST['name'])){
    extract($_POST);
    executeQuery("UPDATE `departement` SET `name` = '$name' WHERE id=". $_GET['id']);
    $departement_name = "";
    $departement_id = "";
  }
}

if(isset($_GET['id'])){
  $id = intval($_GET['id']);
  if($_GET['action'] == "modifier"){
    $departement = selectById("departement", $id);
    $departement_name = $departement['name'];
    $departement_id = $departement['id'];
  }
  if($_GET['action'] == "delete"){
    executeQuery("DELETE FROM departement WHERE id =". $id);   
  }
}
$departements = selectAll("departement");
  include "include/header.php";
?>
<div>
  
  <form action="" method="post">
    <div>
      <input type="hidden" name="id" value="<?= $departement_id??"" ?>">

      <label for="">DEPARTEMENT</label>
      <input type="text" name="name"  value="<?= $departement_name ?? "" ?>"  required="">

      <?php if(isset($departement_id)): ?>
      <input class="btn btn-outline-info" type="submit" name="update" value="Modifier">
    <?php else: ?>
       <input class="btn btn-outline-primary" type="submit" name="save" value="Enregistrer">
    <?php endif ?>
    </div>
  </form>

  <div>
    <h5>Liste des DEPARTEMENTS</h5>
    <table>
      <thead>
        <tr>
          <th># </th>
          <th>NUMERO </th>
          <th>DEPARTEMENT</th>
          <th>ACTION</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($departements  as $key => $value) : ?>
        <tr>
          <td><?= ++$key  ?></td>
          <td><?= $value['id'] ?></td>
          <td><?= $value['name'] ?></td>
          <td>
            <a class="btn btn-outline-info" href="departement.php?action=modifier&&id=<?= $value['id'] ?>">Modifier</a>
            <a class="btn btn-outline-danger" href="departement.php?action=delete&&id=<?= $value['id'] ?>" onclick="return confirm('êtes-vous sûr ?')">Supprimer</a>
           
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