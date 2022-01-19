<?php 
require_once "include/require.php";

startSingleSession();

$classe_name;
$classe_id;
if(isset($_POST['save'])){
  if(!empty($_POST['name'])){
    extract($_POST);
    executeQuery("INSERT INTO `classe`( `name`,`departement_id`) VALUES ('$name',$departement_id)");
    $classe_name = "";
    $classe_id = "";
    $departement_id = "";
  }
}
if(isset($_POST['update'])){
  if(!empty($_POST['name'])){
    extract($_POST);
    executeQuery("UPDATE `classe` SET `name` = '$name', 
      departement_id = $departement_id WHERE id=". $_GET['id']);
    $classe_name = "";
    $classe_id = "";
    $departement_id = "";
  }
}

$departement_id_value = 0;

if(isset($_GET['id'])){
  $id = intval($_GET['id']);
  if($_GET['action'] == "modifier"){
    $classe = selectById("classe", $id);
    $classe_name = $classe['name'];
    $classe_id = $classe['id'];
    $departement_id_value = $classe['departement_id'];
  }
  if($_GET['action'] == "delete"){
    executeQuery("DELETE FROM classe WHERE id =". $id);
    
  }
}

$departements = selectAll("departement");
$facultes = selectAll("faculte");
$classes = selectAll("classe");
  include "include/header.php";
?>
<div>
  
  <form action="" method="post">
    <div>
      <input type="hidden" name="id" value="<?= $classe_id??"" ?>">
      <label for="">NOM DE LA CLASSE</label>
      <input type="text" name="name"  value="<?= $classe_name ?? "" ?>"  required="">
      <label for="">FACULTE </label>
      <select name="departement_id"> 
        <option value="">...</option>

        <?php foreach($facultes as $val): ?>
          <option value="<?= $val['id'] ?>" 
        > <?= $val['name'] ?></option>
        <?php endforeach; ?>
      </select>

      <?php if(isset($classe_id) and (intval($classe_id) != 0)): ?>
      <input class="btn btn-outline-info" type="submit" name="update" value="Modifier">
    <?php else: ?>
       <input class="btn btn-outline-primary" type="submit" name="save" value="Enregistrer">
    <?php endif ?>
    </div>
  </form>

  <div>
    <h5>Classes</h5>
    <table>
      <thead>
        <tr>
          <th># </th>
          <th>NUMERO </th>
          <th>FACULTE</th>
          <th>classe</th>
          <th>ACTION</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($classes  as $key => $value) : ?>
        <tr>
          <td><?= ++$key  ?></td>
          <td><?= $value['id'] ?></td>

          <td><?= getEntryInTable($facultes, $value['departement_id'])['name'] ?></td>

          <td><?= $value['name'] ?></td>
          <td>
            <a class="btn btn-outline-info" href="classe.php?action=modifier&&id=<?= $value['id'] ?>">Modifier</a>
            <a class="btn btn-outline-danger" href="classe.php?action=delete&&id=<?= $value['id'] ?>" onclick="return confirm('êtes-vous sûr ?')">Supprimer</a>
           
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